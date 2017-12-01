defmodule AdventOfCode2017.Day1 do
  @input_path "./lib/advent_of_code_2017/day_1/input.txt"

  def solve_part_1() do
    @input_path
    |> parse()
    |> part_1()
  end

  def solve_part_2() do
    @input_path
    |> parse()
    |> part_2()
  end

  def part_1(digits) do
    digits
    |> pair_subsequent()
    |> sum_matching()
  end

  def part_2(digits) do
    digits
    |> pair_opposite()
    |> sum_matching()
  end

  def pair_subsequent(digits) do
    [first|rest] = digits
    rotate = rest ++ [first]

    digits
    |> Enum.zip(rotate)
  end

  def pair_opposite(digits) do
    len = Enum.count(digits)
    {first, second} = Enum.split(digits, Integer.floor_div(len, 2))
    rotate = second ++ first

    digits
    |> Enum.zip(rotate)
  end

  defp sum_matching(pairs) do
    Enum.reduce(pairs, 0, fn
      {n,n}, total -> total + n
      _, total -> total
    end)
  end

  defp parse(path) do
    path
    |> File.stream!()
    |> Enum.reject(&comment_or_empty?(&1))
    |> List.flatten()
    |> List.first()
    |> String.trim_trailing()
    |> String.graphemes()
    |> Enum.map(&String.to_integer/1)
  end

  defp comment_or_empty?(string) do
    String.starts_with?(string, "//") || string == "\n"
  end
end
