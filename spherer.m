function volume = spherer(r, n)
     num = pi ^ (n / 2);
     den = gamma(n / 2 + 1);
     
     volume = num / den * (r ^ n);
end