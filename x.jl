#!/usr/bin/env julia

function solution{I<:Integer}(max::I=100)
    spaces = ndigits(max)
    function CracklePop(input::I)
        c = mod(input, 3) != 0 ? "" : "Fizz"
        p = mod(input, 5) != 0 ? "" : "Buzz"
        " "^(spaces-ndigits(input))*"$(input) $(c)$(p)"
    end
    for i in 1:max
        println(CracklePop(i))
    end
end

solution(999)
