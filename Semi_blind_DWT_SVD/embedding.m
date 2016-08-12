function [allcA,allcH,allcV,allcD,imw] = embedding(images,WM)
p = 0.2;
k=1;
numframe = 645;

for i=1:numframe
    [cA,cH,cV,cD] = dwt2(images{i},'haar');
    allcA(:,:,k) = cA;
    allcH(:,:,k) = cH;
    allcV(:,:,k) = cV;
    allcD(:,:,k) = cD;
    [U,S,V] = svd(allcD(:,:,k));
    allU(:,:,k) = U;
    allV(:,:,k) = V;
    allS(:,:,k) = S;
    W = imresize(WM,[360,204]);
    W = rgb2gray(W);
    [~,~,~,wD] = dwt2(W,'haar');
    [~,wS,~] = svd(wD);
    SW(:,:,k) = allS(:,:,k) + p * wS;
    [~,oS,~] = svd(SW(:,:,k));
    alloS(:,:,k) = oS;
    [~,~,~,D] = dwt2(alloS(:,:,k),'haar');
    allD(:,:,k) = D;
    rD(:,:,k) = imresize(allD(:,:,k),[180,102]);
    imw(:,:,k) = idwt2(allcA(:,:,k),allcH(:,:,k),allcV(:,:,k),rD(:,:,k),'haar');
    imw(:,:,k) = imresize(imw(:,:,k),[360,204]);
    imw(:,:,k) = uint8(imw(:,:,k));
    k=k+1;
   
end
end