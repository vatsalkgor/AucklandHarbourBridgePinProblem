%Read the video into video variable and extract numbers of frames into that
%video
video = VideoReader('video2.MOV');
nFrames = video.NumberOfFrames;
n = nFrames;
for i = 1:1:n
  frames = read(video,i);
  imwrite(frames,['H:\VIProce\dataset\video 2\' int2str(i), '.jpg']);
end 