# Project Euler 001
function main(max::Int64)
    tot::Int64 = 0
    tot = sum([x%3==0 || x%5==0 ? x : 0 for x=1:max-1])
    tot
end

println(main(1000))
