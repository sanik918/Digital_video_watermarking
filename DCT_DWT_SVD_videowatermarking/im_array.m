function [images] = im_array()
file = dir('D:\project\code_video_watermarking2\frames\*.jpg');
NF = length(file);
images = cell(NF,1);

parfor k = 1:NF
    images{k} = imread(fullfile('D:\project\code_video_watermarking2\frames\',file(k).name));
end
end