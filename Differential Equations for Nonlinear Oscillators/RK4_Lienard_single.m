function [ t,x,y ] = RK4_Lienard_single( a,b,x_0,xdot_0,h,N )

f1=@(t,x,y) y-a*((x^3)/3-x);
f2=@(t,x,y) -x+1+b;
t=0:N;
x=0:N;
y=0:N;
t(1)=0;
x(1)=x_0;
y(1)=xdot_0;
i=2;
while i<=N+1
    p1=h*f1(t(i-1), x(i-1), y(i-1));
    q1=h*f2(t(i-1), x(i-1), y(i-1));
 
    p2=h*f1(t(i-1)+0.5*h, x(i-1)+0.5*p1, y(i-1)+0.5*q1);
    q2=h*f2(t(i-1)+0.5*h, x(i-1)+0.5*p1, y(i-1)+0.5*q1);
    
    p3=h*f1(t(i-1)+0.5*h, x(i-1)+0.5*p2, y(i-1)+0.5*q2);
    q3=h*f2(t(i-1)+0.5*h, x(i-1)+0.5*p2, y(i-1)+0.5*q2);
    
    p4=h*f1(t(i-1)+h, x(i-1)+p3, y(i-1)+q3);
    q4=h*f2(t(i-1)+h, x(i-1)+p3, y(i-1)+q3);
    
    x(i)=x(i-1)+(1/6)*(p1+2*p2+2*p3+p4);
    y(i)=y(i-1)+(1/6)*(q1+2*q2+2*q3+q4);
    t(i)=t(i-1)+h;
    i=i+1;
end
plot(x,y);
hold on
%plot(x(1),y(1),'rx');
grid on
xlabel('x')
ylabel('dx/dt')
title(['Trajectory for a='  num2str(a) ', b='  num2str(b) ', x(0)=' num2str(x_0) ', dx/dt(0)=' num2str(xdot_0)])
%hold off

end