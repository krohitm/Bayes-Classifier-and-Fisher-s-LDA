function[thresholdBest, W] = training(TrainD, mu1,mu2,cov1,cov2)
X = TrainD(:,2:8);
n=size(TrainD,1);
W = pinv((cov1+cov2)./2)*(mu2 - mu1).';
accuPrev = 0;
YActualTest = TrainD(:,1);
for T=-2000:0
    Y = zeros(n,1);
    threshold = 1/2*(mu1*pinv(cov1)*mu1.' - mu2*pinv(cov2)*mu2.' + T);
    for i=1:n
        g = W.'*X(i,:).';
        if g>threshold
            Y(i,1) = 0;
        else
            Y(i,1) = 1;
        end;
    end;
    confu = confusionmat(YActualTest, Y);
    accuNew = (confu(1,1)+confu(2,2))/n;
    if accuNew > accuPrev
        thresholdBest = threshold;
    end
end;
end