function similarity = cosine_similarity(A, B)
  # TODO: Compute the cosine similarity between two column vectors.
  numitor = norm(A) * norm(B); % calculez valoarea numerica de la numitor, data de produsul normelor
  similarity =  A' * B/ numitor; %transpun A pentru a obtine un numar prin inmulitrea celor 2 vectori coloana
end
