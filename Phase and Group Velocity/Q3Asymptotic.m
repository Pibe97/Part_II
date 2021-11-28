dx=0.01; dt=0.001; N=8000; M=50000; q=1;
uNj=zeros(M+1,1);

f_tilde= @(k) 16*(3*sin(k)-3*k.*cos(k)-k.^2.*sin(k))./k.^5;
Res=WaveEqn(dx,dt,N,M,uNj,q);
X=0:dx:N*dx;

plot(X,Res(:,5001),'r')
hold on
plot(-X,Res(:,5001),'r')
t=5000*dt;
u=((q^0.5)*t./((2*pi)^0.5*(t^2-X.^2).^(3/4))).*f_tilde(q*X./sqrt(t^2-X.^2)).*cos(q*sqrt(t^2-X.^2)+pi/4);
plot(X,u,'b-.')
plot(-X,u,'b-.')
grid on
axis([-55 55 -0.2 0.2])
hold off 
xlabel('x'); ylabel('y'); title(['Superposition of the numerical and asymptotic solution for t=30'])