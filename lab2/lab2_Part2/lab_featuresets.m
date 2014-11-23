function [imgs,features] = lab_featuresets (imgDir, maxSamples) 
% -- Purpose: Extracts all features from images located in a directory
% -- imgDir: Directory containing the images. Must have a \ or / at the end
% -- maxSamples: Number of images to sample. Set to -1 for all.

    imgs = dir(imgDir);
    if (size(imgs, 1) == 0)
        fprintf(2, 'No images found.\n');
        imgs=[];
        features=[];
        return;
    end
    
    fprintf(2, 'Extracting features...\n');    
   
    toRemove = [];
    
    % Remove non-JPGs
    for i=1:size(imgs,1)
        isjpg=findstr(imgs(i).name, '.jpg');
        if (size(imgs(i).name, 2) < 4 || size(isjpg,1) == 0)
            isjpg=findstr(imgs(i).name, '.JPG');
            if (size(imgs(i).name, 2) < 4 || size(isjpg,1) == 0)
                fprintf(2, 'Ignoring %s as it is not a JPG\n', imgs(i).name);
                toRemove = [toRemove, i]; 
            end
        end
    end
   
    imgs(toRemove) = [];
    
    if (maxSamples < 0)
        maxSamples = size(imgs,1);
    end
    
    for i=1:maxSamples   
        imgs(i).name=sprintf('%s%s', imgDir,imgs(i).name);
        img = imread(imgs(i).name);

        [tf1,tf2,tf3,tf4,tf5] = lab_features(img);
        f1(i,:) = tf1;
        if (size(tf2, 1) > 0)
           f2(i,:) = tf2;
        end
        if (size(tf3, 1) > 0)
           f3(i,:) = tf3;
        end
        if (size(tf4, 1) > 0)
           f4(i,:) = tf4;
        end
        if (size(tf5, 1) > 0)
           f5(i,:) = tf5;
        end
        
        fprintf(2, '%d/%d %s\n', i, maxSamples, imgs(i).name); 
    end
    
    f1=som_normalize(f1, 'var');
    features = f1;
    if (size(tf2, 1) > 0)
        f2=som_normalize(f2, 'var');
        features = [features f2];
    end
    if (size(tf3, 1) > 0)
        f3=som_normalize(f3, 'var');
        features = [features f3];
    end
    if (size(tf4, 1) > 0)
        f4=som_normalize(f4, 'var');
        features = [features f4];
    end
    if (size(tf5, 1) > 0)
        f5=som_normalize(f5, 'var');
        features = [features f5];
    end

