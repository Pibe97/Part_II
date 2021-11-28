%error fluctuations
hold on
grid on
[s,C]=Q1(150);
minerror=1;
N=13;
Err=zeros(N,1);
for j=1:70
    [P,Q,Pade]=ProgA(C,j,j,1);
    plot(j,abs(sqrt(2)-Pade),'b.');
    minerror=min(minerror,abs(sqrt(2)-Pade));
    Err(j)=abs(sqrt(2)-Pade);
end
axis([0,70,0,10^-15]);
format long
minerror
xlabel('L')
ylabel('Absolute error')
title('Absolute error')