%Casey Nolte
%CHME 312, February 25th, 2021

%Parameters
mu0 = 60;
mu1 = 57; 
n = 20;
variance = 9;
Xbar = 58.7;
alpha = .05;

% a)
criticalValueLeft= norminv(.05);
z_Test = z_Tester(Xbar, 60, sqrt(variance), 20);
reject = (z_Test < criticalValueLeft);
disp(['The null hypothesis of mean = 60 on a left hand test'... 
    ' and n=20 at alpha = .05 is rejected: ', mat2str(reject) , '.']);

% b) 
power = sampsizepwr('z',[mu0, 3],mu1,[],20,'Tail', 'Left');
disp(['The test power is ', num2str(power) , '.']);

% c) 
% Method 1, does NOT require creating a distribution from given parameters
criticalLeft = norminv(.025);
criticalRight = norminv(.975);
reject = ~(z_Test > criticalLeft & z_Test < criticalRight);
disp(['The null hypothesis for two sided test of mu=60 is rejected: ', mat2str(reject) , '.']);

% d) 
criticalValueLeft= z_Tester(57, 60, sqrt(variance), 5);
z_Test = z_Tester(Xbar, 60, sqrt(variance), 5);
reject = (z_Test < criticalValueLeft);
disp(['The null hypothesis of mean = 60 on a left hand test'... 
    ' and n=5 at alpha = .05 is rejected: ', mat2str(reject) , '.']);

% e) 
reject5to30 = [];
for i = 5:30 
    criticalValueLeft= norminv(.05);
    z_Test = z_Tester(Xbar, 60, sqrt(variance), i);
    reject5to30(i-4) = (z_Test < criticalValueLeft);
end
disp(reject5to30)


