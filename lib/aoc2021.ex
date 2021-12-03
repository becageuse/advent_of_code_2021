defmodule Aoc2021 do
  alias Aoc2021.Day01
  alias Aoc2021.Day02

  def day(n) do
    case n do
      "1" ->
        %{part_1: Day01.part_1(), part_2: Day01.part_2()}

      "2" ->
        parsed = Day02.parse_input()
        %{part_1: Day02.part_1(parsed), part_2: Day02.part_2(parsed)}

      _ ->
        nil
    end
  end
end
