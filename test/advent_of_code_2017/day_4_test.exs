defmodule AdventOfCode2017.Day4Test do
  use ExUnit.Case
  alias AdventOfCode2017.Day4

  # A new system policy has been put in place that requires all accounts to use a passphrase instead of simply a password. A passphrase consists of a series of words (lowercase letters) separated by spaces.

  # To ensure security, a valid passphrase must contain no duplicate words.

  # For example:

  # aa bb cc dd ee is valid.
  # aa bb cc dd aa is not valid - the word aa appears more than once.
  # aa bb cc dd aaa is valid - aa and aaa count as different words.
  # The system's full passphrase list is available as your puzzle input. How many passphrases are valid?

  test "part_1/1 returns count of valid passwords" do
    input = [
      ~w(aa bb cc dd ee),
      ~w(aa bb cc dd aa),
      ~w(aa bb cc dd aaa)
    ]
    assert Day4.part_1(input) == 2
  end
end

