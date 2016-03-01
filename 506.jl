#!/usr/bin/env julia

function makeseq(number)
    ds = reverse(digits(number))
    produce(ds[1])
    while true
        for digit in ds[2:end-1]
            produce(digit)
        end
        for digit in reverse(ds)
            produce(digit)
        end
    end
end

undigits(d) = sum([big(d[k])*big(10)^big(k-1) for k = 1:length(d)])

function getseqint(gen, target::BigInt)
    acc = []
    while target > 0
        value  = consume(gen)
        target = target - value
        push!(acc, value)
    end
    undigits(reverse(acc))
end

function V(number)
    g = @task makeseq(number)
    i::BigInt = 0
    while true
        i = i + 1
        produce(getseqint(g, i))
    end

end

function S(n)
    v = @task V(1234)
    s::BigInt = 0
    for (index, value) in enumerate(take(v, n))
        s = s + value
        # println(index, " :: ", value, " :: ", s)
    end
    s
end

v = @task V(1234)
for i in 1:10^3
    consume(v)
end
#println(mod(S(10000), 123454321))
