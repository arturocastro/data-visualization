function dimg = lab_downsample(img, dw, dh)
    tmpimg1 = double(img);
    [h,w,colors] = size(img);
    pw=w/dw;
    ph=h/dh;

    % Shrink x
    for y=1:h
        for x=1:dw
            p = 0;
            n = 0;
            for px=floor(pw*x):ceil(pw*x+pw)
                if (px > w)
                    break;
                end
                n = n+1;
                
                if colors==3
                    pixel=[tmpimg1(y,px,1),tmpimg1(y,px,2),tmpimg1(y,px,3)];
                else 
                    pixel=tmpimg1(y,px);
                end
                    
                p = pixel + p;
            end
            p = p / n;
            
            if colors==3
                tmpimg2(y,x,1) = p(1);
                tmpimg2(y,x,2) = p(2);
                tmpimg2(y,x,3) = p(3);
            else
                tmpimg2(y,x) = p;
            end 
        end
    end
    
    [h,w,ignore] = size(tmpimg2);
    
    % Shrink y
    for x=1:w
        for y=1:dh
            p = 0;
            n = 0;
            for py=floor(ph*y):ceil(ph*y+ph)
                if (py > h)
                    break;
                end
                n = n+1;
                
                if colors==3
                    pixel=[tmpimg2(py,x,1),tmpimg2(py,x,2),tmpimg2(py,x,3)];
                else
                    pixel=tmpimg2(py,x);
                end
                    
                p = pixel + p;
            end
            p = p / n;
            
            if colors==3
                dimg(y,x,1) = p(1);
                dimg(y,x,2) = p(2);
                dimg(y,x,3) = p(3);
            else
                dimg(y,x) = p;
            end
        end
    end
  
    % reduce the data. Average 2x2 blocks
%    [h,w,ignore] = size(dimg);
 %   while (h > dh && w > dw)
  %      tmpimg = 0;
  %      for lx=1:w/2,
  %          for ly=1:h/2,
  %              x = (lx-1)*2+1;
   %             y = (ly-1)*2+1;
   %             tmpimg(ly,lx,1) = (dimg(y,x,1) + dimg(y+1,x,1) + dimg(y,x+1,1) + dimg(y+1,x+1,1))/4;
   %             tmpimg(ly,lx,2) = (dimg(y,x,2) + dimg(y+1,x,2) + dimg(y,x+1,2) + dimg(y+1,x+1,2))/4;
   %             tmpimg(ly,lx,3) = (dimg(y,x,3) + dimg(y+1,x,3) + dimg(y,x+1,3) + dimg(y+1,x+1,3))/4;
   %         end
   %     end
   %     dimg = tmpimg;
   %     [h,w,ignore] = size(dimg);
   %end


%function o = resize_image(img, w, h)
%
%    oldW = size(img, 1);
%    oldH = size(img, 2);
%    assert(w < oldW)
%    assert(h < oldH)
%    assert(mod(w, ) == 0);
%    assert(mod(h, 8) == 0);
%    assert(mod(oldW, 8) == 0);
%    assert(mod(oldH, 8) == 0);
%
%    while (oldW ~= w)
%        oldW = oldW / 2.0;
%        
%        k = 1;
%        for i = 1:oldW
%            img(i) = img(k) * 0.5 + img(k + 1) * 0.5;
%            k = k + 2;
%        end
%    end
	