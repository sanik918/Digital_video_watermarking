function [images] = im_array()
file = dir('E:\code_video_watermarking1\frames\*.jpg');
NF = length(file);
images = cell(NF,1);

parfor k = 1:NF
    images{k} = imread(fullfile('E:\code_video_watermarking1\frames\',file(k).name));
end
end