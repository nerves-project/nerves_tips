defmodule PackageA.NervesTips do
  @moduledoc """
  Tips provided by PackageA.
  """

  @moduledoc nerves_tips: [
    %{
      text: "Need to write to disk? Store your settings under `/data`.",
      level: "beginner",
      topic: "PackageA.Tips"
    },
    %{
      text: "Use `Nerves.Runtime.validate_firmware/0` to check for corruption.",
      level: "intermediate",
      topic: "PackageA.Tips"
    }
  ]
end

