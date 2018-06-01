function S_D=S_tau(D,tau)
n=size(D,1);
S_D=zeros(n,n);
for i=1:n
    S_D(i,i)=sign(D(i,i))*max([abs(D(i,i)-tau) 0]);
end