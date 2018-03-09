function [r] = hsvHistogram(image, count)
  
  A = imread(image); 
  [m n o] = size(A);
  
  %initializare variabile si cast la tipul double
  H = zeros(m, n);
  S = zeros(m, n);
  V = zeros(m, n);
  H = cast(H, "double");
  S = cast(S, "double");
  V = cast(V, "double"); 
  
  r = zeros(1, 3*count); %vectorul de consturit
  
  Cmax = zeros(m, n);
  Cmin = zeros(m, n);
  Delta = zeros(m, n);
  Cmax = cast(Cmax, "double");
  Cmin = cast(Cmin, "double");
  Delta = cast(Delta, "double");
  
  R = A(:, :, 1);
  R = cast(R, "double");
  R = R / 255;
  G = A(:, :, 2);
  G = cast(G, "double");
  G = G / 255;
  B = A(:, :, 3);
  B = cast(B, "double");
  B = B / 255;
  
  Cmax = max(R, G);
  Cmax = max(Cmax, B);
  Cmin = min(R, G);
  Cmin = min(Cmin, B);
  Delta = Cmax - Cmin;
  
  %constructie H in functie de Cmax==R/G/B pe toata matricea
  aux = (Cmax == R);
  H = H + aux .* (60 * mod((G - B) ./ Delta, 6));
  aux = (Cmax == G);
  H = H + aux .* (60 * ((B - R) ./ Delta + 2));
  aux = (Cmax == B);
  H = H + aux .* (60 * ((R - G) ./ Delta + 4));
  %conditie speciala cand Cmax==B==G pentru a nu pune elemete in plus in H
  aux = (Cmax == B & Cmax == G); 
  H = H - aux .* (60 * ((B - R) ./ Delta + 2));
  
  aux = (Delta != 0);
  H = aux .* H;
  H = H / 360;
  
  %calcul S si V 
  aux = (Cmax != 0);
  S = aux .* Delta ./ Cmax;
  V = Cmax;
  
  H = H * 100;
  S = S * 100;
  V = V * 100;
  
  %pentru fiecare i adaug in v suma elemetelor din intervalul corespunzator
  for i = 0 : count-1 
    r(i + 1) = sum(sum( H >= (i * 101 / count) & H < (i * 101 / count + 101 / count) ));
    r(count + i + 1) = sum(sum( S >= (i * 101 / count) & S < (i * 101 / count + 101 / count) ));
    r(2 * count + i + 1) = sum(sum( V >= (i * 101 / count) & V < (i * 101 / count + 101 / count) ));
  endfor
  
endfunction
