function V = circlePotential(n, radius)
    center = (n+1)/2;
    
    V = zeros(n^2);
    dist = realmax;
    index = 1;
    
    for i = 1:n
        for j = 1:n
            dist = sqrt((abs(i-center)^2)+(abs(j-center))^2);
            index = coordToIndex(i,j);
            if (dist <= radius)
                V(index,index) = 0; 

            else
                V(index,index) = realmax;
            end
        end
    end
end