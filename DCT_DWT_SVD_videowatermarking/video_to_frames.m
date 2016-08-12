inpath=('video2.mp4');
myVid= VideoReader(inpath);
numFrames= myVid.NumberOfFrames;
i= 1;
while i<= numFrames
currentFrame= read(myVid,i);
combinedString=strcat('D:/project/code_video_watermarking2/',int2str(i-1),'.jpg');
currentFrame=uint8(rgb2ycbcr(currentFrame));
image = currentFrame(:,:,1);
 imwrite(image,combinedString);
%imwrite(currentFrame,combinedString);
i=i+1;
end