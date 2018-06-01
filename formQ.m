function Q=formQ(W)
[m,n]=size(W);
Q=eye(m);
for i=1:n
    Q=Q*(eye(m)-2*W(:,i)*W(:,i)');
end