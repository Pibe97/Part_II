B=20000;
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
for i=1:20
    edges(i)=(i-1)*0.05;
end
histogram(T, edges);
grid on
ylabel('Frequency')
xlabel('T(Y_b)')
title(['Histogram of T(Y_b) for B=' num2str(B)]);