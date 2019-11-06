using PyPlot

function f(x)
    return exp(-x^2) - sin(x)
end

x=-1.:.001:10.; plot(x, @. f(x))
