%error comparison
hold on
grid on
minerror=1;
for j=1:100
    [s,C]=Q1(j);
    plot(j,abs(sqrt(2)-s),'b.');
    minerror=min(minerror,abs(sqrt(2)-s));
end
axis([0,100,0,0.09]);
format long
minerror
xlabel('N')
ylabel('Absolute error')
title('Absolute error')
