defmodule OpenApiMeilisearch.MixProject do
  use Mix.Project

  @source_url "https://github.com/jaeyson/open_api_meilisearch"
  @canonical "https://hexdocs.pm/open_api_meilisearch"
  @version "0.0.1"

  def project do
    [
      app: :open_api_meilisearch,
      version: @version,
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description:
        "Restful client for Meilisearch with adherence to Open API spec 3 (formerly Swagger)",
      docs: docs(),
      package: package(),
      name: "OpenApiMeilisearch",
      source_url: @source_url
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:ex_doc, "~> 0.34", only: [:dev, :test], runtime: false},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:req, "~> 0.5"},
      {:oapi_generator, "~> 0.4.0", only: :dev, runtime: false}
    ]
  end

  defp docs do
    [
      api_reference: false,
      main: "readme",
      source_ref: "v#{@version}",
      source_url: @source_url,
      canonical: @canonical,
      formatters: ["html"],
      extras: [
        "CHANGELOG.md",
        "README.md",
        "LICENSE.md": [title: "License"]
      ]
    ]
  end

  defp package do
    [
      maintainers: ["Jaeyson Anthony Y."],
      licenses: ["MIT"],
      links: %{
        Github: @source_url,
        Changelog: "#{@canonical}/changelog.html"
      }
    ]
  end
end
