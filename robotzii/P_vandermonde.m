function y_interp = P_vandermonde (coef, x_interp)
	% P_vandermonde(x) = a0 + a1 * x + a2 * x^2 + ... + an * x^n
	% coef = [a0, a1, a2, ..., an]'
	% y_interp(i) = P_vandermonde(x_interp(i)), i = 0 : length(x_interp) - 1

	% TODO: Calcualte y_interp using the Vandermonde coefficients
  for i=1:length(x_interp)
    y_interp(i) = 0; %intializez y_interp curent
    for j=1:length(coef)
      y_interp(i) = y_interp(i) + coef(j)*x_interp(i)^(j-1); %valoarea lui Y_interp se face prin adunarea tuturor produselor dintre coef j cu puterea (j-1) a lui x
    endfor
  endfor
end
