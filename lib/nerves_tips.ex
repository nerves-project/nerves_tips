defmodule NervesTips do
  @moduledoc """
  NervesTips provides a simple interface for retrieving useful tips from registered providers.

  This module automatically discovers available tip providers across loaded applications,
  aggregates their tips, and provides functions to fetch them.
  """

  @type tip :: %{required(String.t()) => any}

  @doc """
  Retrieves all available tips from discovered provider modules.
  """
  @spec all() :: [tip]
  def all do
    discover_provider_modules()
    |> Enum.flat_map(&fetch_tips_from_metadata/1)
  end

  @doc """
  Returns a random tip from the available tips.
  """
  @spec random() :: tip
  def random do
    all() |> Enum.random()
  end

  @doc """
  Discovers provider modules that contain tips in `@moduledoc` metadata.

  This function scans all loaded applications, constructs module names
  following the `AppName.NervesTips` naming convention.
  """
  @spec discover_provider_modules() :: [module]
  def discover_provider_modules do
    :application.loaded_applications()
    |> Enum.map(fn {app, _, _} ->
      Module.concat([Macro.camelize(Atom.to_string(app)), "NervesTips"])
    end)
    |> Enum.filter(&Code.ensure_loaded?/1)
  end

  defp fetch_tips_from_metadata(mod) do
    case Code.fetch_docs(mod) do
      {_, _, _, _, _, %{nerves_tips: tips}, _} -> tips
      _ -> []
    end
  end
end
