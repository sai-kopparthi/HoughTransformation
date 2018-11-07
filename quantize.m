clear all;
close all;
I = imread('down.jpg');
quantize_RGB(I,4)
function  quantize_RGB(I,k)
%select random pixel points
I = im2double(I);
Rx = randi(size(I,1),1,k);
Ry = randi(size(I,2),1,k);
% update the cluster values till the threshold value become less than T
T = 0.0001;
I1 = zeros(size(I,1),size(I,2),3,'uint8');
% Array that stores the RGB value of the random points of the cluster
rrgb = zeros(k,size(I,3));
rrgbn = zeros(k,size(I,3));
for j = 1:k
   rrgb(j,:) = I(Rx(j),Ry(j),:); 
end
%Matrix that stores the value of the distances between the cluster centers intensities and their points 
a = zeros(size(I,1),size(I,2),k);
da  = zeros(size(I,1),size(I,2));
flag = 1;
for m = 1:200
%calculate the eucledean distance from every point and the cluster value
for j = 1:k
   c = (I(:,:,1)-rrgb(j,1)).^2+(I(:,:,2)-rrgb(j,2)).^2+(I(:,:,3)-rrgb(j,3)).^2;
   a(:,:,j) = sqrt(c) ;
end
[val,map] = min(a,[],3);
%find the mean of the values of all the corresponding componet values of the map
for k = 1 : k
    count1 = 0;
    sum1 = 0;
    sum2 = 0;
    sum3 = 0;
    for i = 1:size(map,1)
        for j = 1:size(map,2)
            if(map(i,j) == k)
                count1 = count1+1;
                sum1 = sum1 + I(i,j,1);
                sum2 = sum2 + I(i,j,2);
                sum3 = sum3 + I(i,j,3);
            end
        end
    end
  sum1 = sum1/count1;
  sum2 = sum2/count1;
  sum3 = sum3/count1;
 rrgbn(k,1) = sum1;
 rrgbn(k,2) = sum2;
 rrgbn(k,3) = sum3;
end
diffvalue = abs(rrgb-rrgbn);
rrgb = rrgbn
end
for k = 1:k
    for i = 1 : size(I,1)
        for j = 1 : size(I,2)
            if(map(i,j) == k)
               I(i,j,1) = rrgb(k,1);
               I(i,j,2) = rrgb(k,2);
               I(i,j,3) = rrgb(k,3);
            end
        end
    end
end    
imshow(im2uint8(I))
end