function [rWr,psnrroim,psnrrowm,corcoeffwmro,rotate] = framerotate(images,WM)
k=0.2;
obj = VideoReader('watermarkedVideo.avi');
video = read(obj);
nFrames = size(video,4);

parfor i = 1:nFrames
    rotate(:,:,i) = imrotate(video(:,:,i),45,'bilinear','crop');
end
for j=1:nFrames
    [rA1,rH1,rV1,rD1] = dwt2(rotate(:,:,j),'haar');
    allrA1(:,:,j) = rA1;
    allrH1(:,:,j) = rH1;
    allrV1(:,:,j) = rV1;
    allrD1(:,:,j) = rD1;
    [rU1,rS1,~] = svd(allrD1(:,:,j));
    allrU1(:,:,j) = rU1;
    allrS1(:,:,j) = rS1;
    [rA,rH,rV,rD] = dwt2(images{j},'haar');
    allrA(:,:,j) = rA;
    allrH(:,:,j) = rH;
    allrV(:,:,j) = rV;
    allrD(:,:,j) = rD;
    [Ur,Sr,Vr] = svd(allrD(:,:,j));
    allUr(:,:,j) = Ur;
    allSr(:,:,j) = Sr;
    allVr(:,:,j) = Vr;
    W = imresize(WM,[360,204]);
    W = rgb2gray(W);
    [wrA,wrH,wrV,wrD] = dwt2(W,'haar');
    [wUr,wSr,wVr] = svd(wrD);
    sr(:,:,j) = (wSr - allSr(:,:,j))/k;
    wDr(:,:,j) = wUr*sr(:,:,j)*wVr';
    rWr(:,:,j) = idwt2(wrA,wrH,wrV,wDr(:,:,j),'haar');
    rWr(:,:,j) = uint8(rWr(:,:,j));
    psnrroim = psnr(uint8(rotate(:,:,j)),images{j});
    psnrrowm = psnr(uint8(rWr(:,:,j)),W);
    corcoeffwmro = corr2(uint8(rWr(:,:,j)),W); 
end
end