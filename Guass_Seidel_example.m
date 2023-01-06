A=[10 -1 2 0;-1 11 -1 3;2 -1 10 -1;0 3 -1 8];
b=[6 25 -11 15];x=[0 0 0 0]'
L=zeros(length(A));U=zeros(length(A));
for i=1:length(A)
    for j=1:i-1
        L(i,j)=A(i,j);U(j,i)=A(j,i);
    end
    L(i,i)=A(i,i);
end
x=guass_seidel(L,U,b,x,1000)