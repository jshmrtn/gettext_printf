# credo:disable-for-this-file Credo.Check.Readability.Specs
defmodule GettextPrintf.MixProject do
  @moduledoc false

  use Mix.Project

  def project do
    [
      app: :gettext_printf,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      build_embedded: Mix.env() == :prod or System.get_env("BUILD_EMBEDDED") in ["1", "true"],
      test_coverage: [tool: ExCoveralls],
      dialyzer:
        [
          ignore_warnings: ".dialyzer_ignore.exs",
          list_unused_filters: true,
          plt_add_apps: [:mix]
        ] ++
          if System.get_env("DIALYZER_PLT_PRIV", "false") in ["1", "true"] do
            [plt_file: {:no_warn, "priv/plts/dialyzer.plt"}]
          else
            []
          end,
      elixirc_paths: elixirc_paths(Mix.env()),
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.html": :test,
        "coveralls.json": :test,
        "coveralls.post": :test,
        "coveralls.xml": :test
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(:dev), do: ["lib", "test/support"]
  defp elixirc_paths(_env), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 1.4", runtime: false, only: [:dev]},
      {:dialyxir, "~> 1.0", runtime: false, only: [:dev]},
      {:excoveralls, "~> 0.4", runtime: false, only: [:test]},
      {:ex_doc, "~> 0.24", runtime: false, only: [:dev, :test], override: true},
      # TODO: Switch to released version
      {:gettext, "~> 0.18", github: "elixir-gettext/gettext", branch: "main", override: true},
      {:ex_cldr_print, "~> 1.0.0"}
    ]
  end
end
