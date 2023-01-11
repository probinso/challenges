# Project Euler 003

function gpf(num::Int64)
    max::Int64 = ceil(sqrt(num))
    for prime in reverse(primes(max))
        if num % prime != 0
            continue
        end
        return prime
    end
end

function first_gpf(num::Int64)
    max::Int64 = ceil(sqrt(num))
    out::Int64 = 1

    cur::Int64 = num
    for prime::Int64 in primes(max)
        while cur%prime == 0
            out = prime
            cur /= prime
        end
    end
    out
end

function main()
    num::Int64 = 600851475143
    for func in [gpf, first_gpf]
        println(func(num))
    end
end

main()

