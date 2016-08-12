inpath=('watermarked_video.avi');
myVid1 = VideoReader(inpath);
numFrames= myVid1.NumberOfFrames;
i= 1;
while i <= numFrames
currentFrame= read(myVid1,i);
combinedString=strcat('D:/code_video_watermarking/',int2str(i-1),'.jpg');
currentFrame=uint8(rgb2ycbcr(currentFrame));
image = currentFrame(:,:,1);
imwrite(image,combinedString);
i=i+1;
end