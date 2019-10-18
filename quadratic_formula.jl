function quadratic_formula1
  x1 = (-b + sqrt(b^2 -4*a*c)) / 2a
  x2 = (-b - sqrt(b^2 -4*a*c)) / 2a
  return x1, x2
end

function quadratic_formula2(a,b,c)
  x1 = (-b + sqrt(b^2 -4*a*c)) / 2a
  x2 = c/(a*x1)
  return x1, x2
end

a = 1
b = -50000.0001
c = 5

quadratic_formula1(a,b,c)
quadratic_formula2(a,b,c)
