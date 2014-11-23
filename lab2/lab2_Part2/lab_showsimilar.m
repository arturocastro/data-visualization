function lab_showsimilar (imgs,samples,w,tolerance)
    visited=[];
    for imgIndex=1:size(imgs,1)
        alreadyVisited = 0;
        for i=1:size(visited,2)
            if visited(i)==imgIndex
                alreadyVisited = 1;
                break;
            end
        end
        if (alreadyVisited)
            continue;
        end
        similar=lab_query(imgs,imgIndex,samples,w,tolerance)
        img=imread(imgs(imgIndex).name);
        imshow(img);
        visited = [visited, imgIndex];
        waitforbuttonpress;
        for i=1:size(similar,2)
           img=imread(imgs(similar(i)).name);
           imshow(img);
           waitforbuttonpress;
           visited = [visited, similar(i)];
        end
        q=questdlg('Display next set?', 'SOM');
        if (strcmp(q, 'No') || strcmp(q, 'Cancel'))
            break;
        end
    end
end
