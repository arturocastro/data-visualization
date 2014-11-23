function err = reconst_err(eigen_vals, M)
    N = length(eigen_vals);
    err = sum(eigen_vals(M + 1 : N));
end