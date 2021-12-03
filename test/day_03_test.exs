defmodule Aoc2021.Day03.Test do
  use ExUnit.Case

  alias Aoc2021.Day03

  test "parse_input/1" do
    {data, n} = Day03.parse_input()
    assert n == 1000

    assert Enum.take(data, 2) == [
             [0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0],
             [0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 0, 0]
           ]
  end

  test "compute_power/2" do
    data = [
      [0, 0, 1, 0, 0],
      [1, 1, 1, 1, 0],
      [1, 0, 1, 1, 0],
      [1, 0, 1, 1, 1],
      [1, 0, 1, 0, 1],
      [0, 1, 1, 1, 1],
      [0, 0, 1, 1, 1],
      [1, 1, 1, 0, 0],
      [1, 0, 0, 0, 0],
      [1, 1, 0, 0, 1],
      [0, 0, 0, 1, 0],
      [0, 1, 0, 1, 0]
    ]

    assert Day03.compute_power(data, 12) == [1, 0, 1, 1, 0]
  end

  test "bits_to_decimal/1" do
    assert Day03.bits_to_decimal([1, 0, 1, 1, 0]) == 22
  end

  test "part/1" do
    data = [
      [0, 0, 1, 0, 0],
      [1, 1, 1, 1, 0],
      [1, 0, 1, 1, 0],
      [1, 0, 1, 1, 1],
      [1, 0, 1, 0, 1],
      [0, 1, 1, 1, 1],
      [0, 0, 1, 1, 1],
      [1, 1, 1, 0, 0],
      [1, 0, 0, 0, 0],
      [1, 1, 0, 0, 1],
      [0, 0, 0, 1, 0],
      [0, 1, 0, 1, 0]
    ]

    assert 198 == Day03.part_1(data, 12, 5)
  end
end
