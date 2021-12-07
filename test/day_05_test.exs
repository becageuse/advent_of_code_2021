defmodule Aoc2021.Day05.Test do
  use ExUnit.Case
  alias Aoc2021.Day05

  setup %{} do
    %{
      lines: [
        {{0, 9}, {5, 9}},
        {{8, 0}, {0, 8}},
        {{9, 4}, {3, 4}},
        {{2, 2}, {2, 1}},
        {{7, 0}, {7, 4}},
        {{6, 4}, {2, 0}},
        {{0, 9}, {2, 9}},
        {{3, 4}, {1, 4}},
        {{0, 0}, {8, 8}},
        {{5, 5}, {8, 2}}
      ]
    }
  end

  test "parse_input/1" do
    lines = Day05.parse_input()
    assert Enum.take(lines, 2) == [{{692, 826}, {692, 915}}, {{914, 338}, {524, 728}}]
  end

  test "compute_overlaps/1", %{lines: lines} do
    assert Day05.compute_overlaps(lines, :straight) == 5
    assert Day05.compute_overlaps(lines, :all) == 12
  end
end
