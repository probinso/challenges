#!/usr/bin/env julia

function solution(filename::AbstractString="p022_names.txt")

    function score(name::AbstractString)
        char_score(c) = BigInt(c - 'A' + 1)
        sum(map(char_score, collect(name)))
    end

    function readfile(filename)
        f = open(filename)
        names = readlines(f)
        close(f)
        sort(names)
    end

    names = readfile(filename)
    println(names[938])
    #f(tup) = tup[1]*score(tup[2])
    #sum(map(f, enumerate(names)))
end

solution()
