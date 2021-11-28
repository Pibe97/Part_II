function [ C ] = Qu4( N )
%Qu4 gives the coefficients of the asymptotic expansion up until x^N
%Note C(1)=coefficient of x^0 etc.
for j=1:N+1
    C(j)=factorial(j-1)*(-1)^(j-1);
end
end