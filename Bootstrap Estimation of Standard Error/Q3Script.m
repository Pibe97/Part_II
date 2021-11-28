m=300;
B=250;    
sigmaB=zeros(m,1);
for p=1:m
    %Modified copy of Q2Script 
    X=readmatrix('2-10-3-2016.csv'); %read the data
    T=zeros(B,1);
    for i=1:B
        Xb=zeros(120,2);
        for j=1:length(X(:,1))
            k=randi([1 120],1,1);
            Xb(j,1)=X(k,1);
            Xb(j,2)=X(k,2);
        end
        Ybar=mean(Xb(:,1));
        Zbar=mean(Xb(:,2));
        num=transpose(Xb(:,1)-Ybar)*(Xb(:,2)-Zbar);
        den=norm(Xb(:,1)-Ybar)*norm(Xb(:,2)-Zbar);
        r=num/den;
        T(i)=0.5*log((1+r)/(1-r));    
    end
    Tbar=mean(T);
    sigmaB(p,1)=sqrt((norm(T-Tbar)^2)/(B-1));
end
histogram(sigmaB,20)
grid on
xlabel('$\hat{\sigma}_{B}$','Interpreter', 'latex')
ylabel('Frequency','Interpreter','latex')
title(['Histogram of ' '$\hat{\sigma}_{B}$' ' for B=' num2str(B) ' and m=' num2str(m) ' evaluations'],'Interpreter','latex')