#!/usr/bin/env julia

function solution{I<:Integer}(max::I=100)
    spaces = ndigits(max)
    function FizzBuzz{S<:AbstractString}(input, fizz::S="Fizz", buzz::S="Buzz")
        c = mod(input, 3) != 0 ? "" : fizz
        p = mod(input, 5) != 0 ? "" : buzz
        " "^(spaces-ndigits(input))*"$(input) $(c)$(p)"
    end
    for i in 1:max
        println(FizzBuzz(i, "Crackle", "Pop"))
    end
end

solution(999)
