defmodule AdventOfCode2017.Day1Test do
  use ExUnit.Case
  alias AdventOfCode2017.Day1

  test "part_1/1 sums digits matching subsequent digit" do
    assert Day1.part_1([1,1,2,2]) == 3
    assert Day1.part_1([1,1,1,1]) == 4
    assert Day1.part_1([1,2,3,4]) == 0
    assert Day1.part_1([9,1,2,1,2,1,2,9]) == 9
  end

  test "part_2/1 sums matching opposite digit" do
    assert Day1.part_2([1,2,1,2]) == 6
    assert Day1.part_2([1,2,2,1]) == 0
    assert Day1.part_2([1,2,3,4,2,5]) == 4
    assert Day1.part_2([1,2,3,1,2,3]) == 12
    assert Day1.part_2([1,2,1,3,1,4,1,5]) == 4
  end
end
