function H = setupH2(n)
    H1 = setCoefficient(n, -2);
    I1 = eye(n);

    H = zeros(n^2);
    
    temp = kron(H1,I1);
    H = temp + kron(I1,H1);

end