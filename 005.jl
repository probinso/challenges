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

function fastest(max)
    li   = primes(max)
    base = reduce(lcm, setdiff(Set(2:max), Set(li)))
    lcm(base, prod(li))
end

function main()
    max = 43
    # println(@elapsed f(max))
    # its important to remember lcm exists and it's value
    simplest(max) = reduce(lcm, 1:max)
    println(@elapsed simplest(max))
    println(@elapsed fastest(max))
end

main()
