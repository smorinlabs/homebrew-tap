class Togl < Formula
  desc "CLI tool for toggling code comments across multiple languages"
  homepage "https://github.com/smorin/toggle"
  version "0.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smorin/toggle/releases/download/v0.5.1/togl-aarch64-apple-darwin.tar.gz"
      sha256 "f938be046f3aef3814f11b09d94f7e92dd5e9b60d7f25a9a7bf2274844485588"
    end
    on_intel do
      url "https://github.com/smorin/toggle/releases/download/v0.5.1/togl-x86_64-apple-darwin.tar.gz"
      sha256 "0724bcaa65b0a6cc99cbe178111e6d150c15fbccdadbeaa182921d1682d3f059"
    end
  end

  def install
    bin.install "togl"
    bin.install "toggle"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/togl --version")
  end
end
