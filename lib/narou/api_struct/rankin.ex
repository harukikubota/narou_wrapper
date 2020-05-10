defmodule Narou.APIStruct.Rankin do
  @moduledoc """

  小説殿堂入りAPI用データ。
  """

  import Narou.Util
  use Narou.APIStruct, where: %{ncode: "N0000A"}, validate: []

  validates :where, by: &__MODULE__.valid_where?/1

  def valid_where?(map) do
    {%{ncode: ncode}, other} = Map.split(map, [:ncode])

    cond do
      map_size(other) > 0 ->
        keys = Map.keys(other) |> Enum.map(&(":#{&1}")) |> Enum.join(", ")
        {:error, "Unexpected keys [#{keys}]"}

      true ->
        if is_ncode(ncode) do
          true
        else
          {:error, "invalid NCode `#{ncode}`."}
        end
    end
  end
end
