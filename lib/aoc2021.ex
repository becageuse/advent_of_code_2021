defmodule Aoc2021 do
  @doc """
  This is useless for now.
  """
  def day(n) do
    case n do
      "1" -> %{part_1: Aoc2021.Day01.part_1(), part_2: Aoc2021.Day01.part_2()}
      _ -> nil
    end
  end
end
