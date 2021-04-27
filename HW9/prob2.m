xmesh = linspace(0,1,5);
solinit = bvpinit(xmesh, @guess);

sol = bvp4c(@bvpfcn, @bcfcn, solinit);

plot(sol.x, sol.y, '-o')

legend('c','dc/dx')
