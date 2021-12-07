defmodule Aoc2021 do
  alias Aoc2021.Day01
  alias Aoc2021.Day02
  alias Aoc2021.Day03
  alias Aoc2021.Day04
  alias Aoc2021.Day05

  def day(n) do
    case n do
      "1" ->
        %{part_1: Day01.part_1(), part_2: Day01.part_2()}

      "2" ->
        parsed = Day02.parse_input()
        %{part_1: Day02.part_1(parsed), part_2: Day02.part_2(parsed)}

      "3" ->
        {data, length} = Day03.parse_input()
        %{part_1: Day03.part_1(data, length, 12), part_2: Day03.part_2(data)}

      "4" ->
        {numbers, boards} = Day04.parse_input()
        %{part_1: Day04.part_1(numbers, boards), part_2: Day04.part_2(numbers, boards)}

      "5" ->
        lines = Day05.parse_input()
        %{part_1: Day05.part_1(lines), part_2: Day05.part_2(lines)}

      _ ->
        nil
    end
  end
end
