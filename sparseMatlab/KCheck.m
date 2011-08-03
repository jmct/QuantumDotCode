L = 1;
frac = .8;
results = zeros(1,10);
for i = 1:10
N = ((5+(i-1))*5)+1;
M = 1+frac*(N - 1);
H = (((M-1)/(frac*L))^2) * setupK3(M);
dif = eigs(H, 2, 'SM');
results(:,i) = dif(1)  - dif(2);
end

plot(1:10, results);