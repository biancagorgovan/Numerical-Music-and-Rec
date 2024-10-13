function mono = stereo_to_mono(stereo)
  mono = mean(stereo, 2); %mean(stereo, 2) returneaza un vector coloana ce contine
  %media fiecarui rand din matricea stereo
  % Normalize
  mono = mono / max(abs(mono));
endfunction

