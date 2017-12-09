defmodule AdventOfCode2017.Day6Test do
  use ExUnit.Case
  alias AdventOfCode2017.Day6

  test "part_1/1 returns number of redistributions until dup" do
    input = [0, 2, 7, 0]

    assert Day6.part_1(input) == 5
  end
end
