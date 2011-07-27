function H = setupH2(n)
    H1 = setCoefficient(n, 2);
    I1 = eye(n);

    H = zeros(n^2);
    
    temp = tensorProd(H1,I1);
    H = temp + tensorProd(I1,H1);

end