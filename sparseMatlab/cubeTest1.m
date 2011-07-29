cube = [2,3,3,3,19,19,19];
shapes = {cube};
K = setupK3(25);

fileID = fopen('/usr/jmc512/QuantumDotCode/sparseMatlab/cubeTest5.csv', 'a');
temp = 0;

for i = 1:100
    V = calcVPotential(shapes,i*.04, 25, 1000);
    H = K + V;
    tic
    eigsAns = eigs(H,2,'SM');
    toc
    temp = eigsAns(1) - eigsAns(2);
    fprintf(fileID,'%f,%f,%d,%f\n',eigsAns(1), eigsAns(2), i*.04, temp);
    i
end

fclose(fileID);
