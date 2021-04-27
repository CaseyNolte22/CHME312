function [F] = RxnFunc(c,param)
% Input: 
%   c - 4x1 vector of concentrations
%      1. cA (M)
%      2. cB (M)
%      3. cC (M)
%      4. cD (M)
%   param - 7x1 vector of parameter values 
%      1. residence time, t (s)
%      2. k1 (1/M*hr)
%      3. k2 (1/M*hr)
%      4. cAo (M)
%      5. cBo (M)
%      6. cCo (M)
%      7. cDo (M)
%
% Output: 4x1 function vector
%      1. (cAo-cA)/t - k1*cA*cB
%      2. (cBo-cB)/t - k1*cA*cB - k2*cB*cC
%      3. (cCo-cC)/t + k1*cA*cB - k2*cB*cC
%      4. (cDo-cD)/t + k2*cB*cC
%
F = zeros(4,1);
F(1) = (param(4)-c(1))/param(1) - param(2)*c(1)*c(2);
F(2) = (param(5)-c(2))/param(1) - param(2)*c(1)*c(2) ...
        - param(3)*c(2)*c(3);
F(3) = (param(6)-c(3))/param(1) + param(2)*c(1)*c(2) ...
        - param(3)*c(2)*c(3);
F(4) = (param(7)-c(4))/param(1) + param(3)*c(2)*c(3);