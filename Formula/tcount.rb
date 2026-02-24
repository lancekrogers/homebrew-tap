class Tcount < Formula
  desc "Count tokens in files using various LLM tokenizers"
  homepage "https://github.com/lancekrogers/tcount"
  version "0.3.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/lancekrogers/tcount/releases/download/v0.3.0/tcount_0.3.0_darwin_arm64.tar.gz"
    sha256 "14514a6ad417c531995b7c6083ba7c78f9e2be35e77eb3c5b71af69c60ba2dc2"
  elsif OS.mac?
    url "https://github.com/lancekrogers/tcount/releases/download/v0.3.0/tcount_0.3.0_darwin_amd64.tar.gz"
    sha256 "0723f7282ef1316328d9ea1ed493bce22f0612896896c8055f240bf1ffe34d0a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/lancekrogers/tcount/releases/download/v0.3.0/tcount_0.3.0_linux_arm64.tar.gz"
    sha256 "f04dbc9e8eb6b20fda86fe71452eee101793ed3a50edb49f4945b12c1b8017d0"
  elsif OS.linux?
    url "https://github.com/lancekrogers/tcount/releases/download/v0.3.0/tcount_0.3.0_linux_amd64.tar.gz"
    sha256 "5e7ede2d98bcd5d38511f43a21cde14165d2fb8f76fadccaf4585b0a9dbea5cb"
  end

  def install
    bin.install "tcount"
  end

  test do
    system bin/"tcount", "--version"
  end
end
