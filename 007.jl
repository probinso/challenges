using Lazy

isprime(n) =
    @>> primes begin
        Lazy.takewhile(x -> x<=sqrt(n))
        map(x -> n % x == 0)
        any; !
    end

# the prime numbers defined in terms of isprime:
primes = filter(isprime, Lazy.range(2));
println(reverse(Lazy.take(10001, primes))[1])
