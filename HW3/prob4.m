%Casey Nolte
%CHME 312, February 25th, 2021

%Creating array of results
results(1:4) = 68;
results(5:14) = 69;
results(15:31) = 70;
results(32:68) = 71;
results(69:77) = 72;
results(78:85) = 73;
results(86:90) = 74;
resultsmean = mean(results);
resultsstd = std(results, 1);

%Testing for normaility with chi2gof
reject = (chi2gof(results));
disp(['The null hypothesis is rejected: (0-false, 1-true)', mat2str(reject) , '.']);



%Binning is <69, 70, 71, 72, >73. This is the same process as doing it by
%hand. Much more mork than chi2gof
freq = [69, 70, 71, 72, 73; ...
    14, 17, 37, 9, 13]';
freq(:,3) = (freq(:,1)-resultsmean)./(resultsstd);
freq(:,4) = normcdf(freq(:,3));

freq(1,5) = (size(results,2)*(freq(1,4)));
for i = 2:size(freq,1) 
   freq(i,5) = (size(results,2)*(freq(i,4)-freq(i-1,4)));
end

freq(:,6) = ((freq(:,2)-freq(:,5)).^2)./(freq(:,5))
chisquared = sum(freq(:,6))
critical = chi2inv(.95,2);

reject = (chisquared > critical);
disp(['The null hypothesis is rejected: ', mat2str(reject) , '.']);



