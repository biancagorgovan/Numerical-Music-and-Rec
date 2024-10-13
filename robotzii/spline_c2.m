function coef = spline_c2 (x, y)
	% Remember that the indexes in Matlab start from 1, not 0

	% si(x)   = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3
	% si'(x)  =      bi         + 2ci(x - xi)  + 3di(x - xi)^2
	% si''(x) =                   2ci          + 6di(x - xi)
   n = length(x)-1; % Number of intervals
   A = zeros(4*n, 4*n);
   b = zeros(4*n, 1);
   %am determinat din ecuatiile date ce valori si unde trebuiesc salvate in A
	% TOOD 1: si(xi) = yi, i = 0 : n - 1
  for i=1:n
    b(i) = y(i); %primele n valori din b corespund cu cele din y
    A(i, 4*(i-1) +1) = 1; %are coef doar ai
  endfor
	% TODO 2: s_n-1(xn) = yn
  crt = x(n+1) - x(n);
  b(n+1) = y(n+1); % si a n+1 -a val din b corespunde cu cea din y
  index = 4*(n -1) +1;
  A(n+1, index:(index + 3))= [1, crt, crt^2, crt^3]; %au coef an, bn, cn ,dn
	% TODO 3: si(x_i+1) = s_i+1(x_i+1), i = 0 : n - 1
  for i=1:n-1
    crt = x(i+1) - x(i);
    rand = n+1+i;
    coloana = 4*(i-1) +1;
    A(rand, coloana:(coloana + 4)) = [1, crt, crt^2, crt^3, -1];
  endfor
	% TODO 4: si'(x_i+1) = s_i+1'(x_i+1), i = 0 : n - 1
  for i=1:n-1
    crt = x(i+1) - x(i);
    rand = 2*n + i;
    coloana = 4*(i-1) +2;
    A(rand, coloana:(coloana +4)) = [1, 2*crt, 3*crt^2, 0, -1];
  endfor
	% TODO 5: si''(x_i+1) = s_i+1''(x_i+1), i = 0 : n - 1
  for i=1:n-1
    crt = x(i+1) - x(i);
    rand = 3*n + i;
    coloana = 4*(i-1) + 3;
    A(rand, coloana:(coloana+4)) =[2, 6*crt, 0, 0, -2];
  endfor
	% TODO 6: s0''(x0) = 0
  A(4*n -1, 3) = 2; %penultima ecuatie, doar c0 are coeficient
	% TODO 7: s_n-1''(x_n) = 0
  crt = x(n+1) - x(n);
  A(4*n, 4*n -1) = 2; %din ultima ecuatie au coeficienti doar cn si dn
  A(4*n, 4*n) = 6*crt;
	% Solve the system of equations
  Y = inv(A);
  coef = Y * b;
end
