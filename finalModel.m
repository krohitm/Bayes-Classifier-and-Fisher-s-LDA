function[Y, time] = finalModel(W, input,threshold, mu1,mu2,cov1,cov2)
X = input;
n=size(X,1);
Y = zeros(n,1);
t = cputime;
for i=1:n
    g = W*X(i,:);
    if g>threshold
        Y(i,1) = 1;
    else
        Y(i,1) = 0;
    end;
end;
time = cputime - t;
