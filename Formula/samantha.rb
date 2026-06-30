# Homebrew formula for the Samantha voice assistant.
#
# Samantha is a cgo binary that dynamically links the sherpa-onnx and
# onnxruntime dylibs shipped inside the Go module. Upstream those libs are
# referenced via an rpath into the Go module cache, so the formula builds from
# source, bundles the dylibs into the keg, and repoints the binary at them.
class Samantha < Formula
  desc "Ultra-low-latency voice assistant for AI coding"
  homepage "https://github.com/lancekrogers/samantha"
  license "MIT"
  head "https://github.com/lancekrogers/samantha.git", branch: "main"

  # Stable release: tag a version upstream, then set url + sha256 and drop head.
  # url "https://github.com/lancekrogers/samantha/archive/refs/tags/v0.1.0.tar.gz"
  # sha256 "REPLACE_ON_RELEASE"

  depends_on "go" => :build

  def install
    odie "samantha currently supports macOS only" unless OS.mac?

    system "go", "build", "-ldflags", "-s -w", "-o", bin/"samantha", "./cmd/samantha"

    # The binary links the sherpa-onnx/onnxruntime dylibs via an rpath into the
    # build-time Go module cache. Bundle them and repoint the binary so it keeps
    # working once the build sandbox is gone.
    sherpa = Utils.safe_popen_read("go", "list", "-m", "-f", "{{.Dir}}",
                                   "github.com/k2-fsa/sherpa-onnx-go-macos").strip
    triple = Hardware::CPU.arm? ? "aarch64-apple-darwin" : "x86_64-apple-darwin"
    libexec.install Dir["#{sherpa}/lib/#{triple}/*.dylib"]

    # Swap the module-cache rpath for one pointing at the bundled dylibs, then
    # re-sign (rewriting the Mach-O invalidates the signature).
    MachO::Tools.change_rpath((bin/"samantha").to_s, "#{sherpa}/lib/#{triple}", "@loader_path/../libexec")
    system "codesign", "--force", "--sign", "-", bin/"samantha"
  end

  def caveats
    <<~EOS
      Samantha needs microphone access — grant it to your terminal app in
      System Settings -> Privacy & Security -> Microphone.
      Model files download automatically on first run.
    EOS
  end

  test do
    assert_match "samantha", shell_output("#{bin}/samantha --help")
  end
end
