class Envgen < Formula
  desc "Generate .env files from declarative YAML schemas"
  homepage "https://github.com/smorinlabs/envgen"
  url "https://github.com/smorinlabs/envgen/archive/refs/tags/v1.0.3.tar.gz"
  sha256 "a21394ca439903e82a7d1e43be2f25f12d28e96b620ed60b98ad5d6dcc69dadc"
  license "MIT"
  head "https://github.com/smorinlabs/envgen.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    (testpath/"envgen.yaml").write <<~YAML
      schema_version: "2"
      metadata:
        description: "Homebrew test schema"
        destination:
          local: ".env.local"
      environments:
        local: {}
      sources: {}
      variables:
        APP_NAME:
          description: "App name"
          source: static
          values:
            local: "envgen"
    YAML

    system bin/"envgen", "check", "-c", "envgen.yaml"
    system bin/"envgen", "pull", "-c", "envgen.yaml", "-e", "local", "--force"
    assert_match "APP_NAME=envgen", (testpath/".env.local").read
    assert_match version.to_s, shell_output("#{bin}/envgen --version")
  end
end
