%Question 1 plots
X=-6:0.01:6;
phase= @(x,q) sqrt((q./x).^2+1);
group= @(x,q) x./sqrt(q^2+x.^2);

Yp0=phase(X,0);
Yg0=group(X,0);
plot(X,Yp0,'m-.');
hold on
plot(X,Yg0,'m');

Yp1=phase(X,1);
Yg1=group(X,1);
plot(X,Yp1,'b-.');
hold on
plot(X,Yg1,'b');

Yp2=phase(X,3);
Yg2=group(X,3);
plot(X,Yp2,'r-.');
plot(X,Yg2,'r');

Yp3=phase(X,8);
Yg3=group(X,8);
plot(X,Yp3,'g-.');
plot(X,Yg3,'g');

axis([-6 6 -2 15])
grid on
title('Phase and Group Velocity')
xlabel('x')
ylabel('y')