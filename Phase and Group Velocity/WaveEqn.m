function [ Res ] = WaveEqn( dx,dt,N,M,uNj,q )

Res=zeros(N+1,M+1); %initialise Matrix
for i=1:N+1 %apply the initial value 
    if (i-1)*dx<1
        Res(i,1)=(1-((i-1)*dx)^2)^2;
    end
end

for j=1:M+1 %apply the value given at i=N for all j
    Res(N+1,j)=uNj(j);
end

for i=1:N %set first time evaluation
    if i==1 %case where we would get negative index
        Res(i,2)=Res(1,1)+0.5*(dt)^2*( (dx)^(-2)*(Res(2,1)-2*Res(1,1)+Res(2,1)) -q^2*0.5*(Res(2,1)+Res(2,1))); 
    else %no negative index
        Res(i,2)=Res(i,1)+0.5*(dt)^2*( (dx)^(-2)*(Res(i+1,1)-2*Res(i,1)+Res(i-1,1)) -q^2*0.5*(Res(i+1,1)+Res(i-1,1)));
    end
end

for j=3:M+1 %apply full scheme
    for i=1:N
        if i==1
            Res(i,j)=2*Res(i,j-1)-Res(i,j-2)+(dt)^2*((dx)^(-2)*(Res(i+1,j-1)-2*Res(i,j-1)+Res(i+1,j-1)) -0.5*q^2*(Res(i+1,j-1)+Res(i+1,j-1) ));
        else
            Res(i,j)=2*Res(i,j-1)-Res(i,j-2)+(dt)^2*((dx)^(-2)*(Res(i+1,j-1)-2*Res(i,j-1)+Res(i-1,j-1)) -0.5*q^2*(Res(i+1,j-1)+Res(i-1,j-1) ));
        end
    end
end

end

