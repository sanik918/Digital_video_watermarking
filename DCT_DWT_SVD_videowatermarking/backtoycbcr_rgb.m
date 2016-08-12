function [] = backtoycbcr_rgb(images)

i= 1;
while i<= numFrames
currentFrame= images{i};
combinedString=strcat('D:/code_video_watermarking/frames/',int2str(i-1),'.jpg');
currentFrame=uint8(rgb2ycbcr(currentFrame));
image = currentFrame(:,:,1);
imwrite(image,combinedString);
i=i+1;
end
end