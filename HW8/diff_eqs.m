function dy = diff_eqs(t,y)
dy = zeros(5,1);

dy(1) = -5*y(1) +.01*y(5);
dy(2) = 5*y(1) - 15*y(2);
dy(3) = 5*y(1) - .5*y(4)*y(3);
dy(4) = 15*y(2) - .5*y(4)*y(3);
dy(5) = .5*y(4)*y(3) - .01*y(5);