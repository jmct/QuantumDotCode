L = 1;
frac = .8;

iterations = 15;
results = zeros(10,iterations);
N = zeros(1, iterations);

for i = 1:iterations
    N(i) = ((5+(i-1))*5)+1;
    
end
for i = 1:iterations
M = 1+frac*(N(i) - 1);
H = (((M-1)/(frac*L))^2) * setupK3(M);
dif = eigs(H, 2, 'SM');
results(:,i) = [N, dif']
end

dlmwrite('manyEigenvalues.csv', results);
