defmodule AdventOfCode2017.Day3Test do
  use ExUnit.Case
  alias AdventOfCode2017.Day3

  test "part_1/1 calculates manhattan distance from given square" do
    assert Day3.part_1(1) == 0
    assert Day3.part_1(12) == 3
    assert Day3.part_1(23) == 2
    assert Day3.part_1(1024) == 31
  end

  test "walk/0 should return coords for square spiral" do
    assert Day3.walk() |> Enum.take(11) |> Enum.map(&(&1[:position])) == [
      { 0, 0},
      { 1, 0},
      { 1, 1},
      { 0, 1},
      {-1, 1},
      {-1, 0},
      {-1,-1},
      { 0,-1},
      { 1,-1},
      { 2,-1},
      { 2, 0}]

    assert Day3.walk() |> Enum.take(11) |> Enum.map(&(&1[:value])) ==
      [1, 1, 2, 4, 5, 10, 11, 23, 25, 26, 54]
  end
end
