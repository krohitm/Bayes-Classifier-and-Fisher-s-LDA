function[solx] = decBound(mu1,mu2,cov1,cov2,p1, p2)
E1 = cov1;
E2 = cov2;

-1/2*log (det(E1)) + log(p1) + 1/2*log(det(E2)) - log(p2)=