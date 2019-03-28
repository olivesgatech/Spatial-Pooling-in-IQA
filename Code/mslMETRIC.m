  function [outCT, outCT_map ] =mslMETRIC(img1, img2)
  %%
img1R=img1;
img2R=img2;
nR=1;
[s1,s2,~]=size(img1);
filterType='log';
stdGauss= 10;
h = fspecial(filterType, [13 13], stdGauss);
T1=0.001;
outBound='symmetric';
colorTransform = makecform('srgb2lab');
temp = double(applycform(img1, colorTransform));
img1a=temp(:,:,2);
img1b=temp(:,:,3);
img1l=temp(:,:,1);
temp = double(applycform(img2, colorTransform));
img2a=temp(:,:,2);
img2b=temp(:,:,3);
img2l=temp(:,:,1);
aSIM=abs((2 * (img1a.^nR) .* (img2a.^nR) + T1)./((img1a.^nR).^2 + (img2a.^nR).^2 + T1));
bSIM=abs((2 * (img1b.^nR) .* (img2b.^nR) + T1)./((img1b.^nR).^2 + (img2b.^nR).^2 + T1));

img1DoG_L=imfilter(double(img1l),h,outBound);
img2DoG_L=imfilter(double(img2l),h,outBound);
lSIM=abs((2 * (img1DoG_L.^nR) .* (img2DoG_L.^nR) + T1)./((img1DoG_L.^nR).^2 + (img2DoG_L.^nR).^2 + T1));
%%
stdGauss= 8;
h = fspecial(filterType, [4, 4], stdGauss);
img1=imresize(img1R,0.6);  
img2=imresize(img2R,0.6);   
temp = double(applycform(img1, colorTransform));
img1a=temp(:,:,2);
img1b=temp(:,:,3);
img1l=temp(:,:,1);
temp = double(applycform(img2, colorTransform));
img2a=temp(:,:,2);
img2b=temp(:,:,3);
img2l=temp(:,:,1);
aSIM_0_6=abs((2 * (img1a.^nR) .* (img2a.^nR) + T1)./((img1a.^nR).^2 + (img2a.^nR).^2 + T1));
bSIM_0_6=abs((2 * (img1b.^nR) .* (img2b.^nR) + T1)./((img1b.^nR).^2 + (img2b.^nR).^2 + T1));
img1DoG_L=imfilter(double(img1l),h,outBound);
img2DoG_L=imfilter(double(img2l),h,outBound);
lSIM_0_6=abs((2 * (img1DoG_L.^nR) .* (img2DoG_L.^nR) + T1)./((img1DoG_L.^nR).^2 + (img2DoG_L.^nR).^2 + T1));
lSIM_0_6=abs(imresize(lSIM_0_6,[s1 s2]));  
aSIM_0_6=abs(imresize(aSIM_0_6,[s1 s2]));
bSIM_0_6=abs(imresize(bSIM_0_6,[s1 s2]));
%%
stdGauss= 7;
h = fspecial(filterType, [2, 2], stdGauss);
img1=imresize(img1R,0.4);  
img2=imresize(img2R,0.4);   
temp = double(applycform(img1, colorTransform));
img1a=temp(:,:,2);
img1b=temp(:,:,3);
img1l=temp(:,:,1);
temp = double(applycform(img2, colorTransform));
img2a=temp(:,:,2);
img2b=temp(:,:,3);
img2l=temp(:,:,1);
aSIM_0_4=abs((2 * (img1a.^nR) .* (img2a.^nR) + T1)./((img1a.^nR).^2 + (img2a.^nR).^2 + T1));
bSIM_0_4=abs((2 * (img1b.^nR) .* (img2b.^nR) + T1)./((img1b.^nR).^2 + (img2b.^nR).^2 + T1));
img1DoG_L=imfilter(double(img1l),h,outBound);
img2DoG_L=imfilter(double(img2l),h,outBound);
lSIM_0_4=abs((2 * (img1DoG_L.^nR) .* (img2DoG_L.^nR) + T1)./((img1DoG_L.^nR).^2 + (img2DoG_L.^nR).^2 + T1));
lSIM_0_4=abs(imresize(lSIM_0_4,[s1 s2]));  
aSIM_0_4=abs(imresize(aSIM_0_4,[s1 s2]));
bSIM_0_4=abs(imresize(bSIM_0_4,[s1 s2]));
%%
lSUM=nthroot(lSIM.*lSIM_0_6.*lSIM_0_4,3);
aSUM=nthroot(aSIM.*aSIM_0_6.*aSIM_0_4,3);
bSUM=nthroot(bSIM.*bSIM_0_6.*bSIM_0_4,3);

outCT=mean2(min(lSUM.^4,min(aSUM.^2,bSUM.^2)))^25;
outCT_map=(min(lSUM.^4,min(aSUM.^2,bSUM.^2))).^25;

  end