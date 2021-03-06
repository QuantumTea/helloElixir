defmodule HelloElixir.Mixfile do
  use Mix.Project

  def project do
    [app: :helloElixir,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :httpotion, :timex]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:httpotion, "~> 3.0.2"}, 
      {:poison, "~> 3.0"}, 
      {:sweet_xml, "~> 0.6.5"},
      {:timex, "~> 3.0"},
      {:cowboy, "~> 1.0.3"},
      {:plug, "~> 1.0"} 
    ]
  end
end
