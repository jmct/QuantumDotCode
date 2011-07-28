sphere1 = [1,25,25,25,20];
shapes = {sphere1};
K = setupK3(50);
V = calcV(shapes, 50, 100);
H = K + V;

tic
eigsAns = eigs(H, 2, 'SM');
toc