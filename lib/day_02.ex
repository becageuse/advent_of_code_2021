defmodule Aoc2021.Day02 do
  def part_1(instructs) do
    %{hor: hor, depth: depth} = compute_coord(instructs)
    hor * depth
  end

  def part_2(instructs) do
    %{hor: hor, depth: depth} = compute_coord_2(instructs)
    hor * depth
  end

  def parse_input(filepath \\ "data/input_02.txt") do
    with content = File.read!(filepath) do
      content
      |> String.split("\n", trim: true)
      |> Enum.map(fn x ->
        x =
          x
          |> String.split(" ")
          |> List.to_tuple()

        {String.to_atom(elem(x, 0)), String.to_integer(elem(x, 1))}
      end)
    end
  end

  def compute_coord(instrcs) do
    Enum.reduce(instrcs, %{hor: 0, depth: 0}, fn {dir, v}, %{hor: hor, depth: depth} ->
      case dir do
        :forward -> %{hor: hor + v, depth: depth}
        :down -> %{hor: hor, depth: depth + v}
        :up -> %{hor: hor, depth: depth - v}
      end
    end)
  end

  def compute_coord_2(instrcs) do
    Enum.reduce(instrcs, %{hor: 0, depth: 0, aim: 0}, fn {dir, v},
                                                         %{hor: hor, depth: depth, aim: aim} ->
      case dir do
        :forward -> %{hor: hor + v, depth: depth + aim * v, aim: aim}
        :down -> %{hor: hor, depth: depth, aim: aim + v}
        :up -> %{hor: hor, depth: depth, aim: aim - v}
      end
    end)
  end
end
