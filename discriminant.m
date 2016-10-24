function[g] = discriminant(x,covClass, meanClass, probClass)

d = size(x,2);  %no. of features
mu = meanClass; %mean of features for given class
E = covClass;   %
p= probClass;
g = (-1/2)*(x-mu)*pinv(E)*(x-mu).' - (d/2)*log (2*pi) - 1/2*log (det(E)) + log (p);
