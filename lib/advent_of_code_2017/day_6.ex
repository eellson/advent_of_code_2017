defmodule AdventOfCode2017.Day6 do
  @input_path "./lib/advent_of_code_2017/day_6/input.txt"

  def solve_part_1 do
    @input_path
    |> parse()
    |> part_1()
  end

  def part_1(input) do
    input
    |> do_part_1(0, MapSet.new([]))
  end

  def do_part_1(input, steps, seen) do
    pick_and_redistribute(input, steps, seen)
  end

  def pick_and_redistribute(input, steps, seen) do
    new_arrangement =
      input
      |> choose_redistribute()
      |> redistribute()

    cond do
      MapSet.member?(seen, new_arrangement) ->
        steps + 1
      true ->
        pick_and_redistribute(new_arrangement, steps + 1, MapSet.put(seen, new_arrangement))
    end
  end

  def choose_redistribute(input) do
    to_redistribute = Enum.max(input)
    position = Enum.find_index(input, &(&1 == to_redistribute))

    {input, to_redistribute, position}
  end

  def redistribute({input, to_redistribute, position}) do
    input
    |> List.update_at(position, fn _ -> 0 end)
    |> do_redistribute(to_redistribute, position + 1)
  end

  def do_redistribute(input, 0, position), do: input
  def do_redistribute(input, to_redistribute, position) when position >= length(input) do
    do_redistribute(input, to_redistribute, 0)
  end
  def do_redistribute(input, to_redistribute, position) do
    input
    |> List.update_at(position, &(&1 + 1))
    |> do_redistribute(to_redistribute - 1, position + 1)
  end

  def parse(file_path) do
    file_path
    |> File.read!()
    |> String.split()
    |> Enum.map(&String.to_integer/1)
  end
end
