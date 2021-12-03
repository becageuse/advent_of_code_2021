defmodule Aoc2021.Day02.Test do
  use ExUnit.Case

  alias Aoc2021.Day02

  test "parse_input/1" do
    list = Day02.parse_input()
    assert Enum.take(list, 3) == [{:forward, 2}, {:down, 9}, {:up, 6}]
  end

  test "compute_coord/1" do
    instrucs = [{:forward, 2}, {:down, 9}, {:up, 6}]
    assert Day02.compute_coord(instrucs) == %{hor: 2, depth: 3}
  end

  test "can call part_1/0 without errors" do
    Day02.part_1(&Day02.parse_input/0)
  end

  test "compute_coord_2/1" do
    instrucs = [{:forward, 5}, {:down, 5}, {:forward, 8}, {:up, 3}, {:down, 8}, {:forward, 2}]
    assert %{hor: 15, depth: 60} = Day02.compute_coord_2(instrucs)
  end

  test "part_2/1" do
    instrucs = [{:forward, 5}, {:down, 5}, {:forward, 8}, {:up, 3}, {:down, 8}, {:forward, 2}]
    assert Day02.part_2(instrucs) == 900
  end
end
