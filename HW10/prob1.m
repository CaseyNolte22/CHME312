A = [-4 1 0 0 0 1 0 0 0 0 0 0 0;
    1 -4 1 0 0 0 1 0 0 0 0 0 0;
    0 1 -4 1 0 0 0 1 0 0 0 0 0;
    0 0 1 -4 1 0 0 0 1 0 0 0 0;
    0 0 0 4/3 -6 0 0 0 0 0 0 0 0;
    1 0 0 0 0 -4 1 0 0 1 0 0 0;
    0 1 0 0 0 1 -4 1 0 0 1 0 0;
    0 0 1 0 0 0 1 -4 1 0 0 1 0;
    0 0 0 1 0 0 0 1 -4 0 0 0 1;
    0 0 0 0 0 1 0 0 0 -4 1 0 0;
    0 0 0 0 0 0 1 0 0 1 -4 1 0;
    0 0 0 0 0 0 0 1 0 0 1 -4 1;
    0 0 0 0 0 0 0 0 0 0 0 4/3 -6;];
b = -ones(13,1)/1^2;
v = A\b;

% In matrix form
x = linspace(0,1,13);
y = linspace(0,2/3,5);
vMat = zeros(7,5);
vMat(2,2) = v(1);
vMat(3,2) = v(2);
vMat(4,2) = v(3);
vMat(5,2) = v(4);
vMat(2,3) = v(5);
vMat(3,3) = v(6);
vMat(2,4) = v(7);

 
% Interpolated
x = linspace(0,1,7);
y = linspace(0,2/3,5);
[X,Y] = meshgrid(x,y);
xi = linspace(0,1,70);
yi = linspace(0,2/3,50);
[XI,YI] = meshgrid(xi,yi);
vMatI = interp2(X,Y,vMat',XI,YI);

surf(XI,YI,vMatI)
xlabel('x','FontSize',14);
ylabel('y','FontSize',14);

figure
contourf(XI,YI,vMatI)
xlabel('x','FontSize',14);
ylabel('y','FontSize',14);
colorbar

