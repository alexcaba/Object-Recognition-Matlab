function [X t] = preprocess(path, tip, count)

  A = getImgNames(path);   % numele imaginilor
  [m n] = size(A);
  X = zeros(m, 3*count);
  
  % pentru fiecare tip :RGB/HSV am adaugat in X feature vectorul corespunzator
  if(tip == 'RGB')   
    for i = 1 : m
      B = strcat(path, A(i, :));
      X(i, :) = rgbHistogram(B, count);
    endfor
  endif
  
  if(tip == 'HSV')
    for i = 1 : m
      B = strcat(path, A(i, :));
      X(i, :) = hsvHistogram(B, count);
    endfor
  endif
  
  %am verificat in ce director ma aflu: cats/not_cats si am completat t
  B = "not_cats";
  B = findstr(path, B);
  B = size(B);
  
  if(B(1) != 0 && B(2) != 0)
      t = zeros(m, 1);
      t = t-1;
  endif
  if(B(1) == 0 && B(2) == 0)
      t = ones(m, 1);
  endif

endfunction