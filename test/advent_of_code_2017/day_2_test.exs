defmodule AdventOfCode2017.Day2Test do
  use ExUnit.Case
  alias AdventOfCode2017.Day2

  test "part_1/1 calculates checksum based on difference between highest and lowest values" do
    input = [
      [5, 1, 9, 5],
      [7, 5, 3],
      [2, 4, 6, 8]
    ]

    assert Day2.part_1(input) == 18
  end

  test "part_2/1 calculates checksum based on divisible numbers" do
    input = [
      [5, 9, 2, 8],
      [9, 4, 7, 3],
      [3, 8, 6, 5]
    ]
    assert Day2.part_2(input) == 9
  end
end
