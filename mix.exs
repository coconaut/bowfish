defmodule Bowfish.Mixfile do
  use Mix.Project

  @version "0.1.0"

  def project do
    [app: :bowfish,
     version: @version,
     elixir: "~> 1.2",
     deps: deps,
     description: description,
     package: package

    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    []
  end

  defp deps do
    []
  end

  defp description do
    """
    A fun, positional pipe operator macro >>> for when piping to the first arg just won't cut it.
    """
  end

  defp package do
    [
     name: :bowfish,
     maintainers: ["Alexander Barry"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/coconaut/bowfish"}]
  end
end
