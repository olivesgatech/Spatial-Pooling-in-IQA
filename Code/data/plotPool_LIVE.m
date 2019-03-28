clear all
close all
clc
%% Live
indCorr=1;
yLabelName='Correlation';
saveFileName='pearson-live';
scSize=300;
scType='pdf';
fontSize=30;
fontSize2=30;
markerSize=250;
fileDir=[cd,filesep,'live',filesep,'corrAfter_metInd_';]





files = dir([fileDir,'2*']);
for ii = 1:numel(files)
    load([cd,filesep,'live',filesep,files(ii).name]);
    files(ii).name
    [~,~,s3]=size(corrMat);
    for jj=1:s3                          
        temp=squeeze(corrMat(indCorr,:,jj));
        corrMaxTemp(ii,jj)=max(temp);    
    end

end

iwMat=corrMaxTemp(1:5,:);
iwMat(6,:)=corrMaxTemp(11,:);

[~,s3]=size(iwMat);
    for jj=1:s3                          
        temp=squeeze(iwMat(:,jj));
        iwMax(jj)=max(temp);    
    end
    
corrMax(1,:)=iwMax;    
corrMax(2:6,:)=corrMaxTemp(6:10,:);
corrMax(7:8,:)=corrMaxTemp(12:13,:);


corrMin=min(min(corrMax));

markerShape=['ro','r+','r*','rs','rd','rh','r<','r>'];

figure;
for ii=1:numel(files)-5
a=[1,2,3,4,5,6];
b=corrMax(ii,:);
 scatter(a,b,markerSize,markerShape((ii-1)*2+1:(ii-1)*2+2))
hold on
end

%%
files = dir([fileDir,'1*']);
for ii = 1:numel(files)
    load([cd,filesep,'live',filesep,files(ii).name]);
    files(ii).name
    [~,~,s3]=size(corrMat);
    for jj=1:s3                          
        temp=squeeze(corrMat(indCorr,:,jj));
        corrMaxTemp(ii,jj)=max(temp);    
    end

end

iwMat=corrMaxTemp(1:5,:);
iwMat(6,:)=corrMaxTemp(11,:);

[~,s3]=size(iwMat);
    for jj=1:s3                          
        temp=squeeze(iwMat(:,jj));
        iwMax(jj)=max(temp);    
    end
    
corrMax(1,:)=iwMax;    
corrMax(2:6,:)=corrMaxTemp(6:10,:);
corrMax(7:8,:)=corrMaxTemp(12:13,:);

if (min(min(corrMax))<corrMin)
corrMin=min(min(corrMax));
end

markerShape=['go','g*','g+','gs','gh','gd','g<','g>'];
for ii=1:numel(files)-5
a=[1,2,3,4,5,6];
b=corrMax(ii,:);
 scatter(a,b,markerSize,markerShape((ii-1)*2+1:(ii-1)*2+2))
hold on
end
%%
files = dir([fileDir,'3*']);
for ii = 1:numel(files)
    load([cd,filesep,'live',filesep,files(ii).name]);
    files(ii).name
    [~,~,s3]=size(corrMat);
    for jj=1:s3                          
        temp=squeeze(corrMat(indCorr,:,jj));
        corrMaxTemp(ii,jj)=max(temp);    
    end

end

iwMat=corrMaxTemp(1:5,:);
iwMat(6,:)=corrMaxTemp(11,:);

[s2,s3]=size(iwMat);
    for jj=1:s3                          
        temp=squeeze(iwMat(:,jj));
        iwMax(jj)=max(temp);    
    end
    
corrMax(1,:)=iwMax;    
corrMax(2:6,:)=corrMaxTemp(6:10,:);
corrMax(7:8,:)=corrMaxTemp(12:13,:);

if (min(min(corrMax))<corrMin)
corrMin=min(min(corrMax));
end

markerShape=['bo','b*','b+','bs','bh','bd','b<','b>'];
for ii=1:numel(files)-5
a=[1,2,3,4,5,6];
b=corrMax(ii,:);
 scatter(a,b,markerSize,markerShape((ii-1)*2+1:(ii-1)*2+2))
hold on
end




xlim([0,6])
ylim([corrMin,1])
legend('IW', '5-Number', 'Max/Min', 'WPP', 'Mean', 'Percentile', 'Minkowski','Qual/Dist')
set(gca,'XTickLabel',['    ';'Jp2k';'Jpeg';'Wn  ';'Gb  ';'FF  ';'All '] );
set(gca,'fontsize',fontSize2','fontweight','bold');
xlabel('Distortion Types','fontsize',fontSize,'fontweight','bold'); ylabel(yLabelName,'fontsize',fontSize,'fontweight','bold');
saveas(gcf,saveFileName,scType)
