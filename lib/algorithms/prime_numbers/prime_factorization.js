function primeFactorization(n) {
    var factors = [];
    var i = 3;
    
    if (n <= 1) {
        return [];
    }
    
    while (n % 2 === 0) {
        factors.push(2);
        n /= 2;
    }
    
    while (i <= n) {
        while ( n % i === 0) {
            factors.push(i);
            n /= i;
        }
        i += 2;
    }
    
    return factors;
}