function Q_Y=PartialOrthogonalization(Q,Y)
A=[Q Y];
m=size(A,1);
n=size(A,2);
for i=size(Q,2)+1:n
    while(rank(A(:,1:i))~=min(size(A(:,1:i))))
        A(:,i)=rand(m,1);
    end
end
Q=A;
R=zeros(n,n);
for i=1:n
    Q(:,i)=A(:,i);
end
for i=size(Q,20):n
    R(i,i)=norm(Q(:,i),2);
    Q(:,i)=Q(:,i)/R(i,i);
    for j=i+1:n
        R(i,j)=Q(:,i)'*Q(:,j);
        Q(:,j)=Q(:,j)-R(i,j)*Q(:,i);
    end
end
Q_Y=Q;
end
