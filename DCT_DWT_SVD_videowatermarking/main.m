WM = imread('w.jpg');
[images] = im_array();
[W,imw4] = embedding(images,WM);
%[Wmext,psnrwmf,msewmf,images1] = extracting(images,WM);
% [I,I1,I2,rW1,psnrnoiseim,psnrnoisewm, corcoeffwm,rW2,psnrnoiseim1,psnrnoisewm1, corcoeffwm1,rW3,psnrnoiseim2,psnrnoisewm2, corcoeffwm2] = noise(images,WM);
% [rWb,psnrblurim,psnrblurwm,corcoeffwmblur,BlurI] = blurring(WM,images);
% [rWav,psnravim, psnravwm,corcoeffwmav,averageframes] = frameaveraging(images1,WM,images);
% [rWr,psnrroim,psnrrowm,corcoeffwmro,rotate] = framerotate(images,WM);
folderwatermarkimages(imw4);
% FrametoVideo;
