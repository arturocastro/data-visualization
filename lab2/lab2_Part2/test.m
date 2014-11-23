%[imgs, training] = lab_featuresets('../Image/', -1);

som_show(som, 'umat', 'all');
lab_showsimilar(imgs, training, som.codebook, 1);
