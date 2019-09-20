trainingData = objectDetectorTrainingData(gTruth);
%%
acfdetector = trainACFObjectDetector(trainingData);
%%
testimage = imread('../dataset/testing/469.jpg');
[bboxes,scores] = detect(acfdetector,testimage);
for i = 1:length(scores)
   annotation = sprintf('Confidence = %.1f',scores(i));
   img = insertObjectAnnotation(testimage,'rectangle',bboxes(i,:),annotation);
end
figure
imshow(img)
%%
rcnndetector = trainRCNNObjectDetector(trainingData);
%%
testimage = imread('../dataset/testing/462.jpg');
[bboxes,scores] = detect(rcnndetector,testimage);
for i = 1:length(scores)
   annotation = sprintf('Confidence = %.1f',scores(i));
   img = insertObjectAnnotation(img,'rectangle',bboxes(i,:),annotation);
end
figure
imshow(img)
%%
frcnndetector = trainFastRCNNObjectDetector(trainingData);
%%
[bboxes,scores] = detect(frcnndetector,testimage);
for i = 1:length(scores)
   annotation = sprintf('Confidence = %.1f',scores(i));
   img = insertObjectAnnotation(img,'rectangle',bboxes(i,:),annotation);
end
figure
imshow(img)
%%
fasterdetector = trainFasterRCNNObjectDetector(trainingData);
[bboxes,scores] = detect(fasterdetector,testimage);
for i = 1:length(scores)
   annotation = sprintf('Confidence = %.1f',scores(i));
   img = insertObjectAnnotation(img,'rectangle',bboxes(i,:),annotation);
end
figure
imshow(img)
%%