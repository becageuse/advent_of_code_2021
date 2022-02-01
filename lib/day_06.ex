defmodule Aoc2021.Day06 do

  import While
  def part_1(seeds, days) do
    grow_population(seeds, days)
  end

  def part_2(seeds, days) do
    iterative_grow_population(seeds, days)
  end

  def parse_input(filepath \\ "data/input_06.txt") do
    with content = File.read!(filepath) do
      content
      |> String.trim("\n")
      |> String.split(",")
      |> Enum.map(&String.to_integer/1)
    end
  end

  def do_grow_population(_, day, days) when day > days do
    0
  end

  def do_grow_population(timer, day, days) do
    case timer do
      0 -> 1 + do_grow_population(6, day + 1, days) + do_grow_population(8, day + 1, days)
      _ -> do_grow_population(timer - 1, day + 1, days)
    end
  end

  def iterative_do_grow_population(timer, day, days) do
    # Using tutorial for converting recursion to iteration in https://www.cs.odu.edu/~zeil/cs361/latest/Public/recursionConversion/index.html
    # Still too slow probably because while implementation might uses recursion..
    acc = 0
    stack = [%{timer: timer, day: day}]
    n_loop = 0
    {acc, stack, n_loop} = while({acc, stack, n_loop}, (length(stack) > 0)) do
      # IO.inspect(acc, label: :acc)
      n_loop = n_loop + 1
      # IO.inspect(n_loop)
      params = List.last(stack)
      stack = List.delete_at(stack, -1)

      if (params.day <= days) do
        if (params.timer == 0) do
          acc = acc + 1
          stack = stack ++ [%{timer: 6, day: params.day + 1}] ++ [%{timer: 8, day: params.day + 1}]
          {acc, stack, n_loop}
        else
          stack = stack ++ [%{timer: params.timer - 1, day: params.day + 1}]
          {acc, stack, n_loop}
        end
      else
        {acc, stack, n_loop}
      end
    end

    acc
  end


  def grow_population(init_state, days) do
    Enum.reduce(init_state, 0, fn timer, acc ->
      acc + do_grow_population(timer, 1, days)
    end) + length(init_state)
  end

  def iterative_grow_population(init_state, days) do
    Enum.reduce(init_state, 0, fn timer, acc ->
      acc + iterative_do_grow_population(timer, 1, days)
    end) + length(init_state)
  end
end
