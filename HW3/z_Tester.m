function [z_test] = z_Tester(mean,null,sd,n)
%Calculates a z-test value
%   Given sample mean, null hypothesis mean, standard deviation, and n
    z_test = (mean - null) ./ (sd ./ sqrt(n));
end

