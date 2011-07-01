function H = setupHamiltonian(n, dimensions)

    if (dimensions < 1 || dimensions > 3)
        H = 'Error: Dimensions dont make sense'
        return;
    end
    
    if (dimensions == 1)
        H = setupH1(n);
    elseif (dimensions == 2)
        H = setupH2(n);
    elseif (dimensions == 3)
        H = setupH3(n);
    end

    %For this to work you must set the effective mass as 'm'
    %and you must set the step-size 'a'. However!
    %Both hbar and k can be ignored for now as it can be treated
    %as a universal scaling factor to be used at the end.
    %hbar = (6.626068e-34)/(2* pi);
    %k = -((hbar^2)/2*m*a^2); 

 
end