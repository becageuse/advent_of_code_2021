defmodule Aoc2021.Day04.Test do
  use ExUnit.Case
  alias Aoc2021.Day04

  setup %{} do
    %{
      numbers: [
        7,
        4,
        9,
        5,
        11,
        17,
        23,
        2,
        0,
        14,
        21,
        24,
        10,
        16,
        13,
        6,
        15,
        25,
        12,
        22,
        18,
        20,
        8,
        19,
        3,
        26,
        1
      ],
      boards: [
        [
          [22, 13, 17, 11, 0],
          [8, 2, 23, 4, 24],
          [21, 9, 14, 16, 7],
          [6, 10, 3, 18, 5],
          [1, 12, 20, 15, 19]
        ],
        [
          [3, 15, 0, 2, 22],
          [9, 18, 13, 17, 5],
          [19, 8, 7, 25, 23],
          [20, 11, 10, 24, 4],
          [14, 21, 16, 12, 6]
        ],
        [
          [14, 21, 17, 24, 4],
          [10, 16, 15, 9, 19],
          [18, 8, 23, 26, 20],
          [22, 11, 13, 6, 5],
          [2, 0, 12, 3, 7]
        ]
      ]
    }
  end

  test "parse_input/1" do
    {_, boards} = Day04.parse_input()

    assert [
             [
               [55, 98, 79, 85, 3],
               [68, 57, 89, 81, 4],
               [39, 70, 2, 58, 6],
               [92, 14, 61, 13, 26],
               [59, 93, 18, 63, 19]
             ]
           ] == Enum.take(boards, 1)
  end

  test "check_rows/2", %{numbers: numbers, boards: boards} do
    indexed_numbers = Enum.with_index(numbers)

    assert Day04.check_rows(List.last(boards), indexed_numbers) == {24, 11}

    assert Day04.check_rows(
             [
               [10, 16, 15, 9, 19],
               [18, 8, 23, 26, 20],
               [14, 21, 17, 24, 4],
               [22, 11, 13, 6, 5],
               [2, 0, 12, 3, 7]
             ],
             indexed_numbers
           ) == {24, 11}

    assert Day04.check_rows([[90, 1, 26, 3], [100, 103, 9, 3]], indexed_numbers) ==
             {-1, :infinity}
  end

  test "guess_winner/3", %{numbers: numbers, boards: boards} do
    assert Day04.guess_winner(numbers, boards, :min) == {24, 11, List.last(boards)}
  end

  test "part_1/2", %{numbers: numbers, boards: boards} do
    assert Day04.part_1(numbers, boards) == 4512
  end

  test "part_2/2", %{numbers: numbers, boards: boards} do
    assert Day04.part_2(numbers, boards) == 1924
  end

end
