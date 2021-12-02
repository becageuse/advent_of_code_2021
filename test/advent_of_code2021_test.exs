defmodule Aoc2021Test do
  use ExUnit.Case

  alias Aoc2021.Day01

  describe "day 01 - part 1" do
    test "parse_input/1" do
      list = Day01.parse_input()

      assert length(list) == 2000
      assert Enum.take(list, 4) == [103, 106, 107, 110]
      assert Enum.take(list, -4) == [9531, 9532, 9538, 9548]
    end

    test "compute_gradient/1" do
      grad =
        Day01.compute_gradient([
          103,
          106,
          107,
          110,
          9524,
          9519,
          9524,
          9528,
          9529,
          9531,
          9532,
          9538,
          9548
        ])

      assert length(grad) == 12
      assert Enum.take(grad, 3) == [3, 1, 3]
      assert Enum.take(grad, -8) == [-5, 5, 4, 1, 2, 1, 6, 10]
    end

    test "part_1/1: can be called with no errors" do
      # IO.puts("Day 01 - part 1 answer: ")
      Day01.part_1()
    end
  end

  describe "day 01 - part 2" do
    test "moving_sum/1" do
      list = [5, 8, 3, -5, 1, -2, 4, 6]

      assert Day01.moving_sum(list) == [16, 6, -1, -6, 3, 8]
    end

    test "part_2/0: can be called with no errors" do
      Day01.part_2()
    end
  end
end
