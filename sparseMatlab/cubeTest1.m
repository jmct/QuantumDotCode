cube = [2,3,3,3,19,19,19];
shapes = {cube};
K = setupK3(25);

fileID = fopen('/usr/jmc512/QuantumDotCode/sparseMatlab/cubeTest3.csv', 'a');
temp = 0;

for i = 1:100
    V = calcVPotential(shapes,i*10, 25, 1000);
    H = K + V;
    tic
    eigsAns = eigs(H,2,'SM');
    toc
    temp = eigsAns(1) - eigsAns(2);
    fprintf(fileID,'%d,%f\n', i*10, temp);
    i
end

fclose(fileID);
