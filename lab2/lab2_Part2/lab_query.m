function similar=lab_query (imgs,imgIndex,features,w,tolerance)
    dimens = size(size(w),2) - 1;
    assert(dimens == 1 || dimens == 2);
    similar=[];
    area=lab_closest(features(imgIndex,:), w, dimens);
    fprintf('%s: ', imgs(imgIndex).name);
    for i=1:size(imgs,1)
        if (i == imgIndex)
            continue;
        end
        diff = lab_closest(features(i,:), w, dimens);
        if (abs(diff - area) < tolerance)
            fprintf('%s ', imgs(i).name);
            similar=[similar,i];
        end
    end
    fprintf('\n');
        