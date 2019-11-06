function basel1(x)
    s = 0.0
    for i = 1:x
        s += 1/i^2
    end
    return s
end

function basel2(x)
    s = 0.0
    for i = 1:x
        s += 1/(8001-i)^2
    end
    return s
end

println(basel1(8000))
println(basel2(8000))
