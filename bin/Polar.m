function [W,P]=Polar(C)
[U,S,V]=svd(C);
W=U*V';
P=V*S*V';