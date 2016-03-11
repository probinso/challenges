#!/usr/bin/env julia

function pythagorean_triple{T <: Integer}(n::T)
    (2n + 1, 2n * (n + 1), 2n * (n + 1) + 1)
end

function solution(M::Integer=1000)
    for a = 1:M, b = a:M, c = b:M
        if (a^2 + b^2 == c^2) & (a + b + c == M)
            println((a, b, c))
            println(a*b*c)
        end 
    end
end

solution()
