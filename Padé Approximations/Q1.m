function [ s, C ] = Q1( N )
%Gives Taylor coefficients and their sum
C=ones(N+1,1);
%Note that C[1]=c_0, C[2]=c_1 etc
for i=2:(N+1)
        for j=0:i-2
            C(i)=(0.5-j)*C(i);
        end
        C(i)=C(i)/(factorial(i-1));
end
s=sum(C);
end

