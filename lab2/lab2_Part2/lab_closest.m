function index = lab_closest (obj, objs, dimens)
    d = 0;

    assert(dimens == 1 || dimens == 2);
    
    if dimens == 1
        index = -1;
        for i=1:size(objs,1)
            dtmp = mag(objs(i,:) - obj);
            if (dtmp < d || index == -1)
                d = dtmp;
                index = i;
            end
        end
    else
        if dimens == 2
            index=[-1,-1];
            for y=1:size(objs,1)
                for x=1:size(objs,2)
                    otmp = 0;
                    otmp(1:size(obj,2)) = objs(y,x,1:size(obj,2));
                    dtmp = mag(otmp - obj);
                    if (dtmp < d || index(1) == -1)
                        d = dtmp;
                        index = [y,x];
                    end
                end
            end
        end
    end