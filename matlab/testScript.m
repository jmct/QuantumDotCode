cube = [2,2,2,2,7,7,7];
shapes = {cube};
H = setupH3(10);
V = calcVFull(shapes, 10);
energyMat = -1*H + V;
eigAns = eig(energyMat);