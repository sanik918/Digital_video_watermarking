function [rWb,psnrblurim,psnrblurwm,corcoeffwmblur,BlurI] = blurring(WM,images)
k=0.2;
obj = VideoReader('watermarkedVideo.avi');
video = read(obj);
nFrames = size(video,4);
H = fspecial('disk',2);

parfor i = 1:nFrames
    BlurI(:,:,i) = imfilter(video(:,:,i),H,'replicate');
end
for j=1:nFrames
    [bA1,bH1,bV1,bD1] = dwt2(BlurI(:,:,j),'haar');
    allbA1(:,:,j) = bA1;
    allbH1(:,:,j) = bH1;
    allbV1(:,:,j) = bV1;
    allbD1(:,:,j) = bD1;
    [bU1,bS1,~] = svd(allbD1(:,:,j));
    allbU1(:,:,j) = bU1;
    allbS1(:,:,j) = bS1;
    [bA,bH,bV,bD] = dwt2(images{j},'haar');
    allbA(:,:,j) = bA;
    allbH(:,:,j) = bH;
    allbV(:,:,j) = bV;
    allbD(:,:,j) = bD;
    [Ub,Sb,Vb] = svd(allbD(:,:,j));
    allUb(:,:,j) = Ub;
    allSb(:,:,j) = Sb;
    allVb(:,:,j) = Vb;
    W = imresize(WM,[360,204]);
    W = rgb2gray(W);
    [waA,waH,waV,waD] = dwt2(W,'haar');
    [wU,wS,wV] = svd(waD);
    sb(:,:,j) = (wS - allSb(:,:,j))/k;
    wDb(:,:,j) = wU*sb(:,:,j)*wV';
    rWb(:,:,j) = idwt2(waA,waH,waV,wDb(:,:,j),'haar');
    rWb(:,:,j) = uint8(rWb(:,:,j));
    psnrblurim = psnr(uint8(BlurI(:,:,j)),images{j});
    psnrblurwm = psnr(uint8(rWb(:,:,j)),W);
    corcoeffwmblur = corr2(uint8(rWb(:,:,j)),W); 
end
end


