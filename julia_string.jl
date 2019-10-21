println(string("QWERTY[1]:", "QWERTY"[1]))

println(string("QWERTY[1:3]:", "QWERTY"[1:3]))

println(string("QWERTY[1:3:6]:", "QWERTY"[1:3:6]))

println(string("QWERTY[1:2:6]:", "QWERTY"[1:2:6]))

println(string("パリピープル[1:3:7]:", "パリピープル"[1:3:7]))

println(string("般若波羅蜜多[1:6:16]:", "般若波羅蜜多"[1:6:16]))

function next_index(s)
    n = firstindex(s)
    while n ≤ lastindex(s)
        println(s[n], " :", n)
        n = nextind(s, n)
    end
end

next_index("これはテストのために書いています")

println(reverse("文字順が反対になるそうです"))

println(split("もちろん 文字列の 分割も できます"))
println(split("もちろん/文字列の/分割も/できます/デリミタは/指定できます", "/"))
println(split("もちろん////文字列の//分割も/できます/正規表現も/使えます", r"/+"))
println(split("もちろん////文字列の//分割も/できます////スペースを//////無視すると//これだけでも/うまいこと/////////分割できます", "/", keepempty=false))
