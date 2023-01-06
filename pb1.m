A=[0 0 1 0 0 0;
   1 0 0 0 0 1;
   1 1 0 0 0 0;
   0 1 0 0 0 0;
   0 0 1 0 0 0;
   0 0 0 1 1 0]
%calculate the row sum
D=diag(sum(A,2));
%time limits
t0=0;tf=10;
%laplacians
L= D-A;
%initial conditions
x0=[1 2 3 4 5 6];
[t,x]=ode45(@inputs,[t0 tf],x0,[],L);
figure(1)
plot(t,x,LineWidth=2);
xlabel('t seconds')
ylabel('state')
title('state vs. t')
grid on