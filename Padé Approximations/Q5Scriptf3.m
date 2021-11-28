%%
N=120;
C=ones(N+1,1);
%Note that C[1]=c_0, C[2]=c_1 etc
for i=2:(N+1)
        for j=1:i-1
            C(i)=(0.5-j)*C(i);
        end
        C(i)=C(i)/(factorial(i-1));
end

%%
L=20;
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
axis([-20 5 -5 5])

