defmodule Aoc2021.Day06.Test do
  use ExUnit.Case
  alias Aoc2021.Day06

  setup %{} do
    %{
      init_state: [3, 4, 3, 1, 2]
    }
  end

  test "grow_population/2", %{init_state: seeds} do
    assert Day06.grow_population(seeds, 80) == 5934
  end

  test "parse_input/1" do
    seeds = Day06.parse_input()
    assert Enum.take(seeds, 3) == [3, 5, 3]
    assert Enum.take(Enum.reverse(seeds), 3) == [2, 5, 2]
  end

  test "part_1/2", %{init_state: seeds} do
    assert Day06.part_1(seeds, 80) == 5934
  end
end
