# Project Euler 004

function palendrome(value::Int)
    str::AbstractString = string(value)
    mid::Int = div(length(str), 2)
    str[1:mid] == reverse(str)[1:mid]
end

function digit_range(digits::Int)
    base = 10
    base^(digits-1), base^(digits)-1
end

function gpn(min::Int, max::Int)
    #= greatest palendrome number =#
    ret::Int = 0
    for i::Int in reverse(min:max)
        values = filter(palendrome, [i*j for j in i:max])
        push!(values, ret)
        # maximum used for vectors, max used for element pairs
        ret = maximum(values)
    end
    ret
end

function main()
    println(gpn(digit_range(3)...)) # example of unpacking tuple
end

main()

