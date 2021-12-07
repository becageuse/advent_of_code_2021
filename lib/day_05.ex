defmodule Aoc2021.Day05 do
  def part_1(lines) do
    compute_overlaps(lines, :straight)
  end

  def part_2(lines) do
    compute_overlaps(lines, :all)
  end

  def parse_input(filepath \\ "data/input_05.txt") do
    with content = File.read!(filepath) do
      content
      |> String.split("\n", trim: true)
      |> Enum.map(fn line ->
        line
        |> String.split(" -> ")
        |> Enum.map(fn point ->
          point
          |> String.split(",")
          |> Enum.map(&String.to_integer/1)
          |> List.to_tuple()
        end)
        |> List.to_tuple()
      end)
    end
  end

  def compute_overlaps(lines, tag) do
    lines
    |> Enum.reduce([], fn {{x_1, y_1}, {x_2, y_2}}, points ->
      cond do
        x_1 == x_2 -> Enum.reduce(y_1..y_2, points, fn y, acc -> [{x_1, y} | acc] end)
        y_1 == y_2 -> Enum.reduce(x_1..x_2, points, fn x, acc -> [{x, y_1} | acc] end)
        true -> if tag == :straight, do: points, else: Enum.zip([x_1..x_2, y_1..y_2]) ++ points
      end
    end)
    |> Enum.frequencies()
    |> Enum.filter(fn {_, v} -> v >= 2 end)
    |> length()
  end
end
