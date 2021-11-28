dx=0.005; dt=0.005; N=40000; M=10000; q=1;
uNj=zeros(M+1,1);
A1=WaveEqn(dx,dt,N,M,uNj,q);
f=@(x) heaviside(x+1).*heaviside(1-x).*(1-x.^2).^2;

%check solutions at x=5 for various times 
n=1000;
for i=1:M
    g=@(x) besselj(1,q*i*dt*cos(x));
    f1=@(x) f(n*dx+i*dt*sin(x));
    h=@(x) f1(x).*g(x);
    exct5(i)=0.5*f(n*dx-i*dt)+0.5*f(n*dx+i*dt)-0.5*q*i*dt*integral(h,-pi/2,pi/2);
    err5(i)=(A1(n+1,i)-exct5(i));
end

%check solutions at x=10 for various times
n=2000;
for i=1:M
    g=@(x) besselj(1,q*i*dt*cos(x));
    f1=@(x) f(n*dx+i*dt*sin(x));
    h=@(x) f1(x).*g(x);
    exct10(i)=0.5*f(n*dx-i*dt)+0.5*f(n*dx+i*dt)-0.5*q*i*dt*integral(h,-pi/2,pi/2);
    err10(i)=(A1(n+1,i)-exct10(i));
end

%check solutions at x=25 for various times
n=5000;
for i=1:M
    g=@(x) besselj(1,q*i*dt*cos(x));
    f1=@(x) f(n*dx+i*dt*sin(x));
    h=@(x) f1(x).*g(x);
    exct25(i)=0.5*f(n*dx-i*dt)+0.5*f(n*dx+i*dt)-0.5*q*i*dt*integral(h,-pi/2,pi/2);
    err25(i)=(A1(n+1,i)-exct25(i));
end

%check solutions at x=50 for various times
n=10000;
for i=1:M
    g=@(x) besselj(1,q*i*dt*cos(x));
    f1=@(x) f(n*dx+i*dt*sin(x));
    h=@(x) f1(x).*g(x);
    exct50(i)=0.5*f(n*dx-i*dt)+0.5*f(n*dx+i*dt)-0.5*q*i*dt*integral(h,-pi/2,pi/2);
    err50(i)=(A1(n+1,i)-exct50(i));
end