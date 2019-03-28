# Spatial-Pooling-in-IQA
Code for paper - D. Temel and G. AlRegib, "A comparative study of quality and content-based spatial pooling strategies in image quality assessment," 2015 IEEE Global Conference on Signal and Information Processing (GlobalSIP), Orlando, FL, 2015, pp. 732-736. 

<p align="center">
  <img src=/Images/spatial_pooling.PNG/>
</p> 

### Paper
ArXiv: https://arxiv.org/abs/1811.08891

IEEE: https://ieeexplore.ieee.org/document/7418293

This is a brief explanation and demonstration of the comparative study focused on spatial pooling strategies.

### Citation
If you find our paper and repository useful, please consider citing our paper:  
```
@INPROCEEDINGS{7418293, 
author={D. {Temel} and G. {AlRegib}}, 
booktitle={2015 IEEE Global Conference on Signal and Information Processing (GlobalSIP)}, 
title={A comparative study of quality and content-based spatial pooling strategies in image quality assessment}, 
year={2015}, 
pages={732-736}, 
doi={10.1109/GlobalSIP.2015.7418293}, 
ISSN={}, 
month={Dec},}

```

### Abstract 
The process of quantifying image quality consists of engineering the quality features and pooling these features to obtain a value or a map. There has been a significant research interest in designing the quality features but pooling is usually overlooked compared to feature design. In this work, we compare the state of the art quality and content-based spatial pooling strategies and show that although features are the key in any image quality assessment, pooling also matters. We also propose a quality-based spatial pooling strategy that is based on linearly weighted percentile pooling (WPP). Pooling strategies are analyzed for squared error, SSIM and PerSIM in LIVE, multiply distorted LIVE and TID2013 image databases.

### Keywords
image quality assessment, quality/distortion maps, spatial pooling, statistical significance

### Code
#### To Do
* Download LIVE database from http://live.ece.utexas.edu/research/quality/subjective.htm and locate the folders under the "databaserelease2" folder, add the path of the folder to your Matlab path.
* Download TID2013 database from http://www.ponomarenko.info/tid2013.htm and locate the folders under the "tid2013" folder, add the path of the folder to your Matlab path -   
* Download LIVE Multiply Distorted database from http://live.ece.utexas.edu/research/quality/live_multidistortedimage.html and locate the folders under the "live_multi" folder, add the path of the folder to your Matlab path - 
* You can change the naming of the database directories as you wish but change the naming in the script as well.
#### To obtain scatter plots from precomputed results
* Go to the  "~/data" directory
* Run plotPool_LIVE.M
* Run plotPool_Multi.m
* Run plotPool_TID.m
* To obtain Pearson/Spearman, just comment out the one that you dont want it the begining of the code.
#### To regenerate the results used for plots
* Run main.m to obtain the results in the LIVE database
* Run main_Multi.m to obtain the results in the LIVE Multiply Distorted database
* Run main_TID.m to obtain the results in the TID 2013 database
* When you are done with the simulations, you should obtain files identical to precomputed results.
* If you want to use the data that you generated to obtain plots, copy the results to the corresponding folders in data.
#### To obtain results for a specific quality/distortion map and pooling strategy combination
Individual pooling strategy scores can be obtained by setting metric index (metInd), pooling strategy index (poolInd),
pooling configuration parameters (paramIndArray) and block-size parameter (blockSize)  to obtain the results.
* Run mslMainPooling_LIVE to obtain performance scores for LIVE database
* Run mslMainPooling_Multi to obtain performance scores for Multi database
* Run mslMainPooling_TID to obtain performance scores for TID database
#### Metric Index [metInd]:
* 1 -> SSIM
* 2 -> MSE
* 3 -> PerSIM
#### Pooling Strategy Index: [poolInd]
* 2 -> Mean 
* 5 -> Minkowski (paramIndArray)
* 9 -> Quality Weighted (paramIndArray)
* 14 -> IW(B)
* 15 -> IW(R)
* 16 -> IW(D) 
* 17 -> IW(RG)
* 18 -> IW(BG)
* 31 -> IW(DG)
* 19 -> Min
* 23 -> 5-point
* 24 -> WPP for quality maps (SSIM, PerSIM) (paramInd) (paramIndArray)
* 27 -> Max
* 28 -> WPP for distortion maps (MSE) paramInd) (paramIndArray)
* 29 -> Percentile for quality maps (SSIM, PerSIM) 
* 30 -> Percentile for distortion maps (MSE)
#### Other Parameters
* Pooling configuration parameter: [paramIndArray]
* Block-size of blockprocessing operation:[blockSize]
#### Code Outputs
* PLCC: corrMat(1,:,:):[]
* SRCC: corrMat(2,:,:):['Jp2k','Jpeg','Wn','Gblur','Fastfading','All']
* KRCC: corrMat(3,:,:):['Jp2k','Jpeg','Wn','Gblur','Fastfading','All']
* RMSE: rmseMat(:,:):['Jp2k','Jpeg','Wn','Gblur','Fastfading','All']
* These variables are also saved as mat files as output for further reference.
#### For LIVE database the order of the entries are as follow:
- Jp2k
- Jpeg
- Wn
- Gblur
- Fastfading
- All
#### For TID database the order of the entries are as follow:
- Additive Gaussian noise
- Additive noise in color components is more intensive than additive noise in the luminance component
- Spatially correlated noise 
- Masked noise
- High frequency noise
- Impulse noise
- Quantization noise 
- Gaussian blur
- Image denoising
- JPEG compression
- JPEG2000 compression
- JPEG transmission errors
- JPEG2000 transmission errors
- Non eccentricity pattern noise
- Local block-wise distortions of different intensity
- Mean shift (intensity shift)
- Contrast change
- Change of color saturation
- Multiplicative Gaussian noise
- Comfort noise 
- Lossy compression of noisy images
- Image color quantization with dither
- Chromatic aberrations 
- Sparse sampling and reconstruction




### Contact:

Ghassan AlRegib:  alregib@gatech.edu, https://ghassanalregib.com/, 

Dogancan Temel: dcantemel@gmail.com, http://cantemel.com/


