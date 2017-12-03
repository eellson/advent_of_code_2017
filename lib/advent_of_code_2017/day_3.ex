defmodule AdventOfCode2017.Day3 do
  def solve_part_1 do
    361527
    |> part_1()
  end

  def part_1(position) do
    {square, i} =
      1
      |> Stream.iterate(&(&1+2))
      |> Stream.with_index(1)
      |> Enum.find(fn {side, _i} ->
        :math.pow(side, 2) >= position
      end)

    points =
      with max_pos <- :math.pow(square, 2) |> trunc(),
           length_of_side <- square - 1,
           corner_2 <- max_pos - length_of_side,
           corner_3 <- corner_2 - length_of_side,
           corner_4 <- corner_3 - length_of_side,
           min <- corner_4 - length_of_side
      do
        [corner: max_pos,
         side: (max_pos - 1)..(corner_2 + 1),
         corner: corner_2,
         side: (corner_2 - 1)..(corner_3 + 1),
         corner: corner_3,
         side: (corner_3 - 1)..(corner_4 + 1),
         corner: corner_4,
         side: (corner_4 - 1)..(min + 1)]
      end

    side_or_corner =
      points
      |> Enum.find(fn
        {:side, range} -> Enum.member?(range, position)
        {:corner, ^position} -> position
        _ -> false
      end)

    distance = fn
      {:side, range} ->
        midpoint =
          range
          |> Enum.count() 
          |> Integer.floor_div(2)
          |> Kernel.+(Enum.min(range))
        to_midpoint = Kernel.abs(position - midpoint)
        to_centre = i - 1

        to_midpoint + to_centre
      {:corner, _value} ->
        :math.pow((i - 1), 2)
    end

    distance.(side_or_corner)
  end

  def part_2() do
    walk()
    |> Enum.find(&(&1[:value] > 361527))
  end

  def walk do
    %{position: {0,0}, direction: {1,0}, value: 1}
    |> Stream.iterate(&step(&1))
    |> Stream.transform([], &calc_values/2)
  end

  defp step(%{position: {x,y}}=state) when y > 0 and x == y do
    %{state|direction: {-1, 0}} |> do_step()
  end
  defp step(%{position: {x,y}}=state) when y > 0 and x == -y do
    %{state| direction: {0, -1}} |> do_step()
  end
  defp step(%{position: {x,y}}=state) when y < 0 and x == y do
    %{state|direction: {1, 0}} |> do_step()
  end
  defp step(%{position: {x,y}}=state) when y <= 0 and (x - 1 == -y) do
    %{state|direction: {0, 1}} |> do_step()
  end
  defp step(state), do: do_step(state)

  defp do_step(%{direction: {dx, dy}, position: {x,y}}=state) do
    %{state|position: {x+dx, y+dy}}
  end

  defp calc_values(%{position: position}=state, previous) do
    cell_with_value = %{state|value: sum_neighbours(position, previous)}
    {[cell_with_value], [cell_with_value|previous]}
  end


  defp sum_neighbours({0, 0}, _all), do: 1
  defp sum_neighbours({x, y}, all) do
    for i <- x-1..x+1, j <- y-1..y+1 do
      Enum.find(all, fn
        %{position: {^i, ^j}} -> true
        _ -> false
      end)
    end
    |> Enum.reject(&(is_nil(&1[:value])))
    |> Enum.map(&(&1[:value]))
    |> Enum.sum()
  end
end
