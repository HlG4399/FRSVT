function [X,Q]=FRSVT(A,tau,l,p)
tic
if nargin<1
    close all
    A=double(rgb2gray(imread('1.jpg')));
    imshow(uint8(A));
    figure
    tau=1/norm(A,2);
    l=20;
    p=10;
end
if(size(A,1)<size(A,2))
    A=A';
end
m=size(A,1);
n=size(A,2);
%%Range_Propagation
Omega=randn(n,l);
Y=A*Omega;
Q=QR_CP(Y);
[X,Q]=Helper(A,tau,l,p,Q);
Omega=randn(n,p);           
Y=A*Omega;
Q=PartialOrthogonalization(Q,Y);
[X,Q]=Helper(A,tau,l,p,Q);
imshow(uint8(X));
toc
