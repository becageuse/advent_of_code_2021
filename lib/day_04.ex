defmodule Aoc2021.Day04 do
  def part_1(numbers, boards) do
    compute_score(numbers, boards, :min)
  end

  def part_2(numbers, boards) do
    compute_score(numbers, boards, :max)
  end

  def compute_score(numbers, boards, tag) do
    {nb, idx, board} = guess_winner(numbers, boards, tag)

    drawn = Enum.take(numbers, idx + 1)

    sum =
      board
      |> List.flatten()
      |> Enum.reduce(0, fn el, acc ->
        if el in drawn, do: acc, else: acc + el
      end)

    nb * sum
  end

  def parse_input(filepath \\ "data/input_04.txt") do
    with content = File.read!(filepath) do
      content =
        content
        |> String.split("\n", trim: false)

      numbers =
        content
        |> hd()
        |> String.split(",")
        |> Enum.map(&String.to_integer/1)

      boards =
        content
        |> tl()
        |> Enum.reduce([], fn x, boards ->
          if x == "" do
            [[] | boards]
          else
            x = String.split(x, " ") |> Enum.filter(&(&1 != "")) |> Enum.map(&String.to_integer/1)

            if boards == [[]] do
              [[x]]
            else
              [[x | hd(boards)] | tl(boards)]
            end
          end
        end)
        |> tl()

      {numbers, boards}
    end
  end

  def guess_winner(numbers, boards, tag) do
    indexed_numbers = Enum.with_index(numbers)

    boards
    |> Enum.reduce([], fn board, res ->
      rows_res =
        board
        |> check_rows(indexed_numbers)

      cols_res =
        board
        |> List.zip()
        |> Enum.map(&Tuple.to_list/1)
        |> check_rows(indexed_numbers)

      case {rows_res, cols_res} do
        {{_, :infinity}, {_, :infinity}} ->
          res

        {rows_res, cols_res} ->
          {el, idx} = minmax_by_index([rows_res, cols_res], :min)
          [{el, idx, board} | res]
      end
    end)
    |> minmax_by_index(tag)
  end

  def minmax_by_index(tuples, tag) do
    case tag do
      :min -> Enum.min(tuples, fn x, y -> elem(x, 1) < elem(y, 1) end)
      :max -> Enum.max(tuples, fn x, y -> elem(x, 1) > elem(y, 1) end)
    end
  end

  def check_rows(board, indexed_numbers) do
    board
    |> Enum.reduce({-1, :infinity}, fn row, acc ->
      # find last element for row or nil if not complete
      row_res =
        row
        |> Enum.reduce_while({-1, -1}, fn el, {nb, idx} ->
          case List.keyfind(indexed_numbers, el, 0) do
            nil ->
              {:halt, nil}

            {nb_new, idx_new} ->
              if idx_new > idx, do: {:cont, {nb_new, idx_new}}, else: {:cont, {nb, idx}}
          end
        end)

      # return current min last element for rows or nil if no row yet is complete
      if not is_nil(row_res) and elem(row_res, 1) < elem(acc, 1), do: row_res, else: acc
    end)
  end
end
