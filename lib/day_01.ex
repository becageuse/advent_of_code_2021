defmodule Aoc2021.Day01 do
  def part_1() do
    parse_input() |> compute_gradient() |> Enum.count(fn x -> x > 0 end)
  end

  def part_2() do
    parse_input() |> moving_sum() |> compute_gradient() |> Enum.count(fn x -> x > 0 end)
  end

  def parse_input(filepath \\ "data/input_01.txt") do
    with content = File.read!(filepath) do
      content
      |> String.split("\n", trim: true)
      |> Enum.map(fn x -> String.to_integer(x) end)
    end
  end

  def compute_gradient(list) do
    [list, Enum.drop(list, 1)]
    |> Enum.zip()
    |> Enum.map(fn {l, r} -> r - l end)
  end

  def moving_sum(list) do
    [list, Enum.drop(list, 1), Enum.drop(list, 2)]
    |> Enum.zip()
    |> Enum.map(fn t -> Tuple.sum(t) end)
  end
end
