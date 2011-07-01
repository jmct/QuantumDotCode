function H = setupHamiltonian(n, dimensions)

    if (dimensions < 1 || dimensions > 2)
        H = 'Error: Dimensions dont make sense'
        return;
    end

    %For this to work you must set the effective mass as 'm'
    %and you must set the step-size 'a'
    
    
    %Both hbar and k can be ignored for now as it can be treated
    %as a universal scaling factor to be used at the end.
    %hbar = (6.626068e-34)/(2* pi);
    %k = -((hbar^2)/2*m*a^2); 

    %Coefficient and Identity Matrices for each Dimentions
    H1 = setCoefficient(n, -2);
    I1 = eye(n);

    % So this is where I am a bit hazy right now...
    %The tensor product of the Hamiltonian and the 
    %identity matrix is definitely an intermediate step
    %However, all the reference material I see shows that
    %the ordering for the tensor product depends on which
    %dimension it is:
    % H1 x I1 for the X dimension and
    % I2 x H2 for the Y dimention
    %My issue is that I have no idea why this is the case...
    
    if (dimensions == 1)
        H = H1;
        return;
    end
        
    temp = cell(1,dimensions);
    H = zeros(n^dimensions);
    
    for i = 1:dimensions
        temp{i} = zeros(n^dimensions);
    end
    
    temp{1} = kron(H1,I1);
    temp{2} = kron(I1,H1);

    for i = 1:size(temp,2)
        H = H + temp{i};
    end
    
end