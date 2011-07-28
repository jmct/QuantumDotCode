cube = [2,10,10,10,30,30,30];
shapes = {cube};
K = setupK3(50);
V = calcV(shapes, 50, 100);
H = K + V;

tic
eigsAns = eigs(H, 20, 'SM');
toc