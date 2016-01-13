function sqr_diff(max)
    li = 1:100
    sum(li)^2 - sum(map(x -> x^2, li))
end

println(sqr_diff(100))
