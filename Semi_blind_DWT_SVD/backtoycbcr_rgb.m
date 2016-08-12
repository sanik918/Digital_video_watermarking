function [] = backtoycbcr_rgb(imageCr,imageCb)
% file = dir('E:\code_video_watermarking1\watermarkedframes\*.jpg');
% NF = length(file);
% imagesim = cell(NF,1);
% 
% parfor k = 1:NF
%     imagesim{k} = imread(fullfile('E:\code_video_watermarking1\watermarkedframes\',file(k).name));
% end
obj = VideoReader('watermarkedVideo.avi');
video = read(obj);
NF = size(video,4);
i= 1;
while i<= NF
% currentFrame= imagesim{i};
combinedString=strcat('E:/code_video_watermarking1/watermarkedframes1/',int2str(i-1),'.jpg');

rgbimage = cat(3,video(:,:,i),imageCr{i},imageCb{i});
imwrite(rgbimage,combinedString);
i=i+1;
end
end