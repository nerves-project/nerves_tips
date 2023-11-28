defmodule NervesTips.MixProject do
  use Mix.Project

  def project do
    [
      app: :nerves_tips,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      compilers: Mix.compilers() ++ [:fortune_compiler],
      deps: deps()
    ]
  end

  def application do
    [ ]
  end

  defp deps do
    [
      {:fortune, "~> 0.1"}
    ]
  end
end
