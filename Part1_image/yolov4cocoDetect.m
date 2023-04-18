function [bboxes,labels] = yolov4cocoDetect(in)
%#codegen

%   Copyright 2022 The MathWorks, Inc.

persistent yolov4Obj;

if isempty(yolov4Obj)
    yolov4Obj = coder.loadDeepLearningNetwork('yolov4coco.mat');
end

[bboxes,~,labels] = yolov4Obj.detect(in,'Threshold',0.5);

end