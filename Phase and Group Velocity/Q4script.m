dx=0.01; dt=0.01; N=30000; M=30000; q=1; w=0.9;
A1=WaveEqn2(dx,dt,N,M,q,w);
X=0:dx:300;
plot(X,A1(:,8000));
axis([0 220 -0.4 0.4]) 
%%
dx=0.01; dt=0.01; N=30000; M=30000; q=1; w=1.1;
A2=WaveEqn2(dx,dt,N,M,q,w);
X=0:dx:300;
plot(X,A2(:,8000));
axis([0 220 -1.1 1.1]) 
%%
dx=0.01; dt=0.01; N=30000; M=30000; q=1; w=1.5;
A3=WaveEqn2(dx,dt,N,M,q,w);
X=0:dx:300;
plot(X,A3(:,8000));
axis([0 220 -1.2 1.2]) 