cube = [2,10,10,10,30,30,30];
shapes = {cube};
K = setupK3(50);

fileID = fopen('/usr/jmc512/QuantumDotCode/sparseMatlab/cubeTest1.csv', 'a');
temp = 0;

for i = 1:100
    V = calcVPotential(shapes,i*100, 50, 1000);
    H = K + V;
    tic
    eigsAns = eigs(H,2,'SM');
    toc
    temp = eigsAns(1) - eigsAns(2);
    fprintf(fileID,'%d,%f\n', i*100, temp);
    i
end

fclose(fileID);
