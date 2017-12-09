defmodule AdventOfCode2017.Day5 do
  @input_path "./lib/advent_of_code_2017/day_5/input.txt"

  def solve_part_1 do
    @input_path
    |> parse()
    |> part_1()
  end

  def part_1(input) do
    do_part_1(input, 0, 0)
  end

  def do_part_1(input, current, steps) do
    rel = Enum.at(input, current, :exit)

    update_or_exit(input, current, rel, steps)
  end

  def update_or_exit(_input, _current, :exit, steps), do: steps
  def update_or_exit(input, current, rel, steps) do
    new_input = List.update_at(input, current, &(&1 + 1))
    do_part_1(new_input, current + rel, steps + 1)
  end

  def parse(file_path) do
    file_path
    |> File.stream!()
    |> Stream.map(fn line ->
      line
      |> String.trim()
      |> String.to_integer()
    end)
    |> Enum.to_list()
  end
end
