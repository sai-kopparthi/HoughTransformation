
function [centers] =  detect_circles(I,radius,usegradient)
PI = 3.1420;
Ia = I;
I = rgb2gray(I);
e = edge(I,'Canny',0.6,8);
imshow(e)
pause
[r,c] = find(e==1);
ca = zeros(size(I,1),size(I,2));
a = zeros(size(r,1),360);
b = zeros(size(c,1),360);
centers = zeros(5,2);
for i = 1:size(r,1)
     if (usegradient == 0)
         for t = 1:1:360
             a(i,t) = round(r(i) - (radius * cos(t*PI/180)));
             b(i,t) = round(c(i) - (radius * sin(t*PI/180)));
             x = a(i,t);
             y = b(i,t);
             if(x>0 & y>0 & x<size(I,1) & y<size(I,2))
                 ca(x,y) = ca(x,y) + 1;
             end
         end
     else
         [Gx,Gy] = imgradientxy(I);
         t = atan2(Gy,Gx);
         m = round(rad2deg(t));
         if (m >0)
             a(i,m) = round(r(i) - (radius * cos(t)));
             b(i,m) = round(c(i) - (radius * sin(t)));
             x = a(i,m);
             y = b(i,m);
             if(x>0 & y>0 & x<size(I,1) & y<size(I,2))
                 ca(x,y) = ca(x,y) + 1
             end
         end
     end
end
cm = ca;
imagesc(ca);
pause;
for i = 1:5
    [Value,Ind]=max(cm(:));
    [M,N]=ind2sub(size(cm),Ind);
    centers(i,1) = M;
    centers(i,2) = N;
    cm(M,N) = 0;
end
for i = 1:size(centers,1)
    Ia = circle(centers(i,1),centers(i,2),radius,Ia);
end
imshow(Ia);
pause;
end

function I = circle(x,y,r,I)
PI = 3.1420;
for th = 1:1:360
    xunit = round(r * cos(th*PI/180) + x)
    yunit = round (r * sin(th*PI/180) + y) 
    I(xunit,yunit,1) = 255;
    I(xunit,yunit,2) = 0;
    I(xunit,yunit,3) = 0;
end
end
