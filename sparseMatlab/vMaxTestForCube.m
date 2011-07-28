cubeResults = zeros(20,100);
cube = [2,10,10,10,30,30,30];
shapes = {cube};
K = setupK3(50);



for i = 1:100
    V = calcV(shapes, 50, i*10);
    H = K + V;
    cubeResults(:,i) = eigs(H, 20, 'SM');
    i
end
