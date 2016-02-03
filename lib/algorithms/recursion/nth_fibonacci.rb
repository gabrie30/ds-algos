STORE = {}

def fast_fibs(n)
  return 0 if n == 1
  return 1 if n == 2

  if STORE[n] != nil
    return STORE[n]
  else
    STORE[n] = fast_fibs(n-2) + fast_fibs(n-1)
  end
end

p fast_fibs(10000)
