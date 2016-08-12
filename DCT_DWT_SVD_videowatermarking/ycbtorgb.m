obj = VideoReader('watermarkedVideo.avi');
video = read(obj);
nFrames = size(video,4);
j=1;
for i = 1:nFrames
    y2rgb(:,:,:,j) = cat(3,video(:,:,i),video(:,:,i),video(:,:,i));
   j=j+1;
end