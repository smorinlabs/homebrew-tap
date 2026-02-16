class Envgen < Formula
  desc "Generate .env files from declarative YAML schemas"
  homepage "https://github.com/smorinlabs/envgen"
  url "https://github.com/smorinlabs/envgen/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "594dca1eaa4ecc6c0f4eacbfb3e23c01a9a40e2046e8ed8928393ab9c1c7a691"
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
