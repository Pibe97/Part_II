function [ Res ] = WaveEqn2( dx,dt,N,M,q,w)

Res=zeros(N+1,M+1); %initialise Matrix
uNj=zeros(M+1,1);
for j=1:M+1 %apply the initial value 
        Res(1,j)=sin(w*(j-1)*dt);
end

for j=1:M+1 %apply the value given at i=N for all j
    Res(N+1,j)=uNj(j);
end

for i=2:N %set first time evaluation
    Res(i,2)=Res(i,1)+0.5*(dt)^2*( (dx)^(-2)*(Res(i+1,1)-2*Res(i,1)+Res(i-1,1)) -q^2*0.5*(Res(i+1,1)+Res(i-1,1)));
end

for j=3:M+1 %apply full scheme
    for i=2:N
        Res(i,j)=2*Res(i,j-1)-Res(i,j-2)+(dt)^2*((dx)^(-2)*(Res(i+1,j-1)-2*Res(i,j-1)+Res(i-1,j-1)) -0.5*q^2*(Res(i+1,j-1)+Res(i-1,j-1) ));
    end
end

end





