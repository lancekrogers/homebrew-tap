class Tcount < Formula
  desc "Count tokens in files using various LLM tokenizers"
  homepage "https://github.com/lancekrogers/tcount"
  version "0.5.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/lancekrogers/tcount/releases/download/v0.5.0/tcount_0.5.0_darwin_arm64.tar.gz"
    sha256 "768bb7fab11befd7708e98ea181e5d1320c413f4d50b7cd1838de7488faad106"
  elsif OS.mac?
    url "https://github.com/lancekrogers/tcount/releases/download/v0.5.0/tcount_0.5.0_darwin_amd64.tar.gz"
    sha256 "9de79ecc53ae8d1cbee288c9e4c195bd4cecdf406d11c6d6d1da964bb296b08c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/lancekrogers/tcount/releases/download/v0.5.0/tcount_0.5.0_linux_arm64.tar.gz"
    sha256 "d8f1e5b04b24c5591c7bb5a80126672fa923bf91ac2f85d086669d4c76b8777a"
  elsif OS.linux?
    url "https://github.com/lancekrogers/tcount/releases/download/v0.5.0/tcount_0.5.0_linux_amd64.tar.gz"
    sha256 "0b6154395542f2b1cbc44b5360469528cc8c2d935a46d9297fd70e1a2334110c"
  end

  def install
    bin.install "tcount"
  end

  test do
    system bin/"tcount", "--version"
  end
end
