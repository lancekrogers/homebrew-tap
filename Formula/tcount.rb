class Tcount < Formula
  desc "Count tokens in files using various LLM tokenizers"
  homepage "https://github.com/lancekrogers/tcount"
  version "0.6.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/lancekrogers/tcount/releases/download/v0.6.1/tcount_0.6.1_darwin_arm64.tar.gz"
    sha256 "8a0f7460b080aead1b4b618b2154f1f622596b8bfaa7cd1691bac57dcfe719e0"
  elsif OS.mac?
    url "https://github.com/lancekrogers/tcount/releases/download/v0.6.1/tcount_0.6.1_darwin_amd64.tar.gz"
    sha256 "706d32d20e223d15035711e258e7cfe10e9773738fc1f398d66899e084db888f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/lancekrogers/tcount/releases/download/v0.6.1/tcount_0.6.1_linux_arm64.tar.gz"
    sha256 "0e1642299e92196ceae3e310590e619a0060871c617b00c76e40b0f3440d3450"
  elsif OS.linux?
    url "https://github.com/lancekrogers/tcount/releases/download/v0.6.1/tcount_0.6.1_linux_amd64.tar.gz"
    sha256 "1f31ee85833df20d8eb9d09a5005709a61ce3f5acc61e5c0b8833518d052bc38"
  end

  def install
    bin.install "tcount"
  end

  test do
    system bin/"tcount", "--version"
  end
end
