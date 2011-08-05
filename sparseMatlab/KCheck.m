L = 1;
frac = .8;

iterations = 15;
results = zeros(1,iterations);
N = zeros(1, iterations);

for i = 1:iterations
    N(i) = ((5+(i-1))*5)+1;
    
end
for i = 1:iterations
M = 1+frac*(N(i) - 1);
H = (((M-1)/(frac*L))^2) * setupK3(M-2);
dif = eigs(H, 2, 'SM');
results(:,i) = dif(1)  - dif(2);
i
end

figure, close


plot(N, results);
saveas(gcf, 'M-2Matrix', 'png');
figure, close
