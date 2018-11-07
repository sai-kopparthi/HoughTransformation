%%
function [error] = compute_quantization_error(originalImg,quantizedImg)
I1 = originalImg;
I2 = quantizedImg;
x = (I1-I2);
error = sum(x(:).^2);
end
%%