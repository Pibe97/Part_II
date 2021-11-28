%Q7 script
n=100;
theta=5;
X=theta*rand(n,1);
%%
%histogram for sigma(T;F_hat) and calculation of sigma(T;F)
B=1000;
T=zeros(B,1);
%Calculate sigma(T;F):
sTF=theta*sqrt(n/((n+1)^2*(n+2)))
%Calculate sigma(T;F_hat):
for alpha=1:B
    Y=zeros(n,1);
    for i=1:n
        k=randi([1 n],1,1);
        Y(i)=X(k);
    end
    T(alpha)=max(Y);
    Y=sort(Y);
    ET2=0;
    ET=0;
    for j=1:n
        ET2=ET2+Y(j)^2*(j^n -(j-1)^n)/(n^n);
        ET=ET+Y(j)*(j^n -(j-1)^n)/(n^n);
    end
    sTFhat(alpha)=sqrt(ET2-(ET)^2);
end
Tbar=mean(T);
sigma_B=sqrt(norm(T-Tbar)^2/(B-1))
histogram(sTFhat)
xlabel('$\sigma(T;\hat{F})$','Interpreter','latex')
ylabel('Frequency')
title(['$\sigma(T;\hat{F})$ for ' num2str(n) ' samples and B=' num2str(B)], 'Interpreter','latex')
grid on
%%
%histogram for sigma_B
B=200;
T=zeros(B,1);
for beta=1:200
    for alpha=1:B
        Y=zeros(n,1);
        for i=1:n
            k=randi([1 n],1,1);
            Y(i)=X(k);
        end
        T(alpha)=max(Y);
    end
    Tbar=mean(T);
    sigma_B(beta)=sqrt(norm(T-Tbar)^2/(B-1));
end
histogram(sigma_B)
grid on
xlabel('$\hat{\sigma}_{B}$','Interpreter', 'latex');
ylabel('Frequency')
title(['200 realisations of $\hat{\sigma}_{B}$ for n=' num2str(n) ' and B=' num2str(B)] ,'Interpreter', 'latex')