function [W,imw4] = embedding(images,WM)
p = 0.2;
k=1;
numframe = 173;

for i=1:numframe
    dctimage{i} = dct2(images{i});
    [cA1,cH1,cV1,cD1] = dwt2(dctimage{i},'haar');
    allcA1(:,:,k) = cA1;
    allcH1(:,:,k) = cH1;
    allcV1(:,:,k) = cV1;
    allcD1(:,:,k) = cD1;
    [cA2,cH2,cV2,cD2] = dwt2(allcA1(:,:,i),'haar');
    allcA2(:,:,k) = cA2;
    allcH2(:,:,k) = cH2;
    allcV2(:,:,k) = cV2;
    allcD2(:,:,k) = cD2;
    [cA3,cH3,cV3,cD3] = dwt2(allcA2(:,:,i),'haar');
    allcA3(:,:,k) = cA3;
    allcH3(:,:,k) = cH3;
    allcV3(:,:,k) = cV3;
    allcD3(:,:,k) = cD3;
    [U,S,V] = svd(allcA3(:,:,k));
    allU(:,:,k) = U;
    allV(:,:,k) = V;
    allS(:,:,k) = S;
    W = imresize(WM,[64,113]);
    W = rgb2gray(W);
    [Uw,Sw,Vw] = svd(double(W));
    SW(:,:,k) = allS(:,:,k) + p * Sw;
    Wdwtframe(:,:,k) = allU(:,:,k)*SW(:,:,k)*allV(:,:,k)';    
    imw1(:,:,k) = idwt2(Wdwtframe(:,:,k),allcH3(:,:,k),allcV3(:,:,k),allcD3(:,:,k),'haar');
    imwdash(:,:,k)=imresize(imw1(:,:,k),[127,225]);
    imw2(:,:,k) = idwt2(imwdash(:,:,k),allcH2(:,:,k),allcV2(:,:,k),allcD2(:,:,k),'haar');
    imwdash2(:,:,k) = imresize(imw2(:,:,k),[253,450]);
    imw3(:,:,k) = idwt2(imwdash2(:,:,k),allcH1(:,:,k),allcV1(:,:,k),allcD1(:,:,k),'haar');
    imw4(:,:,k) = idct2(imw3(:,:,k));
    imw4(:,:,k) = uint8(imw4(:,:,k));
    k=k+1;
   
end
end