#!/usr/bin/env julia

function solution{I<:Integer}(max::I=100)
    spaces = ndigits(max)
    function CracklePop(input::I)
        c = mod(input, 3) != 0 ? "" : "Crackle"
        p = mod(input, 5) != 0 ? "" : "Pop"
        " "^(spaces-ndigits(input))*"$(input) $(c)$(p)"
    end
    for i in 1:max
        println(CracklePop(i))
    end
end

solution(999)
