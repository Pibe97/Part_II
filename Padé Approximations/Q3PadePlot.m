hold on
grid on
X=0:0.01:100;
[s,C]=Q1(100);

[p1,q1,Pade1]=ProgA(C,1,1,X);
plot(X, Pade1,'r');
[p5,q5,Pade5]=ProgA(C,5,5,X);
plot(X, Pade5,'b');
[p10,q10,Pade10]=ProgA(C,10,10,X);
plot(X, Pade10,'g');
[p15,q15,Pade15]=ProgA(C,15,15,X);
plot(X, Pade15,'m');
plot(X,sqrt(1+X),'c')
xlabel('x');
ylabel('Pade approximation')
title('Padé approximation for different L')

