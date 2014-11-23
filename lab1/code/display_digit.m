function display_digit(image,s)

% INPUT ARGUMENTS
% image = 2D matrix to be displayed as image
% s = string for display style: s = 'actual' shows the image in actual
%     dimension while s = 'upscale' shows the zoomed image (default)

if nargin  == 2
    if strcmp(s,'upscale')
        imagesc(image); colormap(gray); axis off; %Shows zoomed gray scale image
    elseif strcmp(s,'actual')
        imshow(image); % Shows gray scale image of actual size
    end
else
    imagesc(image); colormap(gray); axis off;
end
