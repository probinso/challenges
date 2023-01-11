#!/usr/bin/env julia

function collatz{T<:Integer}(n::T)

    d = Dict{T, T}()
    function helper(n, acc=1)
        if (n == 1); return acc; end
        new = mod(n, 2) == 0 ? div(n, 2) : 3n+1

        carry = get(d, new, 1)
        helper((carry == 1) ? new : 1, carry + acc)
    end

    index, max = -1, -1
    for i in 1:n
        value = helper(i)
        index, max = (value > max) ? (i, value) : (index, max)
        d[i] = value
    end
    #indmax(d) # doesn't do as expected
    index
end

println(collatz(1000000))
