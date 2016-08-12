function [Wmext,psnrwmf,msewmf,images1] = extracting(images,WM)
p=0.2;
file = dir('D:\project\code_video_watermarking2\watermarkedframes\*.jpg');
NF = length(file);
images1 = cell(NF,1);

for i = 1:NF
    images1{i} = imread(fullfile('D:\project\code_video_watermarking2\watermarkedframes\',file(i).name));
end
for j=1:NF
    dctwatermarkedframe{j} = dct2(images1{j});
    [wmA1,wmH1,wmV1,wmD1] = dwt2(dctwatermarkedframe{j},'haar');
    allwmA1(:,:,k) = wmA1;
    allwmH1(:,:,k) = wmH1;
    allwmV1(:,:,k) = wmV1;
    allwmD1(:,:,k) = wmD1;
    [wmA2,wmH2,wmV2,wmD2] = dwt2(allwmA1(:,:,j),'haar');
    allwmA2(:,:,k) = wmA2;
    allwmH2(:,:,k) = wmH2;
    allwmV2(:,:,k) = wmV2;
    allwmD2(:,:,k) = wmD2;
    [wmA3,wmH3,wmV3,wmD3] = dwt2(allwmA2(:,:,j),'haar');
    allwmA3(:,:,k) = wmA3;
    allwmH3(:,:,k) = wmH3;
    allwmV3(:,:,k) = wmV3;
    allwmD3(:,:,k) = wmD3;
    [U,S,V] = svd(allwmA3(:,:,k));
    allwmU(:,:,k) = U;
    allwmV(:,:,k) = V;
    allwmS(:,:,k) = S;
    W = imresize(WM,[64,113]);
    W = rgb2gray(W);
    [Uw,Sw,Vw] = svd(double(W));
    SWext(:,:,k) = (Sw - allwmS(:,:,k))/p;
    Wmext(:,:,k) = Uw*SWext(:,:,k)*Vw';  
    
    psnrwmf = psnr(images1{j},images{j});
    msewmf = mse(images1{j},images{j});
  
end
end
