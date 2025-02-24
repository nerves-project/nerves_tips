defmodule PackageB.Tips do
  @behaviour NervesTips.Provider

  @tips_file Application.app_dir(:package_b, "priv/nerves_tips.json")

  def fetch_tips do
    case File.read(@tips_file) do
      {:ok, content} -> JSON.decode(content)
      {:error, _} -> {:error, "No tips available"}
    end
  end
end
