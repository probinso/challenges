#!/usr/bin/env julia


function parselines(filename::AbstractString="067.input", T::Type=Int)
    f = open(filename)
    while !eof(f)
        line = readline(f)
        # splits on spaces and casts to T
        produce(map(x -> parse(T, x), split(line)))
    end
end

function solution()    
    g = @task parselines()
    store = consume(g)
    while true
        vals = consume(g)
        if vals == nothing
            break
        end

        for (index, key) in enumerate(vals)
            vals[index] = key + max(store[index], store[index+1])
        end
        store = vals
    end
    store[end]
end

println(solution())
