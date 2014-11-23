function gimg=lab_rgb2gray (img)
    for y=1:size(img,1)
        for x=1:size(img,2)
            gimg(y,x) = sum(img(y,x,:)) / 3;
        end
    end