defmodule Aoc2021.Day06.Test do
  import While
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

  test "part_1", %{init_state: seeds} do
    t_start = DateTime.utc_now() |> DateTime.to_unix(:millisecond)
    assert Day06.part_1(seeds, 80) == 5934
    t_end = DateTime.utc_now() |> DateTime.to_unix(:millisecond)
    elt = DateTime.from_unix!(t_end - t_start, :millisecond)
    IO.puts("ELT: #{elt}")
  end

  test "part_2", %{init_state: seeds} do
    t_start = DateTime.utc_now() |> DateTime.to_unix(:millisecond)
    # assert Day06.part_2(seeds, 80) == 5934
    assert Day06.part_2(seeds, 256) == 26_984_457_539
    t_end = DateTime.utc_now() |> DateTime.to_unix(:millisecond)
    elt = DateTime.from_unix!(t_end - t_start, :millisecond)
    IO.puts("ELT: #{elt}")
  end

  test "for loops" do
    my_list = [0, 1]

    my_list =
      Enum.reduce(my_list, my_list, fn el, my_list ->
        IO.inspect(el)
        my_list ++ [2]
      end)

    IO.inspect(my_list)
  end
end
