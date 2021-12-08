defmodule Aoc2021.Day06 do
  def part_1(seeds, days) do
    grow_population(seeds, days)
  end

  def parse_input(filepath \\ "data/input_06.txt") do
    with content = File.read!(filepath) do
      content
      |> String.trim("\n")
      |> String.split(",")
      |> Enum.map(&String.to_integer/1)
    end
  end

  def do_grow_population(_, day, days) when day > days do
    0
  end

  def do_grow_population(timer, day, days) do
    case timer do
      0 -> 1 + do_grow_population(6, day + 1, days) + do_grow_population(8, day + 1, days)
      _ -> do_grow_population(timer - 1, day + 1, days)
    end
  end

  def grow_population(init_state, days) do
    Enum.reduce(init_state, 0, fn timer, acc ->
      acc + do_grow_population(timer, 1, days)
    end) + length(init_state)
  end
end
