function [] = folderwatermarkimages(y2rgb)
i= 1;
while i <= 645
    currentFrame= y2rgb(:,:,:,i);
    combinedString=strcat('E:/code_video_watermarking1/watermarkedframes1/',int2str(i-1),'.jpg');
    currentFrame=uint8(currentFrame);
%     image = currentFrame(:,:,1);
    rgbframe = ycbcr2rgb(currentFrame);
    imwrite(rgbframe,combinedString);
    i=i+1;
end
end