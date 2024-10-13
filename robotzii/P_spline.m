function y_interp = P_spline (coef, x, x_interp)
	% si(x)   = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3, i = 0 : n - 1
	% coef = [a0, b0, c0, d0, a1, b1, c1, d1, ..., an-1, bn-1, cn-1, dn-1]
	% x = [x0, x1, ..., xn]
	% y_interp(i) = P_spline(x_interp(i)), i = 0 : length(x_interp) - 1
	% Be careful! Indexes in Matlab start from 1, not 0

	% TODO: Calculate y_interp using the Spline coefficients
  y_interp = zeros(length(x_interp), 1);
  for i=1:length(x_interp)
    index = 1
    while x_interp(i) > x(index)
      index = index + 1;
    endwhile
    if (index > 1)
      index = index -1;
    endif
    %am calculat din ce interval face parte x ul curent pt a dtermina ce spline aplicam
    %determinam coeficientii corespunzatori spline ului
    a = coef(4*(index-1) +1);
    b = coef(4*(index-1) +2);
    c = coef(4*(index-1) +3);
    d = coef(4*(index-1) +4);
    %determinam argumentul ce va fi ridicat la putere si inmultit cu coeficientii
    crt = x_interp(i) - x(index);
    y_interp(i) = a + b*crt + c*crt^2 + d*crt^3; %calculam y_interp corespunzator lui x
  endfor
end
