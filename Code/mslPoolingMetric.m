  function [outCT] =mslPoolingMetric(img1, img2,metInd,poolInd,paramInd,blockSize)
  [s1,s2,~]=size(img1);   
  c1=0.1;
  switch metInd
    case 1        
        [~, metricMap]=ssim(double(rgb2gray(img1)),double(rgb2gray(img2)));
    case 2
        [~, metricMap]=mse(double(rgb2gray(img1))/255,double(rgb2gray(img2))/255);
    case 3
        [~, metricMap]=mslMETRIC(img1,img2);
  end
  

h1=fspecial('gaussian',[3 3],1.5);
funSTD2Gauss=@(block_struct) std2(block_struct.*h1);
funSTD2=@(block_struct) std2(block_struct);
  

  
  switch poolInd
      case 2
          outCT=mean2(metricMap);          
      case 5
        outCT=mean2(abs(metricMap.^paramInd));   
      case 9
        outCT=mean2(abs(metricMap.^(paramInd+1)))/mean2(abs(metricMap.^(paramInd))); 
      case 14          
        metricMap=imresize(metricMap,[s1 s2]);          
        imgSTD=nlfilter(double(rgb2gray(img1)),blockSize,funSTD2);
        distSTD=nlfilter(double(rgb2gray(img2)),blockSize,funSTD2);
        weightIMG=log10((1+imgSTD.^2/c1).*(1+distSTD.^2/c1));
        outCT=sum(sum((metricMap.*weightIMG)))/sum(sum(weightIMG));   
      case 15
        metricMap=imresize(metricMap,[s1 s2]);          
        imgSTD=nlfilter(double(rgb2gray(img1)),blockSize,funSTD2);
        weightIMG=log10((1+imgSTD.^2/c1));
        outCT=sum(sum((metricMap.*weightIMG)))/sum(sum(weightIMG));
      case 16
        metricMap=imresize(metricMap,[s1 s2]);          
        distSTD=nlfilter(double(rgb2gray(img2)),blockSize,funSTD2);
        weightIMG=log10((1+distSTD.^2/c1));
        outCT=sum(sum((metricMap.*weightIMG)))/sum(sum(weightIMG));  
      case 17          
        metricMap=imresize(metricMap,[s1 s2]);          
        imgSTD=nlfilter(double(rgb2gray(img1)),blockSize,funSTD2Gauss);
        weightIMG=log10((1+imgSTD.^2/c1));
        outCT=sum(sum((metricMap.*weightIMG)))/sum(sum(weightIMG));        
      case 18              
        metricMap=imresize(metricMap,[s1 s2]);          
        imgSTD=nlfilter(double(rgb2gray(img1)),blockSize,funSTD2Gauss);
        distSTD=nlfilter(double(rgb2gray(img2)),blockSize,funSTD2Gauss);
        weightIMG=log10((1+imgSTD.^2/c1).*(1+distSTD.^2/c1));
        outCT=sum(sum((metricMap.*weightIMG)))/sum(sum(weightIMG));        
      case 19
        outCT=min(min(metricMap));
      case 23
        p1=median(median(metricMap));
        p2=min(min(metricMap));
        p3=max(max(metricMap));
        p4=prctile(reshape(metricMap,[numel(metricMap) 1]),25);
        p5=prctile(reshape(metricMap,[numel(metricMap) 1]),75);
        outCT=(p1+p2+p3+p4+p5)/5; 
      case 24
        nBin=paramInd;
        for ii=1:floor(100/nBin):100
            prcW=abs((1-ii/100));
            term1=prctile(reshape(metricMap,[numel(metricMap) 1]),ii)*prcW;   
            term2=prcW;
            prcVec(ii)=term1;
            prcVec2(ii)=term2;
        end
        outCT=mean(prcVec)/mean(prcVec2);
      case 27
        outCT=max(max(metricMap));
      case 28
        nBin=paramInd;
        for ii=100:-floor(100/nBin):1
            prcW=(ii/100);
            term1=prctile(reshape(metricMap,[numel(metricMap) 1]),ii)*prcW;   
            term2=prcW;
            prcVec(ii)=term1;
            prcVec2(ii)=term2;
        end
        outCT=mean(prcVec)/mean(prcVec2);      
      case 29
        perLim=prctile(reshape(metricMap,[numel(metricMap) 1]),6);
        perMask=(metricMap<perLim);
        metricMap=(metricMap.*perMask)/4000+metricMap.*(1-perMask);
        outCT=mean2(metricMap);
      case 30
        perLim=prctile(reshape(metricMap,[numel(metricMap) 1]),94);
        perMask=(metricMap<perLim);
        metricMap=(metricMap.*perMask)+(metricMap.*(1-perMask))*4000;
        outCT=mean2(metricMap);
      case 31
        metricMap=imresize(metricMap,[s1 s2]);          
        distSTD=nlfilter(double(rgb2gray(img2)),blockSize,funSTD2Gauss);
        weightIMG=log10((1+distSTD.^2/c1));
        outCT=sum(sum((metricMap.*weightIMG)))/sum(sum(weightIMG));  
      otherwise      
  end
  
  
  