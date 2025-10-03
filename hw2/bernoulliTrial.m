function prob = bernoulliTrial(p,n,k)

    prob = factorial(n) / (factorial(n-k) * factorial(k)) * p^k * (1-p)^(n-k);

end