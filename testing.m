function[Y, time] = testing(W, input,threshold)
X = input;
n=size(X,1);
Y = zeros(n,1);
t = cputime;
for i=1:n
    g = W*X(i,:);
    if g>threshold
        Y(i,1) = 0;
    else
        Y(i,1) = 1;
    end;
end;
time = cputime - t;