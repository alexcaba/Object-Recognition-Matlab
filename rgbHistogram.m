function [v] = rgbHistogram(image, count)
  %Am citit imaginea si am initializat un vector de 3*count intervale
  A = imread(image);
  [m n o] = size(A);
  v = zeros(1, 3*count);

  %pentru fiecare i adaug in v suma elemetelor din intervalul corespunzator
  for i = 1 : count
    v(i) = sum(sum(A(:, :, 1) >= (i * 256 / count - 256 / count) & A(:, :, 1) < (i * 256 / count)));
    v(count + i) = sum(sum(A(:, :, 2) >= (i * 256 / count - 256 / count) & A(:, :, 2) < (i * 256 / count)));
    v(2 * count + i) = sum(sum(A(:, :, 3) >= (i * 256 / count - 256 / count) & A(:, :, 3) < (i * 256 / count)));
  endfor

  endfunction  