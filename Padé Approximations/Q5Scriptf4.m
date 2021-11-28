%%
N=100;
C=ones(N+1,1);
%Note that C[1]=c_0, C[2]=c_1 etc
for i=2:(N+1)
        C(i)=1/(factorial(i-1));
end

%%
X=-10:0.01:10;
L=34;
[P,Q,Pade]=ProgA(C,L,L,X);
P=transpose(P);
Q=transpose(Q);
zero=ProgB(P);
poles=ProgB([1 Q]);

plot(real(zero),imag(zero), 'bx')
hold on
plot(real(poles),imag(poles),'ro')
grid on
xlabel('real')
ylabel('imaginary')
title(['Zeros and Poles in the Complex Plane for L=' num2str(L)])
hold off