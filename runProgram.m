function[YFinal, conMat, time] = runProgram()
T = readtable('HW4.txt');
%X = table2array(T(:,2:8));  %taking features
%Y = table2array(T(:,1));       %taking classes
D = table2array(T);

TrainD = D(1:140,:);         %taking training data
col = size(TrainD,2);
rows = size(TrainD,1);
j=1;
k=1;

for i=1:rows
    if TrainD(i,1)== 1
        Dclass1(j,1:col)=TrainD(i,1:col);    %separating data for two classes
        j=j+1;
    else
        Dclass2(k,1:col) = TrainD(i,1:col);
        k=k+1;
    end;
end;

testD = D(141:200,:);

sizeTrain = size(TrainD,1);

[mu1, mu2, cov1, cov2] = params(Dclass1, Dclass2, sizeTrain);

[YPredTest,threshold, W] = testing(testD(:,2:8), mu1,mu2,cov1,cov2);
YActualTest = testD(:,1);
%conMat = confuMat(YPredTest, YActualTest);  %considering class 1 as POSITIVE
conMat = confusionmat(YActualTest, YPredTest);
%DecBound = decBound(mu1,mu2,cov1,cov2);
[YFinal, time] = finalModel(W, D(:,2:8), threshold, mu1,mu2,cov1,cov2);



