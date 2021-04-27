function dydx = bvpfcn(x,y)
dydx = zeros(2,1);
dydx = [y(2), .04*y(1)*exp((16*(1-y(1)))/(1+.8*(1-y(1))))];
end

