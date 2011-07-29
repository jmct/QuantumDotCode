cube = [2,3,3,3,19,19,19];
shapes = {cube};
K = setupK3(25);

fileID = fopen('/usr/jmc512/QuantumDotCode/sparseMatlab/cubeTest8.csv', 'a');
temp = 0;
cubeTest7 = zeros(300,4);

for i = 1:500
    V = calcVPotential(shapes,i, 25, 1000);
    H = K + V;
    tic
    eigsAns = eigs(H,2,'SM');
    toc
    temp = eigsAns(1) - eigsAns(2);
    fprintf(fileID,'%f,%f,%d,%f\n',eigsAns(1), eigsAns(2), i, temp);
    cubeTest7(i,:) = [eigsAns(1),eigsAns(2), i*.1,temp];
    i
end

fclose(fileID);

figure, close

plot(cubeTest7(:,3),cubeTest7(:,1));
saveas(gcf, 'cubeTest8', 'png');

