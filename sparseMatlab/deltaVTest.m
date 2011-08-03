L = 1;
iterations = 5;
results = zeros(1,iterations*2);

shapes = {[2,10,10,10,80,80,80]};


fileName = sprintf('/usr/jmc512/QuantumDotCode/log/deltaV_N26-46.csv', ...
						n,vMax,elecFieldMin, elecFieldMax);
                    
fileID = fopen(fileName, 'w');
    
    
for i = 1:iterations
    N = ((5+(i-1))*5)+1;
    K = (((N-1)/L)^2) * setupK3(M);
    V = calcV(shapes, N, 2000)*(L/(N-1));
    H = K+V;
    diff = eigs(H,2,'SM');
    results(:,i) = diff(1) - diff(2);
    fprintf(fileID, '%f,%f,%f\n', diff(1), diff(2), diff(1)-diff(2));
end

plot(1:iterations,results(1,:));

saveas(gcf,'deltaV_N26-46','fig');