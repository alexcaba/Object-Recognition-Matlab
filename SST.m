%algoritm de rezolvare sistem Ax=b, unde A este matrice superior triunghiulara
function [x] = SST(A, b)
  [n n] = size(A);
  x = zeros(1, n);
  for i = n: -1: 1
    x(i) = (b(i) - A(i, i+1:n) * x'(i+1:n)) / A(i, i);
  endfor
  x = x';
endfunction