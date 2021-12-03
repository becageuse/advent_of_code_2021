defmodule Aoc2021.Day03 do
  def part_1(data, lenght, n) do
    gamma = compute_power(data, lenght) |> bits_to_decimal()
    epsilon = :math.pow(2, n) - 1 - gamma
    gamma * epsilon
  end

  def parse_input(filepath \\ "data/input_03.txt") do
    with content = File.read!(filepath) do
      content
      |> String.split("\n", trim: true)
      |> Enum.map_reduce(0, fn x, acc ->
        x =
          x
          |> String.graphemes()
          |> Enum.map(&String.to_integer/1)

        {x, acc + 1}
      end)
    end
  end

  def compute_power(data, lenght) do
    Enum.zip_with(data, &Enum.sum/1)
    |> Enum.map(fn x ->
      th = div(lenght, 2)

      cond do
        x >= th -> 1
        true -> 0
      end
    end)
  end

  def bits_to_decimal(list) do
    {dec, _} =
      list
      |> Enum.reverse()
      |> Enum.reduce({0, 0}, fn b, {res, power} ->
        {res + b * :math.pow(2, power), power + 1}
      end)

    dec
  end
end
