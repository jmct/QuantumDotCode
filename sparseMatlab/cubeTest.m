L = 1;

iterations = 15;
results = zeros(1,iterations);
N = zeros(1, iterations);

cube = [2,.1,.1,.1,.8,.8,.8];

shapes = {cube};


for i = 1:iterations
    N(i) = ((5+(i-1))*5)+1;
end

for i = 1:iterations
    K = (((N(i)-1)/(L))^2) * setupK3(N(i));
    V = calcVPotential(shapes, 0, N(i), 1000);
    H = K + V;
    dif = eigs(H, 2, 'SM');
    results(:,i) = dif(1)  - dif(2)
    i
end

FileID = fopen('log/cubeTest.csv', 'w');
fprintf(FileID, '%d,%f\n', [N;results]);

fclose(FileID);

