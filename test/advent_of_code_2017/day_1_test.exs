defmodule AdventOfCode2017.Day1Test do
  use ExUnit.Case
  alias AdventOfCode2017.Day1

  test "sum/1 sums digits matching subsequent digit" do
    assert Day1.sum([1,1,2,2]) == 3
    assert Day1.sum([1,1,1,1]) == 4
    assert Day1.sum([1,2,3,4]) == 0
    assert Day1.sum([9,1,2,1,2,1,2,9]) == 9
  end
end
