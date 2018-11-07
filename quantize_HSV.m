%%
function [outputImg,meanhues,hsvimage] = quantize_HSV(origImg,k)
I1 = origImg;
I2 = zeros(size(I1,1),size(I1,2),size(I1,3),'uint8');
I3 = zeros(size(I1,1),size(I1,2),size(I1,3),'double');
I4 = zeros(size(I1,1),size(I1,2),size(I1,3),'uint8');
I = rgb2hsv(I1);
a = size(I,1);
b = size(I,2);
c = size(I,3);
Ia = I(:,:,1);
Ib = I(:,:,2);
Ic = I(:,:,3);
ca = zeros(size(I,1)*size(I,2),size(I,3),'double');  
d = reshape(Ia,a*b,1);
e = reshape(Ib,a*b,1);
f = reshape(Ic,a*b,1);
[ind , center] = kmeans(d,k);
a = center(ind,:);
ca = [a e f];
I3 =reshape(ca,[size(I1,1),size(I1,2),size(I1,3)]);
hsvimage = I3;
I3 = hsv2rgb(I3);
I4 = im2uint8(I3);
outputImg = I4;
meanhues = center;
end
%%