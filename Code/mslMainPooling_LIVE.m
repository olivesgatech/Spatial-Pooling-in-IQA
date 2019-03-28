  function  mslMainPooling_LIVE(poolInd, metInd, paramIndArray, blockSize)

%% 
poolingCounter=size(paramIndArray,2);

nDist=5;
nMetric=poolingCounter;
numCorr=3;
corrMat=zeros(numCorr,nMetric,nDist);
rmseMat=zeros(nMetric,nDist);
corrMatOrg=zeros(numCorr,nMetric,nDist);
corrType='Pearson';
corrType2='Spearman';
corrType3='Kendall';


for ii=1:poolingCounter
paramInd=paramIndArray(ii);
    
%%
%Directory Configuration
dataDir=[cd,filesep,'databaserelease2'];
load([dataDir,filesep,'dmos.mat']);
load([dataDir,filesep,'refnames_all.mat']);
%Image directories
data=[filesep,'databaserelease2',filesep];
imgDirRef=[cd,data,'refimgs',filesep];
imgDirFastfading=[cd,data,'fastfading',filesep];
imgDirGblur=[cd,data,'gblur',filesep];
imgDirJp2k=[cd,data,'jp2k',filesep];
imgDirJpeg=[cd,data,'jpeg',filesep];
imgDirWn=[cd,data,'wn',filesep];
refFiles=dir([imgDirRef,'*.bmp']);


  
len=length(refFiles);
img(len)=NImgV2;
%%
for i=1:len  
    i
img(i).Img=imread(strcat(imgDirRef,refFiles(i).name));
img(i).ImgYcbcr=rgb2ycbcr(img(i).Img);
temp=uint8(zeros(size(img(i).Img)));
temp2=temp;
temp3=temp;
%% Fastfading
%Fastfading
z=1;
offset=808;  
fid=fopen([imgDirFastfading,'info.txt']);
[list, ~]=textscan(fid,'%s');
    jLen=length(list{1,1});
    k=1;
    for j=1:jLen 
        if (strcmp(list{1,1}{j,1},refFiles(i).name))
            img(i).ImgFastfading(:,:,:,k)=imread([imgDirFastfading,list{1,1}{j+1,1}]);            
            img(i).ParamFastfading(k)=str2double(list{1,1}{j+2,1});
            tt=list{1,1}{j+1,1};
            img(i).Dmos(z,k)=dmos(str2double(tt(4:end-4))+offset);
            img(i).DmosFlag(z,k)=orgs(str2double(tt(4:end-4))+offset);                     
            img(i).ColDistFastfading(k)=mslPoolingMetric(img(i).Img,uint8(img(i).ImgFastfading(:,:,:,k)),metInd,poolInd,paramInd, blockSize);          
            k=k+1;
        end        
    end
 fclose(fid);
 %% Gblur
z=2;
offset=634;    
fid=fopen([imgDirGblur,'info.txt']);
[list, ~]=textscan(fid,'%s');
jLen=length(list{1,1});
k=1;
    for j=1:jLen 
        if (strcmp(list{1,1}{j,1}(2:end),refFiles(i).name))
           img(i).ImgGblur(:,:,:,k)=imread([imgDirGblur,list{1,1}{j+1,1}]);
           img(i).ParamGblur(k)=str2double(list{1,1}{j+2,1});            
           tt=list{1,1}{j+1,1};
           img(i).Dmos(z,k)=dmos(str2double(tt(4:end-4))+offset);
           img(i).DmosFlag(z,k)=orgs(str2double(tt(4:end-4))+offset);                    
           img(i).ColDistGblur(k)=mslPoolingMetric(img(i).Img,uint8(img(i).ImgGblur(:,:,:,k)),metInd,poolInd,paramInd, blockSize);      
           k=k+1;
        end        
    end
fclose(fid); 
%% JP2K
z=3;
offset=0;    
fid=fopen([imgDirJp2k,'info.txt']);
[list, ~]=textscan(fid,'%s');
jLen=length(list{1,1});
k=1;
    for j=1:jLen 
        if (strcmp(list{1,1}{j,1},refFiles(i).name))
           img(i).ImgJp2k(:,:,:,k)=imread([imgDirJp2k,list{1,1}{j+1,1}]);
           img(i).ParamJp2k(k)=str2double(list{1,1}{j+2,1});
           tt=list{1,1}{j+1,1};
           img(i).Dmos(z,k)=dmos(str2double(tt(4:end-4))+offset);
           img(i).DmosFlag(z,k)=orgs(str2double(tt(4:end-4))+offset);
           img(i).ColDistJp2k(k)=mslPoolingMetric(img(i).Img,uint8(img(i).ImgJp2k(:,:,:,k)),metInd,poolInd,paramInd, blockSize);        
           k=k+1;
        end        
    end
fclose(fid);
%% JPEG
z=4;
offset=227;    
fid=fopen([imgDirJpeg,'info.txt']);
[list, ~]=textscan(fid,'%s');
jLen=length(list{1,1});
k=1;
    for j=1:jLen 
        if (strcmp(list{1,1}{j,1},refFiles(i).name))
           img(i).ImgJpeg(:,:,:,k)=imread([imgDirJpeg,list{1,1}{j+1,1}]);
           img(i).ParamJpeg(k)=str2double(list{1,1}{j+2,1}); 
           tt=list{1,1}{j+1,1};
           img(i).Dmos(z,k)=dmos(str2double(tt(4:end-4))+offset);
           img(i).DmosFlag(z,k)=orgs(str2double(tt(4:end-4))+offset);     
           img(i).ColDistJpeg(k)=mslPoolingMetric(img(i).Img,uint8(img(i).ImgJpeg(:,:,:,k)),metInd,poolInd,paramInd, blockSize);      
           k=k+1;
        end        
    end
 fclose(fid);
%% WN
z=5;
offset=460;
fid=fopen([imgDirWn,'info.txt']);
[list, ~]=textscan(fid,'%s');
jLen=length(list{1,1});
k=1;
    for j=1:jLen 
        if (strcmp(list{1,1}{j,1}(2:end),refFiles(i).name))
           img(i).ImgWn(:,:,:,k)=imread([imgDirWn,list{1,1}{j+1,1}]);
           img(i).ParamWn(k)=str2double(list{1,1}{j+2,1});
           tt=list{1,1}{j+1,1};
           img(i).Dmos(z,k)=dmos(str2double(tt(4:end-4))+offset);
           img(i).DmosFlag(z,k)=orgs(str2double(tt(4:end-4))+offset);                    
           img(i).ColDistWn(k)=mslPoolingMetric(img(i).Img,uint8(img(i).ImgWn(:,:,:,k)),metInd,poolInd,paramInd, blockSize);
           k=k+1;
        end        
    end
 fclose(fid);

 
end
%%
s1=0;
s2=0;
if (s1==0)
   difVal=0; mult=1;
elseif (s1==1)
   difVal=1; mult=-1;          
end
len=size(img,2);
n=1;
%% JPEG
for i=1:len          
lenJpeg=size(img(i).ParamJpeg,2);
[~, paramOrder]=sort(img(i).ParamJpeg);
dmosInd=4;
    for j=1:lenJpeg 
        tempJpegDmos{i}(j)=img(i).Dmos(dmosInd,paramOrder(j));
        JpegDmosFlag{i}(j)=img(i).DmosFlag(dmosInd,paramOrder(j));
        tempJpegColDist{i}(j,n)=img(i). ColDistJpeg(paramOrder(j));
    end      
       tempJpegColDist{i}(:,n)=difVal+mult*tempJpegColDist{i}(:,n);        
end
JpegColDistFull=zeros(1,1);
n=1;
for p=1:len
JpegColDistFull=horzcat(JpegColDistFull,tempJpegColDist{p}(:,n)');
end
if (s2==1)
   JpegColDistFull=JpegColDistFull/max(JpegColDistFull);           
end
JpegColDistFull=JpegColDistFull(2:end);
%% JP2K
for i=1:len        
lenJp2k=size(img(i).ParamJp2k,2);
[~, paramOrder]=sort(img(i).ParamJp2k);
dmosInd=3;
for j=1:lenJp2k 
    tempJp2kDmos{i}(j)=img(i).Dmos(dmosInd,paramOrder(j));
    Jp2kDmosFlag{i}(j)=img(i).DmosFlag(dmosInd,paramOrder(j));
    tempJp2kColDist{i}(j,n)=img(i). ColDistJp2k(paramOrder(j));
end      
tempJp2kColDist{i}(:,n)=difVal+mult*tempJp2kColDist{i}(:,n);        
end
Jp2kColDistFull=zeros(1,1);
for p=1:len
    Jp2kColDistFull=horzcat(Jp2kColDistFull,tempJp2kColDist{p}(:,n)');
end
if (s2==1)
    Jp2kColDistFull=Jp2kColDistFull/max(Jp2kColDistFull);
end
Jp2kColDistFull=Jp2kColDistFull(2:end);
%% WN
for i=1:len   
lenWn=size(img(i).ParamWn,2);
[~, paramOrder]=sort(img(i).ParamWn);
dmosInd=5;
for j=1:lenWn 
    tempWnDmos{i}(j)=img(i).Dmos(dmosInd,paramOrder(j));
    WnDmosFlag{i}(j)=img(i).DmosFlag(dmosInd,paramOrder(j));  
    tempWnColDist{i}(j,n)=img(i). ColDistWn(paramOrder(j));       
end 
    tempWnColDist{i}(:,n)=difVal+mult*tempWnColDist{i}(:,n);        
end
WnColDistFull=zeros(1,1);
for p=1:len
    WnColDistFull=horzcat(WnColDistFull,tempWnColDist{p}(:,n)');
end
if (s2==1)
   WnColDistFull=WnColDistFull/max(WnColDistFull);
end
WnColDistFull=WnColDistFull(2:end);
%% Fastfading
for i=1:len       
lenFastfading=size(img(i).ParamFastfading,2);
[~, paramOrder]=sort(img(i).ParamFastfading);
dmosInd=1;
for j=1:lenFastfading 
    tempFastfadingDmos{i}(j)=img(i).Dmos(dmosInd,paramOrder(j));
    FastfadingDmosFlag{i}(j)=img(i).DmosFlag(dmosInd,paramOrder(j));   
    tempFastfadingColDist{i}(j,n)=img(i). ColDistFastfading(paramOrder(j));        
end          
tempFastfadingColDist{i}(:,n)=difVal+mult*tempFastfadingColDist{i}(:,n);       
end
FastfadingColDistFull=zeros(1,1);
for p=1:len
    FastfadingColDistFull=horzcat(FastfadingColDistFull,tempFastfadingColDist{p}(:,n)');
end
if (s2==1)
   FastfadingColDistFull=FastfadingColDistFull/max(FastfadingColDistFull);
end
FastfadingColDistFull=FastfadingColDistFull(2:end);
%% GBlur
for i=1:len         
lenGblur=size(img(i).ParamGblur,2);
[~, paramOrder]=sort(img(i).ParamGblur);
dmosInd=2;
for j=1:lenGblur 
    tempGblurDmos{i}(j)=img(i).Dmos(dmosInd,paramOrder(j));
    GblurDmosFlag{i}(j)=img(i).DmosFlag(dmosInd,paramOrder(j));
    tempGblurColDist{i}(j,n)=img(i). ColDistGblur(paramOrder(j));
end            
tempGblurColDist{i}(:,n)=difVal+mult*tempGblurColDist{i}(:,n);        
end
GblurColDistFull=zeros(1,1);
for p=1:len
GblurColDistFull=horzcat(GblurColDistFull,tempGblurColDist{p}(:,n)');
end
if (s2==1)
    GblurColDistFull=GblurColDistFull/max(GblurColDistFull);
end
GblurColDistFull=GblurColDistFull(2:end);
%%
JpegDmos=zeros(1,1);
Jp2kDmos=zeros(1,1);
WnDmos=zeros(1,1);
GblurDmos=zeros(1,1);
FastfadingDmos=zeros(1,1);
%%%% DMOS %%%%
for p=1:len
JpegDmos=vertcat(JpegDmos,tempJpegDmos{p}(:));
Jp2kDmos=vertcat(Jp2kDmos,tempJp2kDmos{p}(:));
WnDmos=vertcat(WnDmos,tempWnDmos{p}(:));
GblurDmos=vertcat(GblurDmos,tempGblurDmos{p}(:));
FastfadingDmos=vertcat(FastfadingDmos,tempFastfadingDmos{p}(:));
end
JpegDmos=JpegDmos(2:end)';
Jp2kDmos=Jp2kDmos(2:end)';
WnDmos=WnDmos(2:end)';
GblurDmos=GblurDmos(2:end)';
FastfadingDmos=FastfadingDmos(2:end)';

%DMOS
DmosScore=horzcat(FastfadingDmos,GblurDmos,Jp2kDmos,JpegDmos,WnDmos);



%       %ColDist
 ColDistFull=horzcat(FastfadingColDistFull,GblurColDistFull,Jp2kColDistFull,JpegColDistFull,WnColDistFull);

%  
%%




rInd=ii;
%% Additional


%%

%% ALL
cInd=6;
y=DmosScore';
len=size(y,1);
linX=1:len; linX=(linX/max(linX))*100;
linY=linX;
modelFun=@(b,x) b(1).*((1/2)-1./(1+exp(b(2).*(x-b(3)))))+b(4).*x+b(5);

%ColDist



x=ColDistFull';
x(isnan(x))=0;
x(isinf(x))=0;

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





%% JPEG
cInd=2;
y=JpegDmos';
%ColDist
x=JpegColDistFull';
x(isnan(x))=0;
x(isinf(x))=0;

temp=predict(nlmColDist,x);
corrMat(1,rInd,cInd)=corr(temp,y,'Type',corrType);
corrMat(2,rInd,cInd)=corr(temp,y,'Type',corrType2);
corrMat(3,rInd,cInd)=corr(temp,y,'Type',corrType3);
rmseMat(rInd,cInd)=sqrt(mean((temp-y).^2));
corrMatOrg(1,rInd,cInd)=corr(x,y,'Type',corrType);
corrMatOrg(2,rInd,cInd)=corr(x,y,'Type',corrType2);
corrMatOrg(3,rInd,cInd)=corr(x,y,'Type',corrType3);

%% JP2K
cInd=1;
y=Jp2kDmos';
x=Jp2kColDistFull';
x(isnan(x))=0;
x(isinf(x))=0;



temp=predict(nlmColDist,x);
corrMat(1,rInd,cInd)=corr(temp,y,'Type',corrType);
corrMat(2,rInd,cInd)=corr(temp,y,'Type',corrType2);
corrMat(3,rInd,cInd)=corr(temp,y,'Type',corrType3);
rmseMat(rInd,cInd)=sqrt(mean((temp-y).^2));
corrMatOrg(1,rInd,cInd)=corr(x,y,'Type',corrType);
corrMatOrg(2,rInd,cInd)=corr(x,y,'Type',corrType2);
corrMatOrg(3,rInd,cInd)=corr(x,y,'Type',corrType3);
%% Wn
cInd=3;
y=WnDmos';
%ColDist
x=WnColDistFull';
x(isnan(x))=0;
x(isinf(x))=0;



temp=predict(nlmColDist,x);
corrMat(1,rInd,cInd)=corr(temp,y,'Type',corrType);
corrMat(2,rInd,cInd)=corr(temp,y,'Type',corrType2);
corrMat(3,rInd,cInd)=corr(temp,y,'Type',corrType3);
rmseMat(rInd,cInd)=sqrt(mean((temp-y).^2));
corrMatOrg(1,rInd,cInd)=corr(x,y,'Type',corrType);
corrMatOrg(2,rInd,cInd)=corr(x,y,'Type',corrType2);
corrMatOrg(3,rInd,cInd)=corr(x,y,'Type',corrType3);
%% Gblur
cInd=4;
y=GblurDmos';
%ColDist
x=GblurColDistFull';
x(isnan(x))=0;
x(isinf(x))=0;




temp=predict(nlmColDist,x);
corrMat(1,rInd,cInd)=corr(temp,y,'Type',corrType);
corrMat(2,rInd,cInd)=corr(temp,y,'Type',corrType2);
corrMat(3,rInd,cInd)=corr(temp,y,'Type',corrType3);
rmseMat(rInd,cInd)=sqrt(mean((temp-y).^2));
corrMatOrg(1,rInd,cInd)=corr(x,y,'Type',corrType);
corrMatOrg(2,rInd,cInd)=corr(x,y,'Type',corrType2);
corrMatOrg(3,rInd,cInd)=corr(x,y,'Type',corrType3);
%% Fastfading
cInd=5;
y=FastfadingDmos';
%ColDist
x=FastfadingColDistFull';
x(isnan(x))=0;
x(isinf(x))=0;



temp=predict(nlmColDist,x);
corrMat(1,rInd,cInd)=corr(temp,y,'Type',corrType);
corrMat(2,rInd,cInd)=corr(temp,y,'Type',corrType2);
corrMat(3,rInd,cInd)=corr(temp,y,'Type',corrType3);
rmseMat(rInd,cInd)=sqrt(mean((temp-y).^2));
corrMatOrg(1,rInd,cInd)=corr(x,y,'Type',corrType);
corrMatOrg(2,rInd,cInd)=corr(x,y,'Type',corrType2);
corrMatOrg(3,rInd,cInd)=corr(x,y,'Type',corrType3);

%%
metricRes=ColDistFull';
% figure
metricRes(isnan(metricRes))=0;
metricRes(isinf(metricRes))=0;
fileName=['metric_','metInd_',num2str(metInd),'_','poolInd_',num2str(poolInd),'_paramInd_',num2str(paramIndArray(ii)),'_blockSize',num2str(blockSize),'.mat'];
save(fileName,'metricRes')
end


fileName=['corrAfter_','metInd_',num2str(metInd),'_','poolInd_',num2str(poolInd),'_paramInds_',num2str(paramIndArray),'_blockSize',num2str(blockSize),'.mat'];
save(fileName,'corrMat')
fileName=['corrBefore_','metInd_',num2str(metInd),'_','poolInd_',num2str(poolInd),'_paramInds_',num2str(paramIndArray),'_blockSize',num2str(blockSize),'.mat'];
save(fileName,'corrMatOrg')
fileName=['rmse_','metInd_',num2str(metInd),'_','poolInd_',num2str(poolInd),'_paramInds_',num2str(paramIndArray),'_blockSize',num2str(blockSize),'.mat'];
save(fileName,'rmseMat')

