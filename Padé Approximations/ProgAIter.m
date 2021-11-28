function [ P,Q,Pade ] = ProgAIter( C,L,M,X,iter)

%Define B
B=zeros(M,1);
for i=1:M
    B(i,1)=-C(L+i+1);
end

%Define A
A=zeros(M,M);
for i=1:M
    for j=1:min(L+i,M)
        A(i,j)=C(L+1+i-j);
    end
end

%Solve for Q
Q=linsolve(A,B);

%Iterative improvement
for i=1:iter
    dQ=linsolve(A,B-A*Q);
    Q=Q+dQ;
end

%Solve for P
P=zeros(L+1,1);
for k=1:(L+1)
    P(k,1)=C(k);
    for s=1:min(k-1,M)
        P(k,1)=P(k,1)+Q(s,1)*C(k-s);        
    end
end

%Code to evaluate at specific values X
Pade=zeros(length(X),1);
for i=1:length(X)
    num=0;
    den=1;
    for k=1:(L+1)
        num=num+P(k,1)*(X(i)^(k-1));
    end
    for k=1:M
        den=den+Q(k,1)*(X(i)^k);
    end
    Pade(i)=num/den;
    %disp(['Pade approximation at x=' num2str(X(i)) ' is ' num2str(Pade(i))]);
end

end
