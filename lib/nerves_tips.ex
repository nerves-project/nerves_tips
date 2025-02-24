defmodule NervesTips do
  @moduledoc """
  NervesTips provides a simple interface for retrieving useful tips from registered providers.

  This module automatically discovers available tip providers across loaded applications,
  aggregates their tips, and provides functions to fetch them.
  """

  @type tip :: %{required(String.t()) => any}

  @doc """
  Retrieves all available tips from registered provider modules.
  """
  @spec all() :: [tip]
  def all do
    discover_provider_modules()
    |> Enum.flat_map(fn provider ->
      case provider.fetch_tips() do
        {:ok, tips} -> tips
        _ -> []
      end
    end)
  end

  @doc """
  Returns a random tip from the available tips.
  """
  @spec random() :: tip
  def random do
    all() |> Enum.random()
  end

  @doc """
  Discovers provider modules that implement `fetch_tips/0`.

  This function scans all loaded applications, constructs module names
  following the `AppName.Tips` naming convention, and filters out modules
  that are either not loaded or do not implement `fetch_tips/0`.
  """
  @spec discover_provider_modules() :: [module]
  def discover_provider_modules do
    :application.loaded_applications()
    |> Enum.map(fn {app, _, _} ->
      Module.concat([Macro.camelize(Atom.to_string(app)), "Tips"])
    end)
    |> Enum.filter(&Code.ensure_loaded?/1)
    |> Enum.filter(&function_exported?(&1, :fetch_tips, 0))
  end
end
