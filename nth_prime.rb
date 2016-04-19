class Prime
  def nth(n)
    raise ArgumentError, 'Must be a positive integer' if n < 1
    return 2 if n == 1

    primes = [2]
    curr = 3
    while primes.size < n
      primes << curr if primes.all? { |p| curr % p != 0 }
      curr += 1
    end

    return primes.last
  end
end