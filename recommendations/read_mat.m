function mat = read_mat(path)
  # TODO: Parse the .csv file and return the matrix of values (without row and column headers).
  mat = csvread(path, 1, 1); %citeste matricea din fisierul dat fara primul rand si prima coloana
end
