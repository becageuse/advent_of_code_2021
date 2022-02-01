defmodule Aoc2021 do
  alias Aoc2021.Day01
  alias Aoc2021.Day02
  alias Aoc2021.Day03
  alias Aoc2021.Day04
  alias Aoc2021.Day05
  alias Aoc2021.Day06

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

      "6" ->
        seeds = Day06.parse_input()
        IO.puts("computing part 1 ..")
        part_1 = Day06.part_1(seeds, 80)
        IO.puts("computing part 2 ..")
        t_start = DateTime.utc_now() |> DateTime.to_unix(:millisecond)
        part_2 =  Day06.part_2(seeds, 256)
        t_end = DateTime.utc_now() |> DateTime.to_unix(:millisecond)
        elt = DateTime.from_unix!(t_end - t_start, :millisecond)
        IO.puts("ELT: #{elt}")
        %{part_1: part_1, part_2: part_2}

      _ ->
        nil
    end
  end
end
