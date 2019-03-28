  function  mslMainPooling_Multi(poolInd, metInd, paramIndArray, blockSize)

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


dataDir=[cd,filesep,'live_multi'];



for kk=1:poolingCounter
paramInd=paramIndArray(kk);

imgDir=[dataDir,filesep,'Part 1'];
load([imgDir,filesep,'Imagelists.mat']);
load([imgDir,filesep,'Scores.mat']);
n=size(distimgs,1);

counter=0;

for ii=1:n
%     ii
counter=counter+1;    
I=imread([imgDir,filesep,'blurjpeg',filesep,distimgs{ii}]);
I2=imread([imgDir,filesep,'blurjpeg',filesep,refimgs{ref4dist(ii)}]);
gt(counter)=DMOSscores(ii);
b(counter)=mslPoolingMetric(I, I2,metInd,poolInd,paramInd,blockSize);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y=gt(1:225)';
len=size(y,1);
linX=1:len; linX=(linX/max(linX))*max(y);
linY=linX;
modelFun=@(b,x) b(1).*((1/2)-1./(1+exp(b(2).*(x-b(3)))))+b(4).*x+b(5);
x=abs(b');
x=x(1:225);
x(isnan(x))=0;
x(isinf(x))=0;
temp=x;
cInd=1;
rInd=kk;
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


imgDir=[dataDir,filesep,'Part 2'];
load([imgDir,filesep,'Imagelists.mat']);
load([imgDir,filesep,'Scores.mat']);
n=size(distimgs,1);


for jj=1:n
%     jj
counter=counter+1;    
I=imread([imgDir,filesep,'blurnoise',filesep,distimgs{jj}]);
I2=imread([imgDir,filesep,'blurnoise',filesep,refimgs{ref4dist(jj)}]);
gt(counter)=DMOSscores(jj);
b(counter)=mslPoolingMetric(I, I2,metInd,poolInd,paramInd,blockSize);

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y=gt(226:450)';
len=size(y,1);
linX=1:len; linX=(linX/max(linX))*max(y);
linY=linX;
modelFun=@(b,x) b(1).*((1/2)-1./(1+exp(b(2).*(x-b(3)))))+b(4).*x+b(5);
x=abs(b');
x=x(226:450);
x(isnan(x))=0;
x(isinf(x))=0;
temp=x;
cInd=2;
rInd=kk;
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


y=gt';
len=size(y,1);
linX=1:len; linX=(linX/max(linX))*max(y);
linY=linX;
modelFun=@(b,x) b(1).*((1/2)-1./(1+exp(b(2).*(x-b(3)))))+b(4).*x+b(5);
x=abs(b');
x(isnan(x))=0;
x(isinf(x))=0;
temp=x;


    fileName2=['Multi_metric_','_paramInd_',num2str(paramIndArray(kk)),'_metInd_',num2str(metInd),'_','poolInd_',num2str(poolInd),'_blockSize',num2str(blockSize),'.txt'];
    save(fileName2, 'temp', '-ASCII');
    fileName=['Multi_metric_','_paramInd_',num2str(paramIndArray(kk)),'_metInd_',num2str(metInd),'_','poolInd_',num2str(poolInd),'_blockSize',num2str(blockSize),'.mat'];
    save(fileName,'temp')
    fileName=['Multi_GT','.mat'];
    save(fileName,'y')

cInd=3;
rInd=kk;
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


    
end

fileName=['Multi_corrAfter_','metInd_',num2str(metInd),'_','poolInd_',num2str(poolInd),'_paramInds_',num2str(paramIndArray),'_blockSize',num2str(blockSize),'.mat'];
save(fileName,'corrMat')
fileName=['Multi_corrBefore_','metInd_',num2str(metInd),'_','poolInd_',num2str(poolInd),'_paramInds_',num2str(paramIndArray),'_blockSize',num2str(blockSize),'.mat'];
save(fileName,'corrMatOrg')
fileName=['Multi_rmse_','metInd_',num2str(metInd),'_','poolInd_',num2str(poolInd),'_paramInds_',num2str(paramIndArray),'_blockSize',num2str(blockSize),'.mat'];
save(fileName,'rmseMat')  
end


  
  


  
  
  
  