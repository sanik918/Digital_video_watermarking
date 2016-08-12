

% WM = imread('watermark.jpg');
% [images] = im_array();
[imageY,imageCb,imageCr] = video_to_frames();
% [allcA,allcH,allcV,allcD,imw] = embedding(images,WM);
 [y2rgb]=ycbtorgb(imageCb,imageCr);
 folderwatermarkimages(y2rgb);
%  backtoycbcr_rgb(imageCr,imageCb);
% [rW,psnrwmf,msewmf,rate,images1] = extracting(images,WM);
% [I,I1,I2,rW1,psnrnoiseim,psnrnoisewm, corcoeffwm,rW2,psnrnoiseim1,psnrnoisewm1, corcoeffwm1,rW3,psnrnoiseim2,psnrnoisewm2, corcoeffwm2] = noise(images,WM);
% [rWb,psnrblurim,psnrblurwm,corcoeffwmblur,BlurI] = blurring(WM,images);
% [rWav,psnravim, psnravwm,corcoeffwmav,averageframes] = frameaveraging(images1,WM,images);
% [rWr,psnrroim,psnrrowm,corcoeffwmro,rotate] = framerotate(images,WM);
%folderwatermarkimages(imw);
% FrametoVideo;
