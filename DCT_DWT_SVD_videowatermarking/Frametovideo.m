ImFolder=uigetdir;
pngFile = dir(strcat(ImFolder,'\*.jpg'));
S = [pngFile(:).datenum]; 
[~,S] = sort(S);
pngFiles = pngFile(S);
VideoFile=strcat(ImFolder,'\watermarkedVideo');
writeObj = VideoWriter(VideoFile);
fps= 24; 
writeObj.FrameRate = fps;
open(writeObj);
cmap = gray(256);
for t= 1:length(pngFiles)
     Frame=imread(strcat(ImFolder,'\',pngFiles(t).name));
     writeVideo(writeObj,im2frame(Frame,cmap));
end
close(writeObj);
%j=cat(3,i,i,i);