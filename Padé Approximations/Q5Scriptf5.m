%%
N=50;
C=ones(N+1,1);
%Note that C[1]=c_0, C[2]=c_1 etc
syms x
f=exp(x)/(1+x);
for i=2:(N+1)
    g=diff(f,i-1);
    C(i)=subs(g,x,0)/(factorial(i-1));
end

%%
L=14;
[P,Q,Pade]=ProgA(C,L,L,1);
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