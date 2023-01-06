A=[0 0 1 0 0 0;
   1 0 0 0 0 1;
   1 1 0 0 0 0;
   0 1 0 0 0 0;
   0 0 1 0 0 0;
   0 0 0 1 1 0]
%calculate the row sum
D=diag(sum(A,2));I=eye(size(A,1));alpha=0.01
%iteration
F = I-0.001*(D-A);N=20000;
x=zeros(6,N);x0=[1,2,3,4,5,6]'; x(:,1)=x0;
%[t,x]=ode45(@inputs,[t0 tf],x0,[],L);
for K=2:N
    if K==2
        x(:,K)=F*x0;
    else 
        x(:,K)=F*x(:,K-1);
    end
end
t=0:N-1
figure(2)
plot(t,x,LineWidth=2);
xlabel('t iterations')
ylabel('state')
title('state vs. t')
grid on