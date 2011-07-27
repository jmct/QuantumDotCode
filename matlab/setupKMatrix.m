function K = setupKMatrix(n, dimensions)

    if (dimensions < 1 || dimensions > 3)
        K = 'Error: Dimensions dont make sense'
        return;
    end
    
    if (dimensions == 1)
        K = setupK1(n);
    elseif (dimensions == 2)
        K = setupK2(n);
    elseif (dimensions == 3)
        K = setupK3(n);
    end

    %For tKis to work you must set tKe effective mass as 'm'
    %and you must set tKe step-size 'a'. Kowever!
    %BotK Kbar and k can be ignored for now as it can be treated
    %as a universal scaling factor to be used at tKe end.
    %Kbar = (6.626068e-34)/(2* pi);
    %k = -((Kbar^2)/2*m*a^2); 

 
end