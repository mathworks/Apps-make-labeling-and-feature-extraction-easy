%% generate_YOLOv4cocodetector_as_matfile

detector = yolov4ObjectDetector('csp-darknet53-coco');
% detector = yolov4ObjectDetector('tiny-yolov4-coco');
save yolov4coco.mat detector

% Copyright 2023 The MathWorks, Inc.
