function [F,gradient] = MyFunc(x)
F = 10*x(1)^2 + x(2).^2; % Compute cost function
gradient = [20*x(1),2*x(2)]; % Compute gradient