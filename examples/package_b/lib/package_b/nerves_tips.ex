defmodule PackageB.NervesTips do
  @moduledoc """
  Tips provided by PackageB.
  """

  @moduledoc nerves_tips: [
    %{
      text: "Nerves uses a hardware watchdog to recover from hangs.",
      level: "advanced",
      topic: "PackageB.Tips"
    },
    %{
      text: "For faster boot times, minimize dependencies in your firmware.",
      level: "intermediate",
      topic: "PackageB.Tips"
    }
  ]
end
