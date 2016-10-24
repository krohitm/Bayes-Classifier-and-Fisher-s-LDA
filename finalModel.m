function[Y, time] = finalModel(input, mu1,mu2,cov1,cov2,p1, p2)
X = input;
n=size(X,1);
Y = zeros(n,1);
t = cputime;
for i=1:n
    g1 = discriminant(X(i,:),cov1, mu1, p1);
    g2 = discriminant(X(i,:),cov2, mu2, p2);
    if g1>=g2
        Y(i,1) = 1;
    else
        Y(i,1) = 0;
    end;
end;
time = cputime - t;
