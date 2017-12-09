defmodule AdventOfCode2017.Day5Test do
  use ExUnit.Case
  alias AdventOfCode2017.Day5

  test "part_1/1 returns number of steps to exit" do
    input = [0, 3, 0, 1, -3]
    assert Day5.part_1(input) == 5
  end
end
