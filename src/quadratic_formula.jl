function quadratic_formula1(a,b,c)
    x1 = (-b + sqrt(b^2 -4*a*c)) / 2a
    x2 = (-b - sqrt(b^2 -4*a*c)) / 2a
    return x1, x2
end

a1 = quadratic_formula1(1, -50000.0001, 5)

function quadratic_formula2(a,b,c)
    x1 = (-b + sqrt(b^2 -4*a*c)) / 2a
    x2 = c/(a*x1)
    return x1, x2
end

a2 = quadratic_formula2(1, -50000.0001, 5)

println(string("a1:", a1))
println(string("a2:", a2))
println(string("x1:" , a1[1] - a2[1]))
println(string("x2:" , a1[2] - a2[2]))
