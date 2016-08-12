baby = VideoReader('baby.avi');
imageNames = dir(fullfile('D:\code_video_watermarking\watermarkframes\','*.jpg'));
imageNames = {imageNames.name}';
outputVideo = VideoWriter(fullfile('D:\code_video_watermarking\','watermarked_video.avi'));
outputVideo.FrameRate = baby.FrameRate;
open(outputVideo);
for i = 1:length(imageNames)
    img = imread(fullfile('D:\code_video_watermarking\watermarkframes',imageNames{i}));
   % img = ycbcr2rgb(img);
    writeVideo(outputVideo,img);
end
close(outputVideo);
videoFReader = vision.VideoFileReader('watermarked_video.avi');
videoPlayer = vision.VideoPlayer;
%shuttleavi = VideoReader(fullfile('D:\code_video_watermarking\','watermarked_video.avi'));
%ii=1;
%while hasFrame(shuttleavi)
 %   mov(ii) = im2frame(readFrame(shuttleavi));
  %  ii = ii+1;
%end

while ~isDone(videoFReader)
   frame = step(videoFReader);
   step(videoPlayer,frame);
end

release(videoFReader);
release(videoPlayer);
%f = figure;
%f.Position = [150 150 shuttleavi.Width shuttleavi.Height];

%ax = gca;
%ax.Units = 'pixels';
%ax.Position = [0 0 shuttleavi.Width shuttleavi.Height];

%image(mov(1).cdata,'Parent',ax);
%axis off
%movie(mov,1,shuttleavi.FrameRate);
