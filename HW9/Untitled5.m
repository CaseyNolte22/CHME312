error = 9999; %arbitrarily large
h = .01; %step size for shooting corrections
x = 0; % initial guess for dT/Dx(0)


while error > .001
    [t,y] = ode45(@MyFunc,[0 1],[200,x]);
    cCalc = y(end,1);
    cExact = 100;
    error = cCalc - cExact;
    
    if error > 0
        x = x - h;
    end
    
    if error < 0
        x = x + h;
    end
end

plot(t, y(:,1))
xlabel('X0 to X1')
ylabel('Temperature')
    
