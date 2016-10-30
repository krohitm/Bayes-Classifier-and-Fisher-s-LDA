function[mu1, mu2, cov1, cov2, p1, p2] = params(Dclass1, Dclass2, sizeTrain)

mu1 = mean(Dclass1(:,2:8));
mu2 = mean(Dclass2(:,2:8));

cov1 = cov(Dclass1(:,2:8));
cov2 = cov(Dclass2(:,2:8));
p1 = size(Dclass1,1)/sizeTrain;
p2 = size(Dclass2,1)/sizeTrain;