x = [6 9 11 13 22 26 28 33 35];
y = [68 67 78 88 80 55 28 35 8];

domain = linspace(6,35);

[p1, s1] = polyfit(x,y,1);
[p2, s2] = polyfit(x,y,2);
[p3, s3] = polyfit(x,y,3);

y1 = polyval(p1,domain);
y2 = polyval(p2,domain);
y3 = polyval(p3,domain);
 
hold on
plot(x,y, 'o')
plot(domain,y1)
plot(domain,y2, '--')
plot(domain,y3, '-.')
legend('data', 'first order', 'second order', 'third order');
xlabel('Deformation');
ylabel('Brinell Hardness');
hold off

r2order1 = 1 - (s1.normr/norm(y - mean(y)))^2
r2order2 = 1 - (s2.normr/norm(y - mean(y)))^2
r2order3 =1 - (s3.normr/norm(y - mean(y)))^2