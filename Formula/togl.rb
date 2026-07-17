class Togl < Formula
  desc "CLI tool for toggling code comments across multiple languages"
  homepage "https://github.com/smorin/toggle"
  version "0.5.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smorin/toggle/releases/download/v0.5.2/togl-aarch64-apple-darwin.tar.gz"
      sha256 "d54e92fa62909624e04468e0391bec077a0d5198999a2b212982f2b8f8b9c170"
    end
    on_intel do
      url "https://github.com/smorin/toggle/releases/download/v0.5.2/togl-x86_64-apple-darwin.tar.gz"
      sha256 "6dfddc55466abb9fb036ae46ccdd50e27efedb90689b5c43d4230a27728a2c0e"
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
