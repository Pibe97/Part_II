function [ R ] = ProgB(C)

D=zeros(length(C),1);
for i=1:length(C)
    D(i)=C(length(C)-i+1);
end
R=roots(D);
end