defmodule AdventOfCode2017.Day1 do
  def run() do
    "./lib/advent_of_code_2017/day_1/input.txt"
    |> File.stream!()
    |> Enum.reject(&comment_or_empty?(&1))
    |> List.flatten()
    |> List.first()
    |> String.trim_trailing()
    |> String.graphemes()
    |> Enum.map(&String.to_integer/1)
    |> sum()
  end

  def sum(digits), do: do_sum(0, [], digits)

  defp do_sum(accum, done, [n|[n|_]=next]) do
    do_sum(accum + n, [n|done], next)
  end
  defp do_sum(accum, done, [n]) do
    case Enum.reverse(done) do
      [^n|_] -> accum + n
      _ -> accum
    end
  end
  defp do_sum(accum, done, [n|next]) do
    do_sum(accum, [n|done], next)
  end

  defp comment_or_empty?(string) do
    String.starts_with?(string, "//") || string == "\n"
  end
end
