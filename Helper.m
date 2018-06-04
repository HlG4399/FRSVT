function [X,Q]=Helper(A,tau,l,p,Q)
for i=1:2
    [Q,R]=qr(A*A'*Q);
    Q=Q(:,1:size(R,2));
    R=R(1:size(R,2),:);
end
[H,C]=qr(A'*Q);
H=H(:,1:size(C,2));
C=C(1:size(C,2),:);
[W,P]=Polar(C);
[V,D]=eig(P);
X=(Q*V)*S_tau(D,tau)*(H*W*V)';
Q=Q*V;
