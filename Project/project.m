%Casey Nolte
%project.m

%% Import Data
TempHumidData = readtable('CHME312_Project 10_2_data.xlsx', 'Sheet', 'Historical Data');
MonthData = readtable('CHME312_Project 10_2_data.xlsx', 'Sheet', '2021 Data');

%% Plotting and Regression
close all

%Humidity
figure('Name','X1 vs Ethanol Price');
hold on
scatter(TempHumidData.X1, TempHumidData.EthanolPrice___gal_)
xlabel('Humidity')
ylabel('Ethanol Price')
title('Humidity Effect on Ethanol Price')
[p1, s1] = polyfit(TempHumidData.X1,TempHumidData.EthanolPrice___gal_,1);
[p2, s2] = polyfit(TempHumidData.X1,TempHumidData.EthanolPrice___gal_,2);
domain = linspace(.15,.65);
y1 = polyval(p1,domain);
y2 = polyval(p2,domain);
plot(domain, y1)
plot(domain, y2)
legend('Data', 'First Order', 'Second Order')
r2order1 = 1 - (s1.normr/norm(y1 - mean(y1)))^2;
r2order2 = 1 - (s2.normr/norm(y2 - mean(y2)))^2;

%Temperature
figure('Name','X2 vs Ethanol Price');
hold on
scatter(TempHumidData.X2, TempHumidData.EthanolPrice___gal_)
xlabel('Temperature')
ylabel('Ethanol Price')
title('Temperature Effect on Ethanol Price')
[p1, s1] = polyfit(TempHumidData.X2,TempHumidData.EthanolPrice___gal_,1);
[p2, s2] = polyfit(TempHumidData.X2,TempHumidData.EthanolPrice___gal_,2);
domain = linspace(2.4,3.8);
y1 = polyval(p1,domain);
y2 = polyval(p2,domain);
plot(domain, y1)
plot(domain, y2)
legend('Data', 'First Order', 'Second Order')
r2order1 = 1 - (s1.normr/norm(y1 - mean(y1)))^2;
r2order2 = 1 - (s2.normr/norm(y2 - mean(y2)))^2;



%% Predicting
monthlyPrices = polyval(p2, MonthData.X2)';

%% Optimization
minimumSales = [275 280 300 265 300 310 320 340 270 280 195 300];
maximumSales = [300 300 340 290 340 340 350 380 320 320 220 275];
avgSales = [287.5 290 320 277.5 320 325 335 360 295 300 207.5 287.5];

%Max Profit Graph
maxProfit = [2498.592741, 2343.659407, 2199.67995, 2115.645253, 2036.001569, 1963.028754];
figure('Name','Max Profit vs Storage Price');
plot(maxProfit,'-o')
xlabel('Storage Price, $/month')
ylabel('Profit, $MM')
set(gca,'XTickLabel',[0 .05 .1 .15 .2 .25 .3 .35 .4 .45 .5])
title('Maximum Profit as a Function of Storage Price')

%Farmer 1 purchases
farmer1 = [0 121.4285714 128.5714286;
    25 121.4285714 103.5714286;
    87.5 121.4285714 41.07142857;
    107.1428571 121.4285714 21.42857143;
    107.1428571 121.4285714 21.42857143;];
figure('Name','Purchases from Farmer 1 vs Storage Price');
plot(farmer1', '-o');
title('Purchases from Farmer 1 vs Storage Price');
xlabel('Month')
ylabel('MM Bushels Purchased')
xticks([1 2 3])
xticklabels({'Febrauary' 'March' 'April'})
legend('$0.1', '$0.2', '$0.3', '$0.4', '$0.5')

%Farmer 2 purchases
farmer2 = [0 0 108 492 0;
    0 0 136 464 0;
    0 70 136 136 258;
    0 92 136 136 236;
    0 92 136 136 236;];
figure('Name','Purchases from Farmer 2 vs Storage Price');
plot(farmer2', '-o');title('Purchases from Farmer 2 vs Storage Price');
xlabel('Month')
ylabel('MM Bushels Purchased')
xticks([1 2 3 4 5])
xticklabels({'March' 'April' 'May' 'June' 'July'})
legend('$0.1', '$0.2', '$0.3', '$0.4', '$0.5')

%Farmer 3 purchases
farmer3 = [0 0 300;
    0 0 300;
    0 0 300;
    0 0 300;
    0 0 300;];
figure('Name','Purchases from Farmer 3 vs Storage Price');
plot(farmer3', '-o');
title('Purchases from Farmer 3 vs Storage Price');
xlabel('Month')
ylabel('MM Bushels Purchased')
xticks([1 2 3])
xticklabels({'June' 'July' 'August'})
legend('$0.1', '$0.2', '$0.3', '$0.4', '$0.5')











