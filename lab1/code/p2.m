load('../data/digit.mat');

train_N = length(train);
test_N = length(test);

img_axis_len = length(train{1});

img_len = img_axis_len ^ 2;

tr_1d = zeros(img_len, train_N);
te_1d = zeros(img_len, test_N);

for i = 1 : train_N
    curr_img = train{i};
    
    tr_1d(:, i) = curr_img(:);
end

for i = 1 : test_N
    curr_img = test{i};
    
    te_1d(:, i) = curr_img(:);
end

[PC V] = pca2(tr_1d);

% Select M - confiure parameter
M = PoV(V, 0.99);

selected_PC = PC(:, 1 : M);

mean_te = mean(te_1d, 2);

prepped_X = bsxfun(@minus, te_1d, mean_te)';

z = prepped_X * selected_PC;
    
tmp = selected_PC * z';
    
reconst_1d = bsxfun(@plus, tmp, mean_te);

ix = 1 : img_axis_len : img_len;

reconst_2d = cell(size(test));

for n = 1 : test_N
    reconst_2d{n} = zeros(img_axis_len, img_axis_len);
    
    curr = reconst_1d(:, n);

    %curr(curr < 0.0) = 0.0;
    
    for i = 1 : img_axis_len
        reconst_2d{n}(:, i) = curr(ix(i) : ix(i) + 27);
    end
end

err = reconst_err(V, M);

M
err

%subplot(2, 1, 1);
%display_digit(test{1});
%subplot(2, 1, 2);
%display_digit(reconst_2d);

