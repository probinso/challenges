#!/usr/bin/env julia

function readfile(filename)
    f = open(filename)
    term = ','
    str = readuntil(f, term)
    while !eof(f)
        produce(str[2:end-2])
        str = readuntil(f, term)
        if str[end] != term
            break
        end
    end
    produce(str[2:end-1])
    close(f)
end


function solution(filename::AbstractString="p022_names.txt")

    function score(name::AbstractString)
        char_score(c) = c - 'A' + 1
        sum(map(char_score, collect(name)))
    end

    names = collect(@task readfile(filename))
    acc = 0
    for (index, name) in enumerate(sort(names))
        acc += index*score(name)
    end
    acc
end

println(solution())
