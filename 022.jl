#!/usr/bin/env julia

function readfile(filename)
    f = open(filename)
    str = ""
    while !eof(f)
        str = readuntil(f, ",")
        if str[end] != ','
            break
        end
        produce(str[2:end-2])
    end
    produce(str[2:end-1])
    close(f)
end


function solution(filename::AbstractString="p022_names.txt")

    function score(name::AbstractString)
        char_score(c) = BigInt(c - 'A' + 1)
        sum(map(char_score, collect(name)))
    end

    f(index, name) = index*score(name)

    names = [name for name = collect(@task readfile(filename))]
    acc = 0
    for (index, name) in enumerate(sort(names))
        acc += index*score(name)
    end
    acc
end

println(solution())
