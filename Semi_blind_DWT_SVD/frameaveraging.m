function [rWav,psnravim, psnravwm,corcoeffwmav,averageframes] = frameaveraging(images1,WM,images)
k=0.2;
% rWav,psnravim, psnravwm,corcoeffwmav,averageframes
% obj = VideoReader('watermarked_video.avi');
% video = read(obj);
nFrames = 645;
i=1;
for l=1:5:nFrames
   

     averageframes{i} =(images1{l}+images1{l+1}+images1{l+2}+images1{l+3}+images1{l+4})/5;
      i=i+1;
      
      if l==645
          break;
      end
     
end
num = length(averageframes);
for j=1:num
    [avA1,avH1,avV1,avD1] = dwt2(averageframes{j},'haar');
    allavA1(:,:,j) = avA1;
    allavH1(:,:,j) = avH1;
    allavV1(:,:,j) = avV1;
    allavD1(:,:,j) = avD1;
    [avU1,avS1,~] = svd(allavD1(:,:,j));
    allavU1(:,:,j) = avU1;
    allavS1(:,:,j) = avS1;
    [avA,avH,avV,avD] = dwt2(images{j},'haar');
    allavA(:,:,j) = avA;
    allavH(:,:,j) = avH;
    allavV(:,:,j) = avV;
    allavD(:,:,j) = avD;
    [Uav,Sav,Vav] = svd(allavD(:,:,j));
    allUav(:,:,j) = Uav;
    allSav(:,:,j) = Sav;
    allVav(:,:,j) = Vav;
    W = imresize(WM,[360,204]);
    W = rgb2gray(W);
    [wavA,wavH,wavV,wavD] = dwt2(W,'haar');
    [wUav,wSav,wVav] = svd(wavD);
    sav(:,:,j) = (wSav - allSav(:,:,j))/k;
    wDav(:,:,j) = wUav*sav(:,:,j)*wVav';
    rWav(:,:,j) = idwt2(wavA,wavH,wavV,wDav(:,:,j),'haar');
    rWav(:,:,j) = uint8(rWav(:,:,j));
    psnravim = psnr(uint8(averageframes{j}),images{j});
    psnravwm = psnr(uint8(rWav(:,:,j)),W);
    corcoeffwmav = corr2(uint8(rWav(:,:,j)),W); 
end
end
