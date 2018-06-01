function [X,Q]=Helper(A,tau,l,p,Q)
for i=1:2
    [W,R]=house(A*A'*Q);
    Q=formQ(W);
    Q=Q(:,1:size(R,2));
    R=R(1:size(R,2),:);
end
[W,C]=house(A'*Q);
H=formQ(W);
H=H(:,1:size(C,2));
C=C(1:size(C,2),:);
[W,P]=Polar(C);
[V,D]=eig(P);
X=(Q*V)*S_tau(D,tau)*(H*W*V)';
Q=Q*V;