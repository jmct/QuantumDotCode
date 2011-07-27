sphere1 = [1,5,5,5,2.5];
shapes = {sphere1};
H = setupH3(10);
V = calcVFull(shapes, 10);
energyMat = H + V;
eigAns = eig(energyMat);