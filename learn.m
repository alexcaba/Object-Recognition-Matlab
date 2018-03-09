function w = learn (X, t)

% Am calculat w cu ajutorul algoritmului QR dupa
% care am rezolvat un sistem superior triunghiular.
[m n] = size(X);
X2 = X;
X2(:, n+1) = 1;
A = X2' * X2;
[Q R] = Gram_Schmidt(A);
B = Q' * X2' * t;
w = SST(R, B);

endfunction