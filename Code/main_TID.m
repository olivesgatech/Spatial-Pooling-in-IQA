blockSize=[50 50];
paramIndArray=[1];
metInd=1;
%% TID-SSIM-Mean Pooling
poolInd=2;
mslMainPooling_TID(poolInd, metInd, paramIndArray, blockSize)
%% TID-SSIM-Minkowski
poolInd=5;
paramIndArray=[1/8 1/4 1/2 2 4 8];
mslMainPooling_TID(poolInd, metInd, paramIndArray, blockSize)
%% TID-SSIM-Minkowski
poolInd=9;
paramIndArray=[1/8 1/4 1/2 2 4 8];
mslMainPooling_TID(poolInd, metInd, paramIndArray, blockSize)
%% TID-SSIM-Min
poolInd=19;
paramIndArray=[1];
mslMainPooling_TID(poolInd, metInd, paramIndArray, blockSize)
%% TID-SSIM-5-point
poolInd=23;
mslMainPooling_TID(poolInd, metInd, paramIndArray, blockSize)
%% TID-SSIM-WPP
paramIndArray=[1, 10, 20];
poolInd=24;
mslMainPooling_TID(poolInd, metInd, paramIndArray, blockSize)
%% TID-SSIM-IW(B)
paramIndArray=[1];
poolInd=14;
blockSize=[3 3];
mslMainPooling_TID(poolInd, metInd, paramIndArray, blockSize)
%% TID-SSIM-IW(R)
poolInd=15;
blockSize=[3 3];
mslMainPooling_TID(poolInd, metInd, paramIndArray, blockSize)
%% TID-SSIM-IW(R)
poolInd=16;
blockSize=[3 3];
mslMainPooling_TID(poolInd, metInd, paramIndArray, blockSize)
%% TID-SSIM-IW(R)
poolInd=17;
blockSize=[3 3];
mslMainPooling_TID(poolInd, metInd, paramIndArray, blockSize)
%% TID-SSIM-IW(R)
poolInd=18;
blockSize=[3 3];
mslMainPooling_TID(poolInd, metInd, paramIndArray, blockSize)
%% TID-SSIM-IW(R)
poolInd=31;
blockSize=[3 3];
mslMainPooling_TID(poolInd, metInd, paramIndArray, blockSize)
%% TID-Percentile
poolInd=29;
blockSize=[3 3];
mslMainPooling_TID(poolInd, metInd, paramIndArray, blockSize)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   MSE   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

blockSize=[50 50];
paramIndArray=[1];
metInd=2;
%% TID-Mean Pooling
poolInd=2;
mslMainPooling_TID(poolInd, metInd, paramIndArray, blockSize)
%% TID-Minkowski
poolInd=5;
paramIndArray=[1/8 1/4 1/2 2 4 8];
mslMainPooling_TID(poolInd, metInd, paramIndArray, blockSize)
%% TID-QW
poolInd=9;
paramIndArray=[1/8 1/4 1/2 2 4 8];
mslMainPooling_TID(poolInd, metInd, paramIndArray, blockSize)
%% TID-Min
poolInd=27;
paramIndArray=[1];
mslMainPooling_TID(poolInd, metInd, paramIndArray, blockSize)
%% TID-5-point
poolInd=23;
mslMainPooling_TID(poolInd, metInd, paramIndArray, blockSize)
%% TID-WPP
paramIndArray=[1, 10, 20];
poolInd=28;
mslMainPooling_TID(poolInd, metInd, paramIndArray, blockSize)
%% TID-IW(B)
paramIndArray=[1];
poolInd=14;
blockSize=[3 3];
mslMainPooling_TID(poolInd, metInd, paramIndArray, blockSize)
%% TID-IW(R)
poolInd=15;
mslMainPooling_TID(poolInd, metInd, paramIndArray, blockSize)
%% TID-IW(R)
poolInd=16;
mslMainPooling_TID(poolInd, metInd, paramIndArray, blockSize)
%% TID-IW(R)
poolInd=17;
mslMainPooling_TID(poolInd, metInd, paramIndArray, blockSize)
%% TID-IW(R)
poolInd=18;
mslMainPooling_TID(poolInd, metInd, paramIndArray, blockSize)
%% TID-IW(R)
poolInd=31;
mslMainPooling_TID(poolInd, metInd, paramIndArray, blockSize)
%% TID-Percentile
poolInd=30;
mslMainPooling_TID(poolInd, metInd, paramIndArray, blockSize)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   PerSIM   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

blockSize=[50 50];
paramIndArray=[1];
metInd=3;
%% TID-Mean Pooling
poolInd=2;
mslMainPooling_TID(poolInd, metInd, paramIndArray, blockSize)
%% TID-Minkowski
poolInd=5;
paramIndArray=[1/8 1/4 1/2 2 4 8];
mslMainPooling_TID(poolInd, metInd, paramIndArray, blockSize)
%% TID-QW
poolInd=9;
paramIndArray=[1/8 1/4 1/2 2 4 8];
mslMainPooling_TID(poolInd, metInd, paramIndArray, blockSize)
%% TID-Min
poolInd=19;
paramIndArray=[1];
mslMainPooling_TID(poolInd, metInd, paramIndArray, blockSize)
%% TID-5-point
poolInd=23;
mslMainPooling_TID(poolInd, metInd, paramIndArray, blockSize)
%% TID-WPP
paramIndArray=[1, 10, 20];
poolInd=24;
mslMainPooling_TID(poolInd, metInd, paramIndArray, blockSize)
%% TID-IW(B)
paramIndArray=[1];
poolInd=14;
blockSize=[3 3];
mslMainPooling_TID(poolInd, metInd, paramIndArray, blockSize)
%% TID-IW(R)
poolInd=15;
mslMainPooling_TID(poolInd, metInd, paramIndArray, blockSize)
%% TID-IW(R)
poolInd=16;
mslMainPooling_TID(poolInd, metInd, paramIndArray, blockSize)
%% TID-IW(R)
poolInd=17;
mslMainPooling_TID(poolInd, metInd, paramIndArray, blockSize)
%% TID-IW(R)
poolInd=18;
mslMainPooling_TID(poolInd, metInd, paramIndArray, blockSize)
%% TID-IW(R)
poolInd=31;
mslMainPooling_TID(poolInd, metInd, paramIndArray, blockSize)
%% TID-Percentile
poolInd=29;
mslMainPooling_TID(poolInd, metInd, paramIndArray, blockSize)