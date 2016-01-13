function merge_factors(a, b)
    aDict, bDict = factor(a), factor(b)
    for k in keys(bDict)
        update = !haskey(aDict,k) || bDict[k] > aDict[k]
        aDict[k] = update ? bDict[k] : aDict[k]
    end

    prod([k^aDict[k] for k in keys(aDict)])
end

function f(max)
    li   = primes(max)
    base = reduce(merge_factors, setdiff(Set(2:max), Set(li)))
    base = merge_factors(prod(li), base)
end


function main()
    println(@elapsed f(20))
    # its important to remember lcm exists and it's value
    println(@elapsed reduce(lcm, 1:20))
end

main()
