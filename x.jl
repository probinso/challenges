#!/usr/bin/env julia

function solution{I<:Integer}(max::I=100)
    spaces = ndigits(max)
    function FizzBuzz(input::I, fizz::AbstractString="Fizz", buzz::AbstractString="Buzz")
        c = mod(input, 3) != 0 ? "" : fizz
        p = mod(input, 5) != 0 ? "" : buzz
        " "^(spaces-ndigits(input))*"$(input) $(c)$(p)"
    end
    for i in 1:max
        println(FizzBuzz(i))
    end
end

solution(999)
