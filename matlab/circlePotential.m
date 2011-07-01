function V = circlePotential(n, radius)
    center = (n+1)/2;
    
    V = zeros(n^2);
    dist = realmax;
    
    for i = 1:n
        for j = 1:n
            dist = sqrt((abs(i-center)^2)+(abs(j-center))^2);
            if (dist <= radius)
                V((i+j)-1,(i+j)-1) = 0; %this is wrong the indeces of V
                   %do not accurately reflect the values they should.
                   %example: (2,1) of the sample square should be V(11,11)
                   %but do to my stupid math it is currently re-writing
                   %V(2,2). So the results are all wrong. 
                   %Need to write a translator from the sample square
                   %coordinates to proper matrix indeces. 
            else
                V((i+j)-1,(i+j)-1) = realmax;
            end
        end
    end
end