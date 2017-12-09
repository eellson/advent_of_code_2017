defmodule AdventOfCode2017.Day5 do
  @input_path "./lib/advent_of_code_2017/day_5/input.txt"

  def solve_part_1 do
    @input_path
    |> parse()
    |> part_1()
  end

  def solve_part_2 do
    @input_path
    |> parse_to_map()
    |> part_2()
  end

  def part_1(input) do
    do_part_1(input, 0, 0)
  end

  def part_2(input) do
    do_part_2(input, 0, 0)
  end

  def do_part_1(input, current, steps) do
    rel = Enum.at(input, current, :exit)

    update_or_exit(input, current, rel, steps)
  end

  def do_part_2(_input, nil, steps), do: steps
  def do_part_2(input, current, steps) do
    {rel, new_input} = Map.get_and_update(input, current, fn
      nil -> {nil,  steps}
      rel when rel >= 3 -> {rel, rel - 1}
      rel -> {rel, rel + 1}
    end)
    continue_or_exit(new_input, current, rel, steps)
  end

  def continue_or_exit(_input, _current, nil, steps), do: steps
  def continue_or_exit(input, current, rel, steps) do
    do_part_2(input, current + rel, steps + 1)
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

  def parse_to_map(file_path) do
    file_path
    |> File.stream!()
    |> Stream.map(fn line ->
      line
      |> String.trim()
      |> String.to_integer()
    end)
    |> Stream.with_index()
    |> Enum.to_list()
    |> Map.new(fn {n, i} -> {i, n} end)
  end
end
