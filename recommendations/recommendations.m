function recoms = recommendations(path, liked_theme, num_recoms, min_reviews, num_features)

  mat = read_mat(path); %citesc datele din fisierul de intrare
  reduced_mat = preprocess(mat, min_reviews); %preprocesez matricea, corespunzator cerintei
  [~, ~, V] = svds(reduced_mat, num_features); %factorizam svd(varianta redusa) matricea noastra, in functie de nr min de valori singulare pe care le vrem
  m = size(V,1); %determinam cati clienti (randuri) raman in V
  similaritate = zeros(1, m); %vectorul linie in care pastram relatia de similitudine intre tema apreciata si celalate
  for i=1:m
    similaritate(i) = cosine_similarity(V(liked_theme, :)', V(i,:)');
  endfor
  [~, indecsi_sortati] = sort(similaritate, 'descend'); %pastram indexul din vectorul initial al temelor dupa ce le sortam de la cea mai similara la cea mai putin similara
  indecsi_sortati(1) = []; %eliminam primul element, pt ca acesta va fi tema apreciata insasi (cosine_similarity de ea cu ea fiind 1, max)
  recoms = indecsi_sortati(1:num_recoms); %salvam vectorul cu cate recomandari dorim, bazat pe cel cu indecsii sortati
end
