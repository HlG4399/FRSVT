function TestSVD
clear;clc
close all
A=double(rgb2gray(imread('1.jpg')));
I=A;
imshow(uint8(A));
tic
figure
[S,V,D]=svd(I);
imshow(uint8(I));
figure
k=10;
imshow(uint8(S(:,1:k)*V(1:k,1:k)*D(:,1:k)'));
toc