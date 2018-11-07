I = imread('download.jpg');
imshow(I);
impixelinfo;
pause;
[center] = detect_circles(I,110,1)
 