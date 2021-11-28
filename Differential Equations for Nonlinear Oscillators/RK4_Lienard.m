function [ t,x,y ] = RK4_Lienard(a,b,h,N)
%RK4_Q1 takes as input the parameters a and b of the Lienard coordinates.
%h and N designate the step size and the number of steps in the RK4 method.

f1=@(t,x,y) y-a*((x^3)/3-x);
f2=@(t,x,y) -x+1+b;
t=0:N;
x=zeros(5,N+1);
y=zeros(5,N+1);
j=1;

while j<=5    
    t(1)=0;
    x(j,1)=random('unif', -2, 2);
    y(j,1)=random('unif', -2, 2);
    i=2;
    while i<=N+1
        p1=h*f1(t(i-1), x(j,i-1), y(j,i-1));
        q1=h*f2(t(i-1), x(j,i-1), y(j,i-1));
    
        p2=h*f1(t(i-1)+0.5*h, x(j,i-1)+0.5*p1, y(j,i-1)+0.5*q1);
        q2=h*f2(t(i-1)+0.5*h, x(j,i-1)+0.5*p1, y(j,i-1)+0.5*q1);
    
        p3=h*f1(t(i-1)+0.5*h, x(j,i-1)+0.5*p2, y(j,i-1)+0.5*q2);
        q3=h*f2(t(i-1)+0.5*h, x(j,i-1)+0.5*p2, y(j,i-1)+0.5*q2);
    
        p4=h*f1(t(i-1)+h, x(j,i-1)+p3, y(j,i-1)+q3);
        q4=h*f2(t(i-1)+h, x(j,i-1)+p3, y(j,i-1)+q3);
    
        x(j,i)=x(j,i-1)+(1/6)*(p1+2*p2+2*p3+p4);
        y(j,i)=y(j,i-1)+(1/6)*(q1+2*q2+2*q3+q4);
        t(i)=t(i-1)+h;
        i=i+1;
    end    
    plot(x(j,:),y(j,:));
    hold on
    plot(x(j,1),y(j,1),'rx');
    j=j+1;    
end
grid on
xlabel('x')
ylabel('dx/dt')
title(['Random trajectories for a='  num2str(a) ' and b='  num2str(b)])
hold off

end