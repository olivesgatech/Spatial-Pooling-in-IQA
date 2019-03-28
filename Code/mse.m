function [mseVal, mseMap] = mse(img1, img2)
imgRes=img1-img2;
mseMap=(imgRes).^2;
mseVal=mean2(mseMap);
end