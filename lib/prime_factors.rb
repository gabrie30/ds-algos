## Find the prime factors of n ##

## Since 2 is the only even prime number start by dividing by two
## When you can't divide by two any more, you have an odd number
## Then start dividing by odd numbers...incrementing the new counter by two

def prime_factorization(n)
  return [] if n <= 0
  factors = []

  while (n % 2 == 0)
    factors << n
    n /= 2
  end

  # n must be odd
  i = 3
  while (n > 3)
    while (n % i == 0)
      factors << i 
      n /= i
    end

    i += 2
  end

  factors
end

## TODO - try a recursive solution