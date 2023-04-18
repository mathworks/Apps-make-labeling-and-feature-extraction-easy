% YOLOV4COCODETECT_CODEGEN   Generate MEX-function yolov4cocoDetect_mex from
%  yolov4cocoDetect.
% 
% Script generated from project 'yolov4cocoDetect.prj' on 31-Mar-2023.
% 
% See also CODER, CODER.CONFIG, CODER.TYPEOF, CODEGEN.

%% Create configuration object of class 'coder.MexCodeConfig'.
cfg = coder.gpuConfig('mex');
cfg.GenerateReport = true;
cfg.ReportPotentialDifferences = false;

%% Define argument types for entry-point 'yolov4cocoDetect'.
ARGS = cell(1,1);
ARGS{1} = cell(1,1);
ARGS{1}{1} = coder.typeof(uint8(0),[1080 1920   3],[1 1 0]);

%% Invoke MATLAB Coder.
codegen -config cfg yolov4cocoDetect -args ARGS{1}

