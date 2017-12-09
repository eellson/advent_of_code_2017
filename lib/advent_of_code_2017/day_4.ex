defmodule AdventOfCode2017.Day4 do
  @input_path "./lib/advent_of_code_2017/day_4/input.txt"

  def solve_part_1 do
    @input_path
    |> parse()
    |> part_1()
  end

  def solve_part_2 do
    @input_path
    |> parse()
    |> part_2()
  end

  def part_1(input) do
    input
    |> Enum.count(&(Enum.uniq(&1) == &1))
  end

  def part_2(input) do
    input
    |> Enum.map(fn line ->
      line
      |> Enum.map(fn word ->
        word
        |> String.to_charlist()
        |> Enum.sort()
      end)
    end)
    |> Enum.count(&(Enum.uniq(&1) == &1))
  end

  def parse(path) do
    path
    |> File.stream!()
    |> Enum.map(fn line ->
      line
      |> String.trim()
      |> String.split()
    end)
  end
end
