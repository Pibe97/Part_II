L=14;
X=-25:0.05:5;
[s,C]=Q1(150);
plot([-1 -1], [-100 100],'m')
hold on
[P,Q,Pade]=ProgA(C,L,L,X);
P=transpose(P);
Q=transpose(Q);
zero=ProgB(P);
poles=ProgB([1 Q]);

plot(real(zero),imag(zero), 'bx')
plot(real(poles),imag(poles),'ro')
grid on
xlabel('real')
ylabel('imaginary')
title(['Zeros and Poles in the Complex Plane for L=' num2str(L)])
hold off
%axis([-25 5 -5 5])

