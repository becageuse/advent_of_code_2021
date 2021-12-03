defmodule Aoc2021.Day03 do
  def part_1(data, lenght, n) do
    gamma = compute_power(data, lenght) |> bits_to_decimal()
    epsilon = :math.pow(2, n) - 1 - gamma
    gamma * epsilon
  end

  def part_2(data) do
    oxygen = select_generator_rating(data, "oxygen", 0) |> bits_to_decimal()
    co2 = select_generator_rating(data, "CO2", 0) |> bits_to_decimal()
    oxygen * co2
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
      th = lenght / 2

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

  def select_generator_rating(data, _, _) when length(data) == 1 do
    hd(data)
  end

  def select_generator_rating(data, gas, it) do
    freqs =
      data
      |> Enum.zip()
      |> Enum.at(it)
      |> Tuple.to_list()
      |> Enum.frequencies()

    label = apply_gas_rules(freqs, gas)

    filtered =
      Enum.filter(data, fn x ->
        Enum.at(x, it) == label
      end)

    select_generator_rating(filtered, gas, it + 1)
  end

  def apply_gas_rules(freqs, gas) do
    case gas do
      "oxygen" -> if freqs[1] >= freqs[0], do: 1, else: 0
      "CO2" -> if freqs[0] <= freqs[1], do: 0, else: 1
    end
  end
end
