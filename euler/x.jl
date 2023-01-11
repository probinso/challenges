#!/usr/bin/env julia

# Insight
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

# Codeval
function solution(a::Integer, b::Integer, max::Integer)

    function FizzBuzz(input, fizz="F", buzz="B")
        c = mod(input, a) != 0 ? "" : fizz
        p = mod(input, b) != 0 ? "" : buzz
        fizzbuzz = "$(c)$(p)"
        (fizzbuzz != "" ? fizzbuzz : "$(input)")*" "
    end
    for i in 1:max
        print(FizzBuzz(i, "F", "B"))
    end
end

toInt = s -> parse(Int, s)
solution(map(toInt, ARGS)...)
println()
