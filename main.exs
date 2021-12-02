

# $ mix run main.exs <day>

opt = System.argv() |> hd()
case Aoc2021.day(opt) do
  nil -> IO.puts("Oops, no code done for that day.")
  %{part_1: p1, part_2: p2} -> IO.puts("part 1: #{p1} \npart 2: #{p2}")
end
