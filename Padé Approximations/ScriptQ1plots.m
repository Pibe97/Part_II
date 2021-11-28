hold on
grid on
xlabel('N')
ylabel('Absolute error')
title('Absolute error')
for j=1:100
    [s,C]=Q1(j);
    plot(j,abs(sqrt(2)-s),'b.')
end
