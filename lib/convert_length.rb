UNITS = { m: 1.0, ft: 3.28, in: 39.37 }

def convert_length(length, from: :unit_from, to: :unit_to)
  (length / UNITS[from] * UNITS[to]).round(2)
end