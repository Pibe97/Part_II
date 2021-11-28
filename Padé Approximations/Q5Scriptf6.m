%%
N=80;
C=ones(N+1,1);
%Note that C[1]=c_0, C[2]=c_1 etc
syms x
f=sqrt(1+x+x^2);
for i=2:(20+1)
    g=diff(f,i-1);
    C(i)=subs(g,x,0)/(factorial(i-1));
end

%%
X=-20:0.01:100;
L=5;
[P,Q,Pade]=ProgA(C,4,3,X);
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
axis([-5 5 -2 2])