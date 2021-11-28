%Q4 Script
%Calculate T from data
X=readmatrix('2-10-3-2016.csv'); %read the data
for i=1:500
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
sigma_hat=std(T);
sigma_b=0.0825;
low=sigma_hat-1.645*sigma_b
high=sigma_hat+1.645*sigma_b