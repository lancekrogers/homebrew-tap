class Tcount < Formula
  desc "Count tokens in files using various LLM tokenizers"
  homepage "https://github.com/lancekrogers/tcount"
  version "0.7.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/lancekrogers/tcount/releases/download/v0.7.0/tcount_0.7.0_darwin_arm64.tar.gz"
    sha256 "34838c77a784ae2f6318c287b9109b331d71a4c54ff7b9cb16bd12b8acd724d4"
  elsif OS.mac?
    url "https://github.com/lancekrogers/tcount/releases/download/v0.7.0/tcount_0.7.0_darwin_amd64.tar.gz"
    sha256 "b917a85f6ac7a9ce1555f080d696e70a93b615bfb6626fd7b3fe9bb321fe8d73"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/lancekrogers/tcount/releases/download/v0.7.0/tcount_0.7.0_linux_arm64.tar.gz"
    sha256 "08c998e922f135f1abdfae8ec8d17afdcb047a2d7da0ca3d2588122f4b6a18d0"
  elsif OS.linux?
    url "https://github.com/lancekrogers/tcount/releases/download/v0.7.0/tcount_0.7.0_linux_amd64.tar.gz"
    sha256 "41a79076615df853387119662b7187856a8cd1054e842b45299e9c1223f04291"
  end

  def install
    bin.install "tcount"
  end

  test do
    system bin/"tcount", "--version"
  end
end
