defmodule NervesTips.Provider do
  @moduledoc """
  Behaviour for Elixir packages that want to provide tips to `NervesTips`.
  """

  @type tip :: %{required(String.t()) => any}

  @callback fetch_tips() :: {:ok, [tip]} | {:error, String.t()}
end
