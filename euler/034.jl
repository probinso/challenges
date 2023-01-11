#!/usr/bin/env julia

f{T<:Integer}(n::T) = n == reduce(+, map(factorial, digits(n)))

# needs proof
