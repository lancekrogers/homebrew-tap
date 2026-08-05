class Tcount < Formula
  desc "Count tokens in files using various LLM tokenizers"
  homepage "https://github.com/lancekrogers/tcount"
  version "0.6.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/lancekrogers/tcount/releases/download/v0.6.0/tcount_0.6.0_darwin_arm64.tar.gz"
    sha256 "fcb5970e0488facdeb8ff04d813cc5cf07301279430f947485d3d9d14c4d0481"
  elsif OS.mac?
    url "https://github.com/lancekrogers/tcount/releases/download/v0.6.0/tcount_0.6.0_darwin_amd64.tar.gz"
    sha256 "fb5984e7c259f40bb73932a8c479c29757479c3860a9d17449c80cfb36ded5f6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/lancekrogers/tcount/releases/download/v0.6.0/tcount_0.6.0_linux_arm64.tar.gz"
    sha256 "2ec100b8e0047ad519a4c6aa1c76f28267d78007f451e7fafa9387f769d72a52"
  elsif OS.linux?
    url "https://github.com/lancekrogers/tcount/releases/download/v0.6.0/tcount_0.6.0_linux_amd64.tar.gz"
    sha256 "239aad2fb6bef95756f9a17e02df99871ccf5f3a504d15173f229b882ecc9bab"
  end

  def install
    bin.install "tcount"
  end

  test do
    system bin/"tcount", "--version"
  end
end
