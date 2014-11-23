load('../data/iris.mat');

N = length(X);

mean_X = mean(X, 2);

M = 2;

% Selection of principal components
pcs = [1 2; 1 3; 2 3];

z = zeros(N, M);

[PC V] = pca1(X);

%for i = 1 : M
%    curr_PC = PC(:, i);
%    
%    for n = 1 : N
%        z(n, i) = curr_PC' * (X(:, n) - mean_X);
%    end
%end

prepped_X = bsxfun(@minus, X, mean_X)';
C = linspace(1, 10, 150);

for i = 1 : length(pcs)
    pc_ix = pcs(i, :);

    curr_pc = PC(:, pc_ix);

    z = prepped_X * curr_pc;

    subplot(1, 3, i);
    scatter(z(:, 1), z(:, 2), [], C);
    
    x_axis = num2str(pc_ix(1));
    y_axis = num2str(pc_ix(2));
    
    title(strcat('Using PCs #', x_axis, ' and #', y_axis));
    xlabel(strcat('PC #', x_axis));
    ylabel(strcat('PC #', y_axis));
end