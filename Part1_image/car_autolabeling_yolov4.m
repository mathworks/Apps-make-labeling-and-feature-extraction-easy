function autoLabels = car_autolabeling_yolov4(I)

% YOLOv4による検出の実行
% [bboxes,labels] = yolov4cocoDetect_mex(I); % mexファイルをコード生成した場合
[bboxes,labels] = yolov4cocoDetect(I); % mexファイルをコード生成してない場合

% 検出結果から'car'のみを抽出
car_idx = labels == 'car';
bboxes_car = bboxes(car_idx,:);
if ~isempty(bboxes_car) % carがあった場合
    numLabels = size(bboxes_car,1);
    for i = 1:numLabels % 自動ラベリング
        autoLabels(i).Name = 'car';
        autoLabels(i).Type = labelType('Rectangle');
        autoLabels(i).Position = bboxes_car(i,:);
    end
else % carが無かった場合
    autoLabels = []; % 空行列を返す
end

% Copyright 2023 The MathWorks, Inc.