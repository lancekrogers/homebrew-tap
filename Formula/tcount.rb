class Tcount < Formula
  desc "Count tokens in files using various LLM tokenizers"
  homepage "https://github.com/lancekrogers/tcount"
  version "0.4.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/lancekrogers/tcount/releases/download/v0.4.0/tcount_0.4.0_darwin_arm64.tar.gz"
    sha256 "545fedb8151bb242db371340237e9b824d30e29791787fede003de04685b9200"
  elsif OS.mac?
    url "https://github.com/lancekrogers/tcount/releases/download/v0.4.0/tcount_0.4.0_darwin_amd64.tar.gz"
    sha256 "d4e52b66644a752f26c3257e9a7c2a839597c8759bc2d4080cae13a49ddb39c0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/lancekrogers/tcount/releases/download/v0.4.0/tcount_0.4.0_linux_arm64.tar.gz"
    sha256 "932b443f3134d303c943d32f3b5d56102982311c254803f20aa7558edef4b986"
  elsif OS.linux?
    url "https://github.com/lancekrogers/tcount/releases/download/v0.4.0/tcount_0.4.0_linux_amd64.tar.gz"
    sha256 "a5d6ea0142f7599cf994bff897bf2c2b476de33633e57f5ed912e9873c1ccb32"
  end

  def install
    bin.install "tcount"
  end

  test do
    system bin/"tcount", "--version"
  end
end
