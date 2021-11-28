function [ t, x1, y1, x2, y2 ] = RK4_Q3( a, b, h, N )
%RK4_Q3 is an adaption of RK4_Q1. This version gives as output two
%solutions, one with initial conditions (x(0),xdot(0))=(2,2), the other
%(-2,-2). It takes as input parameter values a and b as well as step size h
%and number of steps N. 

f1=@(t,x,y) y;
f2=@(t,x,y) -a*y+x-x^3+b*cos(t);

t=0:N;
x1=0:N;
y1=0:N;
t(1)=0;
x1(1)=2;
y1(1)=2;
i=2;

while i<=N+1
    p1=h*f1(t(i-1), x1(i-1), y1(i-1));
    q1=h*f2(t(i-1), x1(i-1), y1(i-1));
    
    p2=h*f1(t(i-1)+0.5*h, x1(i-1)+0.5*p1, y1(i-1)+0.5*q1);
    q2=h*f2(t(i-1)+0.5*h, x1(i-1)+0.5*p1, y1(i-1)+0.5*q1);
    
    p3=h*f1(t(i-1)+0.5*h, x1(i-1)+0.5*p2, y1(i-1)+0.5*q2);
    q3=h*f2(t(i-1)+0.5*h, x1(i-1)+0.5*p2, y1(i-1)+0.5*q2);
    
    p4=h*f1(t(i-1)+h, x1(i-1)+p3, y1(i-1)+q3);
    q4=h*f2(t(i-1)+h, x1(i-1)+p3, y1(i-1)+q3);
    
    x1(i)=x1(i-1)+(1/6)*(p1+2*p2+2*p3+p4);
    y1(i)=y1(i-1)+(1/6)*(q1+2*q2+2*q3+q4);
    t(i)=t(i-1)+h;
    i=i+1;
end

t=0:N;
x2=0:N;
y2=0:N;
t(1)=0;
x2(1)=-2;
y2(1)=-2;
i=2;

while i<=N+1
    p1=h*f1(t(i-1), x2(i-1), y2(i-1));
    q1=h*f2(t(i-1), x2(i-1), y2(i-1));
    
    p2=h*f1(t(i-1)+0.5*h, x2(i-1)+0.5*p1, y2(i-1)+0.5+q1);
    q2=h*f2(t(i-1)+0.5*h, x2(i-1)+0.5*p1, y2(i-1)+0.5+q1);
    
    p3=h*f1(t(i-1)+0.5*h, x2(i-1)+0.5*p2, y2(i-1)+0.5+q2);
    q3=h*f2(t(i-1)+0.5*h, x2(i-1)+0.5*p2, y2(i-1)+0.5+q2);
    
    p4=h*f1(t(i-1)+h, x2(i-1)+p3, y2(i-1)+q3);
    q4=h*f2(t(i-1)+h, x2(i-1)+p3, y2(i-1)+q3);
    
    x2(i)=x2(i-1)+(1/6)*(p1+2*p2+2*p3+p4);
    y2(i)=y2(i-1)+(1/6)*(q1+2*q2+2*q3+q4);
    t(i)=t(i-1)+h;
    i=i+1;
end

end