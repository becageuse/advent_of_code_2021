defmodule Aoc2021.Day01 do
  def part_1() do
    parse_input() |> compute_gradient() |> count_pos()
  end

  def part_2() do
    parse_input() |> moving_sum() |> compute_gradient() |> count_pos()
  end

  def parse_input(filepath \\ "data/input_01.txt") do
    with content = File.read!(filepath) do
      content
      |> String.split("\n", trim: true)
      |> Enum.map(fn x -> String.to_integer(x) end)
    end
  end

  def compute_gradient(list) do
    list_left = [0] ++ list
    list_right = list ++ [0]

    signs =
      [list_left, list_right]
      |> Enum.zip()
      |> Enum.map(fn {l, r} -> r - l end)

    signs
    |> tl()
    |> Enum.reverse()
    |> tl()
    |> Enum.reverse()
  end

  def count_pos(signs) do
    Enum.reduce(signs, 0, fn x, acc ->
      cond do
        x > 0 -> acc + 1
        true -> acc
      end
    end)
  end

  def moving_sum(list) do
    [[0, 0] ++ list, [0] ++ list ++ [0], list ++ [0, 0]]
    |> Enum.zip()
    |> Enum.map(fn t -> Tuple.sum(t) end)
    |> trim(2)
    |> trim(-2)
  end

  def trim(list, n) when abs(n) > 0 do
    cond do
      n < 0 ->
        list
        |> Enum.reverse()
        |> tl()
        |> Enum.reverse()
        |> trim(n + 1)

      n > 0 ->
        list
        |> tl()
        |> trim(n - 1)
    end
  end

  def trim(list, n) when abs(n) == 0 do
    list
  end
end
