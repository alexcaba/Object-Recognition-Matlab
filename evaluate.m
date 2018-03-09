function procent = evaluate(path, w, tip, count)
  
  A = getImgNames(path); %citesc numele imaginilor
  [m n] = size(A);
  B = "not_cats";
  B = findstr(path, B); %caut in ce director ma aflu
  B = size(B);
  
  
  if(B(1) == 0 && B(2) == 0)
      folder_pisici = 1; %variabila pentru director cats/not_cats
  endif
  if(B(1) != 0 && B(2) != 0)
      folder_pisici = 0;
  endif
  
  nr = 0; %nr de poze recunoscute
  
  if(tip == 'RGB')
    for i = 1 : m
      B = strcat(path, A(i, :));
      x = rgbHistogram(B, count); %constructie feature vector pt RGB
      x(1, 3*count+1) = 1;
      y = w' * x'; %calcul y
      
      %numarare imagine identificata
      if(folder_pisici == 1 && y >= 0)
        nr = nr + 1;
      endif
      
      if(folder_pisici == 0 && y < 0)
        nr = nr + 1;
      endif
      
    endfor
  endif
  
  if(tip == 'HSV')
    for i = 1 : m
      B = strcat(path, A(i, :));
      x = hsvHistogram(B, count);    %constructie feature vector pt HSV
      x(1, 3*count+1) = 1;
      y = w' * x';    %calcul y
      
      %numarare imagine identificata
      if(folder_pisici == 1 && y >= 0)
        nr = nr + 1;
      endif
      
      if(folder_pisici == 0 && y < 0)
        nr = nr + 1;
      endif
      
    endfor
  endif
  
  procent = nr / i * 100;   %calcul procent
  
endfunction