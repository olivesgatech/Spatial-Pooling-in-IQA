  function  mslMainPooling_TID(poolInd, metInd, paramIndArray, blockSize)

%%
poolingCounter=size(paramIndArray,2);

nDist=2;
nMetric=poolingCounter;
numCorr=3;
corrMat=zeros(numCorr,nMetric,nDist);
rmseMat=zeros(nMetric,nDist);
corrMatOrg=zeros(numCorr,nMetric,nDist);
corrType='Pearson';
corrType2='Spearman';
corrType3='Kendall';

mos=textread([cd,filesep,'tid2013',filesep,'mos.txt']);
N_DISORTIONS = 24;


for ii=1:poolingCounter
paramInd=paramIndArray(ii);
counter = 0;
for iN = 1:25 %ref. image counter
    
    if iN<10
        imageNum = strcat('0', num2str(iN))
    else
        imageNum = num2str(iN)
    end
    %read reference image and normalize intensity 
   
    im2 = imread(strcat( [cd,filesep,'tid2013',filesep,'reference_images',filesep,'i'],imageNum,'.bmp'));



    
    
    for dN = 1:N_DISORTIONS %distortion type counter
        for dL = 1:5 %distortion level counter
            
            counter = counter + 1;

            if dN<10
                distNum = strcat('0', num2str(dN));
            else
                distNum = num2str(dN);
            end
            
            distLevel = num2str(dL);
             
            %read distorted image and normalize intensity 
            
            im1 = imread(strcat([cd,filesep,'tid2013',filesep,'distorted_images',filesep,'i'],imageNum, '_', distNum, '_', distLevel,'.bmp'));

           
             [iqa(counter)]=mslPoolingMetric(im1,im2,metInd,poolInd,paramInd, blockSize); 
             
             
            groundTruth(counter) = mos( (iN-1)*(5*24) + (dN-1)*5 + dL ); % read corresponding MOS value

        end
    end
end

x=abs(iqa');
x(isnan(x))=0;
x(isinf(x))=0;

temp=x;
% save MS-Coherensi values
if N_DISORTIONS==24
    fileName2=['TID_metric_','_paramInd_',num2str(paramIndArray(ii)),'_metInd_',num2str(metInd),'_','poolInd_',num2str(poolInd),'_blockSize',num2str(blockSize),'.txt'];
    save(fileName2, 'temp', '-ASCII');
    fileName=['TID_metric_','_paramInd_',num2str(paramIndArray(ii)),'_metInd_',num2str(metInd),'_','poolInd_',num2str(poolInd),'_blockSize',num2str(blockSize),'.mat'];
    save(fileName,'temp')
    fileName=['TID_GT.mat'];
    save(fileName,'groundTruth')

end

y=groundTruth';

len=size(y,1);
linX=1:len; linX=(linX/max(linX))*max(y);
linY=linX;
modelFun=@(b,x) b(1).*((1/2)-1./(1+exp(b(2).*(x-b(3)))))+b(4).*x+b(5);
cInd=25;
rInd=ii;

start=[0.0,0.1,0.0,0.0,0.0]';
nlmColDist=fitnlm(x,y,modelFun,start);
temp=predict(nlmColDist,x);
corrMat(1,rInd,cInd)=corr(temp,y,'Type',corrType);
corrMat(2,rInd,cInd)=corr(temp,y,'Type',corrType2);
corrMat(3,rInd,cInd)=corr(temp,y,'Type',corrType3);
rmseMat(rInd,cInd)=sqrt(mean((temp-y).^2));
corrMatOrg(1,rInd,cInd)=corr(x,y,'Type',corrType);
corrMatOrg(2,rInd,cInd)=corr(x,y,'Type',corrType2);
corrMatOrg(3,rInd,cInd)=corr(x,y,'Type',corrType3);
%%
for dN=1:N_DISORTIONS %correlation by distortion type
    counter = 0;
    for iN = 1:25
        for dL = 1:5
            counter = counter + 1;
            groundTruthPerDist(counter) = mos( (iN-1)*(5*24) + (dN-1)*5 + dL ); %prepare MOS for the given distortion type dN
            iqaPerDist(counter) = iqa( (iN-1)*(5*N_DISORTIONS) + (dN-1)*5 + dL );%prepare MS-Coherensi values for the given distortion type dN
        end
    end
    
x=iqaPerDist';
x(isnan(x))=0;
x(isinf(x))=0;

y=groundTruthPerDist';
temp=predict(nlmColDist,x);
    
corrMat(1,rInd,dN)=corr(temp,y,'Type',corrType);
corrMat(2,rInd,dN)=corr(temp,y,'Type',corrType2);
corrMat(3,rInd,dN)=corr(temp,y,'Type',corrType3);
rmseMat(rInd,dN)=sqrt(mean((temp-y).^2));
corrMatOrg(1,rInd,dN)=corr(x,y,'Type',corrType);
corrMatOrg(2,rInd,dN)=corr(x,y,'Type',corrType2);
corrMatOrg(3,rInd,dN)=corr(x,y,'Type',corrType3);    
end
end

fileName=['TID_corrAfter_','metInd_',num2str(metInd),'_','poolInd_',num2str(poolInd),'_paramInds_',num2str(paramIndArray),'_blockSize',num2str(blockSize),'.mat'];
save(fileName,'corrMat')
fileName=['TID_corrBefore_','metInd_',num2str(metInd),'_','poolInd_',num2str(poolInd),'_paramInds_',num2str(paramIndArray),'_blockSize',num2str(blockSize),'.mat'];
save(fileName,'corrMatOrg')
fileName=['TID_rmse_','metInd_',num2str(metInd),'_','poolInd_',num2str(poolInd),'_paramInds_',num2str(paramIndArray),'_blockSize',num2str(blockSize),'.mat'];
save(fileName,'rmseMat')

  end