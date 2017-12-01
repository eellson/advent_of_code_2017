defmodule AdventOfCode2017.Day1 do
  def sum(digits), do: do_sum(0, [], digits)

  defp do_sum(accum, done, [n|[n|rest]=next]) do
    # IO.inspect {done, n, next}
    do_sum(accum + n, [n|done], next)
  end
  defp do_sum(accum, done, [n]) do
    # IO.inspect {done, n}
    case Enum.reverse(done) do
      [^n|_] -> accum + n
      _ -> accum
    end
  end
  defp do_sum(accum, done, [n|next]) do
    # IO.inspect {done, n, n, next}
    do_sum(accum, [n|done], next)
  end
end
