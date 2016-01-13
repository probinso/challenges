# Project Euler 002

function stack(a::Int64, b::Int64, max::Float64)
    store = Int64[]

    ret::Int64 = 0
    while b < max
        push!(store, b, a+b)
        b = pop!(store)
        a = pop!(store)
        ret += b % 2 == 0 ? b : 0
    end
    ret
end

function recurse(a::Int64, b::Int64, max::Float64)
    function recurse_helper(a::Int64, b::Int64, acc::Int64)
        if b >= max
            return acc
        end
        recurse_helper(b, a+b, acc + (b % 2 == 0 ? b : 0))
    end
    recurse_helper(a, b, 0)
end

function main()
    for func = [stack, recurse]
        println(func(0, 1, 4e6))
    end
end

main()
