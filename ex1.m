%% DGD
A=[3/4 1/4 0 0;
   1/4 1/4 1/4 1/4;
   0 1/4 5/12 1/3;
   0 1/4 1/3 5/12];
%iteration
N=2000;
N2=15;
x=zeros(4,N);x0=[1,8,5,0.7]'; x(:,1)=x0;
dt=0.01
for K=2:N
    if K==2
        x(:,K)=A*x0;
    else
        alpha=0.5/sqrt(K);
        x(:,K)=A*x(:,K-1)-alpha*gra_qrad(x(:,K-1),A);
    end
end
x=x(:,1:N2);
t=0:N2-1;
figure(1)
plot(t,x,LineWidth=2);
xlabel('k')
ylabel('state')
title('state vs. k')
grid on

%%calculation of error
cal=sum(1/2*(x-repmat(x(:,N2),1,N2)).^2);
t=0:N2-1;
figure(2)
plot(t,cal,LineWidth=1);
xlabel('k')
ylabel('state')
title('error')
grid on


function qradsum=gra_qrad(x,A)
    B=zeros(length(A));C=zeros(length(B));
    B(find(A~=0))=1;
    B=B-eye(length(A));
    for i=1:length(A)
        for j=1:length(A)
            if B(i,j)==0
                C(i,j)=0;
            else
                C(i,j)=x(i)-x(j);
            end
        end
    end
    K=abs(C).*exp(1/2.*(C.^2));
    qradsum=sum(K,2);
end

