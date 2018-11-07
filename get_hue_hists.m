
%%
function [histEquale,histClustered] = get_hue_hists(I,k)
C = rgb2hsv(I);
C = C(:,:,1);
C = reshape(C,[size(C,1)*size(C,2),1]);
histogram(C,k)
pause
[A,k,I] = quantize_HSV(I,k);
Ia = I(:,:,1);
ma = reshape(Ia,[size(Ia,1)*size(Ia,2),1]);
bin = zeros(size(ma));
c =size(ma,1);
nbins = size(k,1);
histogram(ma,nbins);
pause
end
%%