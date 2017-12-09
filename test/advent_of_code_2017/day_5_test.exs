defmodule AdventOfCode2017.Day5Test do
  use ExUnit.Case
  alias AdventOfCode2017.Day5

  test "part_1/1 returns number of steps to exit" do
    input = [0, 3, 0, 1, -3]
    assert Day5.part_1(input) == 5
  end

  test "part_2/1 returns number of steps to exit" do
    input = %{0 => 0, 1 => 3, 2 => 0, 3 => 1, 4 => -3}
    assert Day5.part_2(input) == 10
  end
end
