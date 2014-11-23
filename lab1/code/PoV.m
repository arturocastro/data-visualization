function M = PoV(eig_vals, e_threshold)
    N = length(eig_vals);

    e = 0.0;
    k = 1;
    
    den = sum(eig_vals);

    while k < N && e < e_threshold
        num = sum(eig_vals(1 : k));
        
        e = num / den;
        
        k = k + 1;
    end
    
    M = k;
end