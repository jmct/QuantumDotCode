cube = [2,10,10,10,30,30,30];
shapes = {cube};
K = setupK3(50);

fileID = fopen(Cube.csv);
temp = 0;

for i = 1:100
    V = calcVPotential(shapes,(i-1)*100, 50, 1000);
    H = K + V;
	eigsAns = eigs(H);
	temp = eigsAns(1) - eigsAns(2);
	fprintf(fileID,'%d,%f\n', (i-1)*100, temp);
	i
end

fclose(fileID);