blockSize=[50 50];
paramIndArray=[1];
metInd=1;
%% LIVE-SSIM-Mean Pooling
poolInd=2;
mslMainPooling_LIVE(poolInd, metInd, paramIndArray, blockSize)
%% LIVE-SSIM-Minkowski
poolInd=5;
paramIndArray=[1/8 1/4 1/2 2 4 8];
mslMainPooling_LIVE(poolInd, metInd, paramIndArray, blockSize)
%% LIVE-SSIM-Minkowski
poolInd=9;
paramIndArray=[1/8 1/4 1/2 2 4 8];
mslMainPooling_LIVE(poolInd, metInd, paramIndArray, blockSize)
%% LIVE-SSIM-Min
poolInd=19;
paramIndArray=[1];
mslMainPooling_LIVE(poolInd, metInd, paramIndArray, blockSize)
%% LIVE-SSIM-5-point
poolInd=23;
mslMainPooling_LIVE(poolInd, metInd, paramIndArray, blockSize)
%% LIVE-SSIM-WPP
paramIndArray=[1, 10, 20];
poolInd=24;
mslMainPooling_LIVE(poolInd, metInd, paramIndArray, blockSize)
%% LIVE-SSIM-IW(B)
paramIndArray=[1];
poolInd=14;
blockSize=[3 3];
mslMainPooling_LIVE(poolInd, metInd, paramIndArray, blockSize)
%% LIVE-SSIM-IW(R)
poolInd=15;
blockSize=[3 3];
mslMainPooling_LIVE(poolInd, metInd, paramIndArray, blockSize)
%% LIVE-SSIM-IW(R)
poolInd=16;
blockSize=[3 3];
mslMainPooling_LIVE(poolInd, metInd, paramIndArray, blockSize)
%% LIVE-SSIM-IW(R)
poolInd=17;
blockSize=[3 3];
mslMainPooling_LIVE(poolInd, metInd, paramIndArray, blockSize)
%% LIVE-SSIM-IW(R)
poolInd=18;
blockSize=[3 3];
mslMainPooling_LIVE(poolInd, metInd, paramIndArray, blockSize)
%% LIVE-SSIM-IW(R)
poolInd=31;
blockSize=[3 3];
mslMainPooling_LIVE(poolInd, metInd, paramIndArray, blockSize)
%% LIVE-Percentile
paramIndArray=[1];
poolInd=29;
blockSize=[3 3];
mslMainPooling_LIVE(poolInd, metInd, paramIndArray, blockSize)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   MSE   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

blockSize=[50 50];
paramIndArray=[1];
metInd=2;
%% LIVE-Mean Pooling
poolInd=2;
mslMainPooling_LIVE(poolInd, metInd, paramIndArray, blockSize)
%% LIVE-Minkowski
poolInd=5;
paramIndArray=[1/8 1/4 1/2 2 4 8];
mslMainPooling_LIVE(poolInd, metInd, paramIndArray, blockSize)
%% LIVE-QW
poolInd=9;
paramIndArray=[1/8 1/4 1/2 2 4 8];
mslMainPooling_LIVE(poolInd, metInd, paramIndArray, blockSize)
%% LIVE-Max
poolInd=27;
paramIndArray=[1];
mslMainPooling_LIVE(poolInd, metInd, paramIndArray, blockSize)
%% LIVE-5-point
poolInd=23;
mslMainPooling_LIVE(poolInd, metInd, paramIndArray, blockSize)
%% LIVE-WPP
paramIndArray=[1, 10, 20];
poolInd=28;
mslMainPooling_LIVE(poolInd, metInd, paramIndArray, blockSize)
%% LIVE-IW(B)
paramIndArray=[1];
poolInd=14;
blockSize=[3 3];
mslMainPooling_LIVE(poolInd, metInd, paramIndArray, blockSize)
%% LIVE-IW(R)
poolInd=15;
mslMainPooling_LIVE(poolInd, metInd, paramIndArray, blockSize)
%% LIVE-IW(R)
poolInd=16;
mslMainPooling_LIVE(poolInd, metInd, paramIndArray, blockSize)
%% LIVE-IW(R)
poolInd=17;
mslMainPooling_LIVE(poolInd, metInd, paramIndArray, blockSize)
%% LIVE-IW(R)
poolInd=18;
mslMainPooling_LIVE(poolInd, metInd, paramIndArray, blockSize)
%% LIVE-IW(R)
poolInd=31;
mslMainPooling_LIVE(poolInd, metInd, paramIndArray, blockSize)
%% LIVE-Percentile
paramIndArray=[1];
poolInd=30;
mslMainPooling_LIVE(poolInd, metInd, paramIndArray, blockSize)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   PerSIM   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

blockSize=[50 50];
paramIndArray=[1];
metInd=3;
%% LIVE-Mean Pooling
poolInd=2;
mslMainPooling_LIVE(poolInd, metInd, paramIndArray, blockSize)
%% LIVE-Minkowski
poolInd=5;
paramIndArray=[1/8 1/4 1/2 2 4 8];
mslMainPooling_LIVE(poolInd, metInd, paramIndArray, blockSize)
%% LIVE-QW
poolInd=9;
paramIndArray=[1/8 1/4 1/2 2 4 8];
mslMainPooling_LIVE(poolInd, metInd, paramIndArray, blockSize)
%% LIVE-Min
poolInd=19;
paramIndArray=[1];
mslMainPooling_LIVE(poolInd, metInd, paramIndArray, blockSize)
%% LIVE-5-point
poolInd=23;
mslMainPooling_LIVE(poolInd, metInd, paramIndArray, blockSize)
%% LIVE-WPP
paramIndArray=[1, 10, 20];
poolInd=24;
mslMainPooling_LIVE(poolInd, metInd, paramIndArray, blockSize)
%% LIVE-IW(B)
paramIndArray=[1];
poolInd=14;
blockSize=[3 3];
mslMainPooling_LIVE(poolInd, metInd, paramIndArray, blockSize)
%% LIVE-IW(R)
poolInd=15;
mslMainPooling_LIVE(poolInd, metInd, paramIndArray, blockSize)
%% LIVE-IW(R)
poolInd=16;
mslMainPooling_LIVE(poolInd, metInd, paramIndArray, blockSize)
%% LIVE-IW(R)
poolInd=17;
mslMainPooling_LIVE(poolInd, metInd, paramIndArray, blockSize)
%% LIVE-IW(R)
poolInd=18;
mslMainPooling_LIVE(poolInd, metInd, paramIndArray, blockSize)
%% LIVE-IW(R)
poolInd=31;
mslMainPooling_LIVE(poolInd, metInd, paramIndArray, blockSize)
%% LIVE-Percentile
paramIndArray=[1];
poolInd=29;
mslMainPooling_LIVE(poolInd, metInd, paramIndArray, blockSize)