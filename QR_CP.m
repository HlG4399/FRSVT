function Q=QR_CP(Y)
B=double(Y);
[m n]=size(B);
Q=zeros(m,n);
bmax=B(:,1);
flag=1;

%寻找范数最大的一列
for i=2:n
    if (norm(bmax)<norm(B(:,i)))
        bmax=B(:,i);
        flag=i;
    end
end

%householder变换成第一个元素不为零，其他元素为零，并保证范数相等
B(:,flag)=B(:,1);
B(:,1)=bmax;
Q(:,1)=B(:,1)/norm(B(:,1));

for j=2:n
    bmax2=zeros(m,1);
    flag2=j;
    for i=1:j-1
        bmax2=bmax2+Q(:,i)'*B(:,j)*Q(:,i);
    end
    bmax2=B(:,j)-bmax2;
    
    for u=j+1:n
        c=zeros(m,1);
        
        for i=1:j-1
            c=c+Q(:,i)'*B(:,u)*Q(:,i);
        end
        
        if (norm(bmax2)<norm(B(:,u)-c))
            bmax2=B(:,u)-c;
            flag2=u;
        end
    end
    
    d=B(:,flag2);
    B(:,flag2)=B(:,j);
    B(:,j)=d;
    Q(:,j)=bmax2/norm(bmax2);
end
end




