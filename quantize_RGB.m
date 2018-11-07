%%
function [outputImg,meancolors] = quantize_RGB(origImg,k)
I = origImg;
I = im2double(I);
a = size(I,1);
b = size(I,2);
c = size(I,3);
d = reshape(I,a*b,3);
[ind , center] = kmeans(d,k);
 a = center(ind,:);
 c = reshape(a,[size(I,1),size(I,2),3]);
 I2 = im2uint8(c);
 meancolors = center;
 outputImg = I2;
end
%%