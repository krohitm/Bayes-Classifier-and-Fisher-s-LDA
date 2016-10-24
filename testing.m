function[Y, threshold, W] = testing(testData, mu1,mu2,cov1,cov2)
X = testData;
n=size(testData,1);
Y = zeros(n,1);
threshold = 1/2*(mu1*pinv(cov1)*mu1.' - mu2*pinv(cov2)*mu2.');
W = pinv(cov1+cov2)*(mu2 - mu1).';
for i=1:n
    g = W*X(i,:);
    if g>threshold
        Y(i,1) = 1;
    else
        Y(i,1) = 0;
    end;
end;