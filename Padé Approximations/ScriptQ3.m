%Power series
Pow2 = @(x) 1+1/2*x-1/8*x.^2;
Pow3 = @(x) 1+1/2*x-1/8*x.^2+1/16*x.^3;
Pow4 = @(x) 1+1/2*x-1/8*x.^2+1/16*x.^3-5/128*x.^4;

x=0:0.01:3;
hold on
grid on
plot(x,Pow2(x));
plot(x,Pow3(x));
plot(x,Pow4(x));
plot(x,sqrt(1+x));

xlabel('x');
ylabel('y');
title('Power series for different N=2,3,4')