function H = setupH3(n)

    H1 = setCoefficient(n, -2);
    I1 = eye(n);

    H = zeros(n^3);
    
    temp1 = kron(H1,I1);
    temp1 = kron(temp1, I1);
    
    temp2 = kron(I1,H1);
    temp2 = kron(temp2,I1);
    
    temp3 = kron(I1,I1);
    temp3 = kron(temp3, H1);
    
    
    H = temp1 + temp2 + temp3;

end