function val1(a, x)
  x1 = sqrt(a + x) - sqrt(a)
  return x1
end

function val2(a, x)
  x1 = x / (sqrt(a + x) + sqrt(a))
  return x1
end

val1(1, 0031834)
val2(1, 0031834)
