# サンプルデータの作成（電流と回転速度）

以下の例題をPredictive Maintenance Toolbox™の診断特徴デザイナーを用いて解析したい場合のサンプルデータを作成します。

[https://jp.mathworks.com/help/predmaint/ug/motor-current-signature-analysis-for-gear-train-fault-detection.html](https://jp.mathworks.com/help/predmaint/ug/motor-current-signature-analysis-for-gear-train-fault-detection.html)

# 初期化

```matlab:Code
clear; close all;
format short; format compact;
% 乱数群の制御
rng('default');
```

# データの読み込み

```matlab:Code
load('mcsaData.mat','servoData')
servoData
```

| |healthyData|faultyData|
|:--:|:--:|:--:|
|1|16384x2 timetable|16384x2 timetable|
|2|16384x2 timetable|16384x2 timetable|
|3|16384x2 timetable|16384x2 timetable|
|4|16384x2 timetable|16384x2 timetable|
|5|16384x2 timetable|16384x2 timetable|
|6|16384x2 timetable|16384x2 timetable|
|7|16384x2 timetable|16384x2 timetable|
|8|16384x2 timetable|16384x2 timetable|
|9|16384x2 timetable|16384x2 timetable|
|10|16384x2 timetable|16384x2 timetable|

# データの読み込み

```matlab:Code
servoData.healthyData{1}
```

| |Time|Pulse|Signal|
|:--:|:--:|:--:|:--:|
|1|0 秒|0|66.5233|
|2|0.00066667 秒|0|62.7980|
|3|0.0013333 秒|0|63.5963|
|4|0.002 秒|0|64.1285|
|5|0.0026667 秒|0|60.6693|
|6|0.0033333 秒|0|62.7980|
|7|0.004 秒|0|65.4590|
|8|0.0046667 秒|0|56.6779|
|9|0.0053333 秒|0|53.2187|
|10|0.006 秒|0|62.7980|
|11|0.0066667 秒|0|63.0641|
|12|0.0073333 秒|0|59.6049|
|13|0.008 秒|0|64.9268|
|14|0.0086667 秒|0|64.9268|

# 診断特徴デザイナーへの入力データの初期化

```matlab:Code
sz = [20,3];
varTypes = {'cell','cell','categorical'};
varNames = {'Current','Tacho','faultCode'};
sampleData = table('Size',sz,'VariableTypes',varTypes,'VariableNames',varNames);
```

# 正常 \& 異常データの定義

```matlab:Code
healthyData = servoData.healthyData;
faultyData = servoData.faultyData;
machineData = [healthyData; faultyData];
sampleData.faultCode(1:10) = "0";
sampleData.faultCode(11:20) = "1";
sampleData.faultCode = categorical(sampleData.faultCode);
```

# 入力データの作成

```matlab:Code
for n = 1:size(machineData)
    sampleData.Current{n} = machineData{n}(:,'Signal');
    sampleData.Tacho{n} = machineData{n}(:,'Pulse');
end

sampleData
```

| |Current|Tacho|faultCode|
|:--:|:--:|:--:|:--:|
|1|16384x1 timetable|16384x1 timetable|0|
|2|16384x1 timetable|16384x1 timetable|0|
|3|16384x1 timetable|16384x1 timetable|0|
|4|16384x1 timetable|16384x1 timetable|0|
|5|16384x1 timetable|16384x1 timetable|0|
|6|16384x1 timetable|16384x1 timetable|0|
|7|16384x1 timetable|16384x1 timetable|0|
|8|16384x1 timetable|16384x1 timetable|0|
|9|16384x1 timetable|16384x1 timetable|0|
|10|16384x1 timetable|16384x1 timetable|0|
|11|16384x1 timetable|16384x1 timetable|1|
|12|16384x1 timetable|16384x1 timetable|1|
|13|16384x1 timetable|16384x1 timetable|1|
|14|16384x1 timetable|16384x1 timetable|1|

*Copyright 2023 The MathWorks, Inc.*
