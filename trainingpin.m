trainingData = objectDetectorTrainingData(gTruth);
%%
acfdetector = trainACFObjectDetector(trainingData);
%%
D = 'H:/VIProce/dataset/testing/';
d = uigetdir(D);
files = dir(fullfile(d, '*.jpg')); % pattern to match filenames.
SCORES = [];
%%

for k = 1:numel(files)
    F = fullfile(D,files(k).name);
    disp(F)
    I = imread(F);
    [bboxes,scores] = detect(acfdetector,I);
end
%%
I = imread('H:/VIProce/dataset/testing/500.jpg');
[bboxes,scores] = detect(acfdetector,I);
disp(scores)
annotation = sprintf('Confidence = %.1f',scores(1));
img = insertObjectAnnotation(I,'rectangle',bboxes(1 ,:),annotation);
imshow(img)