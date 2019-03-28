blockSize=[50 50];
paramIndArray=[1];
metInd=1;
%% Multi-SSIM-Mean Pooling
poolInd=2;
mslMainPooling_Multi(poolInd, metInd, paramIndArray, blockSize)
%% Multi-SSIM-Minkowski
poolInd=5;
paramIndArray=[1/8 1/4 1/2 2 4 8];
mslMainPooling_Multi(poolInd, metInd, paramIndArray, blockSize)
%% Multi-SSIM-Minkowski
poolInd=9;
paramIndArray=[1/8 1/4 1/2 2 4 8];
mslMainPooling_Multi(poolInd, metInd, paramIndArray, blockSize)
%% Multi-SSIM-Min
poolInd=19;
paramIndArray=[1];
mslMainPooling_Multi(poolInd, metInd, paramIndArray, blockSize)
%% Multi-SSIM-5-point
poolInd=23;
mslMainPooling_Multi(poolInd, metInd, paramIndArray, blockSize)
%% Multi-SSIM-WPP
paramIndArray=[1, 10, 20];
poolInd=24;
mslMainPooling_Multi(poolInd, metInd, paramIndArray, blockSize)
%% Multi-SSIM-IW(B)
paramIndArray=[1];
poolInd=14;
blockSize=[3 3];
mslMainPooling_Multi(poolInd, metInd, paramIndArray, blockSize)
%% Multi-SSIM-IW(R)
poolInd=15;
blockSize=[3 3];
mslMainPooling_Multi(poolInd, metInd, paramIndArray, blockSize)
%% Multi-SSIM-IW(R)
poolInd=16;
blockSize=[3 3];
mslMainPooling_Multi(poolInd, metInd, paramIndArray, blockSize)
%% Multi-SSIM-IW(R)
poolInd=17;
blockSize=[3 3];
mslMainPooling_Multi(poolInd, metInd, paramIndArray, blockSize)
%% Multi-SSIM-IW(R)
poolInd=18;
blockSize=[3 3];
mslMainPooling_Multi(poolInd, metInd, paramIndArray, blockSize)
%% Multi-SSIM-IW(R)
poolInd=31;
blockSize=[3 3];
mslMainPooling_Multi(poolInd, metInd, paramIndArray, blockSize)
%% Multi-Percentile
poolInd=29;
blockSize=[3 3];
mslMainPooling_Multi(poolInd, metInd, paramIndArray, blockSize)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   MSE   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

blockSize=[50 50];
paramIndArray=[1];
metInd=2;
%% Multi-Mean Pooling
poolInd=2;
mslMainPooling_Multi(poolInd, metInd, paramIndArray, blockSize)
%% Multi-Minkowski
poolInd=5;
paramIndArray=[1/8 1/4 1/2 2 4 8];
mslMainPooling_Multi(poolInd, metInd, paramIndArray, blockSize)
%% Multi-QW
poolInd=9;
paramIndArray=[1/8 1/4 1/2 2 4 8];
mslMainPooling_Multi(poolInd, metInd, paramIndArray, blockSize)
%% Multi-Min
poolInd=27;
paramIndArray=[1];
mslMainPooling_Multi(poolInd, metInd, paramIndArray, blockSize)
%% Multi-5-point
poolInd=23;
mslMainPooling_Multi(poolInd, metInd, paramIndArray, blockSize)
%% Multi-WPP
paramIndArray=[1, 10, 20];
poolInd=28;
mslMainPooling_Multi(poolInd, metInd, paramIndArray, blockSize)
%% Multi-IW(B)
paramIndArray=[1];
poolInd=14;
blockSize=[3 3];
mslMainPooling_Multi(poolInd, metInd, paramIndArray, blockSize)
%% Multi-IW(R)
poolInd=15;
mslMainPooling_Multi(poolInd, metInd, paramIndArray, blockSize)
%% Multi-IW(R)
poolInd=16;
mslMainPooling_Multi(poolInd, metInd, paramIndArray, blockSize)
%% Multi-IW(R)
poolInd=17;
mslMainPooling_Multi(poolInd, metInd, paramIndArray, blockSize)
%% Multi-IW(R)
poolInd=18;
mslMainPooling_Multi(poolInd, metInd, paramIndArray, blockSize)
%% Multi-IW(R)
poolInd=31;
mslMainPooling_Multi(poolInd, metInd, paramIndArray, blockSize)
%% Multi-Percentile
poolInd=30;
mslMainPooling_Multi(poolInd, metInd, paramIndArray, blockSize)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   PerSIM   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

blockSize=[50 50];
paramIndArray=[1];
metInd=3;
%% Multi-Mean Pooling
poolInd=2;
mslMainPooling_Multi(poolInd, metInd, paramIndArray, blockSize)
%% Multi-Minkowski
poolInd=5;
paramIndArray=[1/8 1/4 1/2 2 4 8];
mslMainPooling_Multi(poolInd, metInd, paramIndArray, blockSize)
%% Multi-QW
poolInd=9;
paramIndArray=[1/8 1/4 1/2 2 4 8];
mslMainPooling_Multi(poolInd, metInd, paramIndArray, blockSize)
%% Multi-Min
poolInd=19;
paramIndArray=[1];
mslMainPooling_Multi(poolInd, metInd, paramIndArray, blockSize)
%% Multi-5-point
poolInd=23;
mslMainPooling_Multi(poolInd, metInd, paramIndArray, blockSize)
%% Multi-WPP
paramIndArray=[1, 10, 20];
poolInd=24;
mslMainPooling_Multi(poolInd, metInd, paramIndArray, blockSize)
%% Multi-IW(B)
paramIndArray=[1];
poolInd=14;
blockSize=[3 3];
mslMainPooling_Multi(poolInd, metInd, paramIndArray, blockSize)
%% Multi-IW(R)
poolInd=15;
mslMainPooling_Multi(poolInd, metInd, paramIndArray, blockSize)
%% Multi-IW(R)
poolInd=16;
mslMainPooling_Multi(poolInd, metInd, paramIndArray, blockSize)
%% Multi-IW(R)
poolInd=17;
mslMainPooling_Multi(poolInd, metInd, paramIndArray, blockSize)
%% Multi-IW(R)
poolInd=18;
mslMainPooling_Multi(poolInd, metInd, paramIndArray, blockSize)
%% Multi-IW(R)
poolInd=31;
mslMainPooling_Multi(poolInd, metInd, paramIndArray, blockSize)
%% Multi-Percentile
poolInd=29;
mslMainPooling_Multi(poolInd, metInd, paramIndArray, blockSize)