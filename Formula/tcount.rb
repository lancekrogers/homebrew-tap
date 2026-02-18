class Tcount < Formula
  desc "Count tokens in files using various LLM tokenizers"
  homepage "https://github.com/lancekrogers/go-token-counter"
  version "0.2.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/lancekrogers/go-token-counter/releases/download/v0.2.0/tcount_0.2.0_darwin_arm64.tar.gz"
    sha256 "1c961ac8a7b643f5d42097e7052717c9299fc5d42f3cea698da2d80646bf7f56"
  elsif OS.mac?
    url "https://github.com/lancekrogers/go-token-counter/releases/download/v0.2.0/tcount_0.2.0_darwin_amd64.tar.gz"
    sha256 "6772319adb0325333d248b65adefc065fa133f53657a59d1182b5fd2e17b299d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/lancekrogers/go-token-counter/releases/download/v0.2.0/tcount_0.2.0_linux_arm64.tar.gz"
    sha256 "03394461c65a5289962a48179ae9b98149f003beca399105e5a29fa6fb4bc296"
  elsif OS.linux?
    url "https://github.com/lancekrogers/go-token-counter/releases/download/v0.2.0/tcount_0.2.0_linux_amd64.tar.gz"
    sha256 "d17fa522136a4e748b3c6406033e7cfb1264f5b022800099a5a0f25ba77e688c"
  end

  def install
    bin.install "tcount"
  end

  test do
    system bin/"tcount", "--version"
  end
end
