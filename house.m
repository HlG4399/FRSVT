function [W,R]=house(A)
[m,n]=size(A);
W=zeros(m,n);
for k=1:n
    W(k:m,k)=sign(A(k,k))*norm(A(k:m,k))*eye(m-k+1,1)+A(k:m,k);
    W(:,k)=W(:,k)/norm(W(:,k));
    A(k:m,k:n)=A(k:m,k:n)-2*W(k:m,k)*W(k:m,k)'*A(k:m,k:n);
end
R=A;