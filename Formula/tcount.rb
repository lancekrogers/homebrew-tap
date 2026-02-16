class Tcount < Formula
  desc "Count tokens in files using various LLM tokenizers"
  homepage "https://github.com/lancekrogers/go-token-counter"
  version "0.1.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/lancekrogers/go-token-counter/releases/download/v0.1.0/tcount_0.1.0_darwin_arm64.tar.gz"
    sha256 "70499b4210d4572a4119b4de6806a199498ca4d81826a7b3e221fbe5aa4a04d3"
  elsif OS.mac?
    url "https://github.com/lancekrogers/go-token-counter/releases/download/v0.1.0/tcount_0.1.0_darwin_amd64.tar.gz"
    sha256 "b1669546ea7bc33add1f9ac931177ff31c7d8aade529ef8d35801fb1481741fb"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/lancekrogers/go-token-counter/releases/download/v0.1.0/tcount_0.1.0_linux_arm64.tar.gz"
    sha256 "2ab518655976a95bb139e1322b3bdfe4f247a1e003e3a50c8e376100ab5cb78b"
  elsif OS.linux?
    url "https://github.com/lancekrogers/go-token-counter/releases/download/v0.1.0/tcount_0.1.0_linux_amd64.tar.gz"
    sha256 "99a3201a0ed247474c70e55ef13d25dc6626aab10434eabcc727dd2614e8d94a"
  end

  def install
    bin.install "tcount"
  end

  test do
    system bin/"tcount", "--version"
  end
end
