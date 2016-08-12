function [imageY,imageCb,imageCr] = video_to_frames()
inpath=('baby.avi');
myVid= VideoReader(inpath);
numFrames= myVid.NumberOfFrames;
i= 1;
%  a=gray();
while i<= numFrames
currentFrame= read(myVid,i);
combinedString=strcat('E:/code_video_watermarking1/frames1/',int2str(i-1),'.jpg');
currentFrame=uint8(rgb2ycbcr(currentFrame));
imageY = currentFrame(:,:,1);
imageCb{i} = currentFrame(:,:,2);
imageCr{i} = currentFrame(:,:,3);
% just_Y = cat(3,imageY,a,a);
% just_Cb = cat(3,a,imageCb,a);
% just_Cr = cat(3,a,a,imageCr);
% Y=ycbcr2rgb(just_Y);
% Cb=ycbcr2rgb(just_Cb);
% Cr=ycbcr2rgb(just_Cr);
 imwrite(imageY,combinedString);
%imwrite(currentFrame,combinedString);
i=i+1;
end
end