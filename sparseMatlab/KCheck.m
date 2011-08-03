L = 1;
frac = .8;
results = zeros(1,15);
for i = 1:15
N = ((5+(i-1))*5)+1;
M = 1+frac*(N - 1);
H = (((M-1)/(frac*L))^2) * setupK3(M);
dif = eigs(H, 2, 'SM');
results(:,i) = dif(1)  - dif(2);
i
end

plot(1:15, results);