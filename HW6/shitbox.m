%% CSTRexample.m
% This script solves for the steady state concentrations in a CSTR with 
% reactions of the form:
% 
%      A + B --> C and B + C --> D
%
% Kyle Bishop, 2/4/2013

%% Parameters
t = 100;     % residence time (hr)
k1 = 1;    % rate constant (1/M*hr)
k2 = 1;    % rate constant (1/M*hr)
cA0 = 1; % M
cB0 = 2; % M
cC0 = 0;   % M
cD0 = 0;   % M
param = [t,k1,k2,cA0,cB0,cC0,cD0]';

%% Initial Guess
c0 = [cA0,cB0,cC0,cD0]'; 

%% Solve
options = optimset('Display','off','TolX',1e-6); % Options
c = fsolve(@RxnFunc,c0,options,param)

