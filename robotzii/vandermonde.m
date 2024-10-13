function coef = vandermonde(x, y)
    % x = [x0, x1, ..., xn]'
    % y = [y0, y1, ..., yn]'
    % coef = [a0, a1, a2, ..., an]'

    % TODO: Calculate the Vandermonde coefficients
    n = length(y); %det nr de puncte
    A = zeros(n, n); %intializez matricea cu ajutorul careia rezolvam sistemul pt det coeficientilor
    A(1:n, 1) = 1; %populez prima coloana cu 1
    for i=1:n
      for j=2:n
        A(i,j) = x(i)^(j-1); %populez pe linii matricea A, astfel incat sa obtin pe linia i, puterile progresive ale lui x(i)
      endfor
    endfor
    %rezolv sistemul
    Y = inv(A);
    coef = Y * y;
endfunction
