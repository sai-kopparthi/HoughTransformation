I = imread('fish.jpg');
[a,b]=quantize_RGB(I,5);
[c,d] = quantize_HSV(I,5);
err = compute_quantization_error(I,a)
erro = compute_quantization_error(I,c)
imshow(a)
save 'quantiseRGB.jpg' 
pause
imshow(c)
save 'quantizeHSV.jpg'
pause
[a,b] = get_hue_hists(I,5) 
 