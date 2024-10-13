function reduced_mat = preprocess(mat, min_reviews)
  # TODO: Remove all user rows from `mat` that have strictly less then `min_reviews` reviews.
  [n, m] = size(mat); %det dimensiunile matricei
  i = 1;
  while i <= n
    count = nnz(mat(i,:)); %det nr de elemente diferite de zero din randul curent (clientul curent)
    if count < min_reviews
      mat(i, :) = []; %stergem randul daca nr de note date este mai mic decat cel minim admis
      n = n -1; %updatam si dimensiunea matricei actuale (nu se modifica i, pt a nu sari urm rand)
    else
      i = i + 1; %putem trecem la urm valoare a lui i, fara sa sarim vreun rand daca nu stergem randul
    endif
  endwhile
  reduced_mat = mat;
end
