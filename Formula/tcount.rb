class Tcount < Formula
  desc "Count tokens in files using various LLM tokenizers"
  homepage "https://github.com/lancekrogers/tcount"
  version "0.5.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/lancekrogers/tcount/releases/download/v0.5.1/tcount_0.5.1_darwin_arm64.tar.gz"
    sha256 "8360c7a5b8a1747b0fd5d0404b4c3a73a9de223d1d16e6d37ad3d94e19e11ee6"
  elsif OS.mac?
    url "https://github.com/lancekrogers/tcount/releases/download/v0.5.1/tcount_0.5.1_darwin_amd64.tar.gz"
    sha256 "1d59145da7a0b83d603c4b3e65aa727b5a5f208b6e08c1e7d7b6e05513e0fe34"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/lancekrogers/tcount/releases/download/v0.5.1/tcount_0.5.1_linux_arm64.tar.gz"
    sha256 "8435f04b2fddbf02d24fc29e5ae2b87921858680522c4e03dbad3a71c05a9756"
  elsif OS.linux?
    url "https://github.com/lancekrogers/tcount/releases/download/v0.5.1/tcount_0.5.1_linux_amd64.tar.gz"
    sha256 "ad0821133fef826c474e654f3c4338bd861d554d8908e80bacbb57b4f5fcacce"
  end

  def install
    bin.install "tcount"
  end

  test do
    system bin/"tcount", "--version"
  end
end
