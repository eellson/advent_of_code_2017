%{
  [ 0, 0] => [value: 1, previous: :no],
  [ 1, 0] => [previous: [[0,0]], value: 1],
  [ 1, 1] => [previous: [[1,0],[0,0]], value: 2],
  [ 0, 1] => [previous: [[0,0], [1,0], [1,1]], value: 4],
  [-1, 1] => [previous: [[0,0], [0,1]], value: 5],
  # [-1, 0],
  # [-1,-1],
  # [ 0,-1],
  # [ 1,-1],
  # [ 2,-1]
  # [ 2, 0],
}

# We can add previous to value if both x and y are within 1 away, (and value
# calculated previously).
