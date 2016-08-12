function [] = folderwatermarkimages(imw4)
i= 1;
while i <= 173
    currentFrame= imw4(:,:,i);
    combinedString=strcat('D:/code_video_watermarking/watermarkedframes/',int2str(i-1),'.jpg');
    currentFrame=uint8(currentFrame);
    image = currentFrame(:,:,1);
    imwrite(image,combinedString);
    i=i+1;
end
end