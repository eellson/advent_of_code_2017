defmodule AdventOfCode2017.Day2 do
  @input_path "./lib/advent_of_code_2017/day_2/input.txt"

  def solve_part_1 do
    @input_path
    |> parse()
    |> part_1()
  end

  def part_1(input) do
    Enum.reduce(input, 0, fn row, accum  ->
      accum + difference(row)
    end)
  end

  def part_2(input) do
    Enum.reduce(input, 0, fn row, accum ->
      accum + even_division(row)
    end)
  end

  def even_division([head|tail]=row) do
    {i, j} =
      Stream.flat_map(row, fn i ->
        Stream.flat_map(List.delete(row, i), fn j ->
          [{i, j}]
        end)
      end)
      |> Enum.find(fn {i, j} ->
           Integer.mod(i, j) == 0
         end)
      |> IO.inspect()

    Integer.floor_div(i, j)
  end

  def difference([head|_]=row) do
    {min, max} = Enum.reduce(row, {head, head}, fn cell, {min, max} ->
      cond do
        cell < min -> {cell, max}
        cell > max -> {min, cell}
        true -> {min, max}
      end
    end)
    max - min
  end

  def parse(path) do
    path
    |> File.stream!()
    |> Enum.map(fn row ->
         row
         |> String.split()
         |> Enum.map(&String.to_integer/1)
       end)
  end
end
