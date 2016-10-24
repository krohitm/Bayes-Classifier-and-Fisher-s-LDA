function[conMat] = confuMat(YPredTest, YActualTest)
%Positive = YActualTest(YActualTest == 1);
%Negative = YActualTest(YActualTest == 0);
TP = YActualTest(YActualTest == 1 & YActualTest == YPredTest);
TPCount = size(TP,1);
TN = YActualTest(YActualTest == 0 & YActualTest == YPredTest);
TNCount = size(TN,1);
FN = YActualTest(YActualTest == 1 & YActualTest ~= YPredTest);
FNCount = size(FN,1);
FP = YActualTest(YActualTest == 0 & YActualTest ~= YPredTest);
FPCount = size(FP,1);
conMat = [TPCount FNCount; FPCount TNCount];