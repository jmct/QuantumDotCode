n = 100;
H1 = setHamiltonian(n, 2);
H2 = setHamiltonian(n, 2);
I1 = eye(n);
I2 = eye(n);

% So this is where I am a bit hazy right now...
%The tensor product of the Hamiltonian and the 
%identity matrix is definitely an intermediate step
%However, all the reference material I see shows that
%the ordering for the tensor product depends on which
%dimension it is:
% H1 x I1 for the X dimension and
% I2 x H2 for the Y dimention
%My issue is that I have no idea why this is the case...


X = kron(H1,I1);
Y = kron(I2,H2);

