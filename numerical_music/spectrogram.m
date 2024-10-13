function [S f t] = spectrogram(signal, fs, window_size)
  [m , ~] = size(signal);
  number_windows = floor(m/window_size); %det nr de intervale
  S = zeros(window_size, number_windows); %initializam matricea sepctograma
  f = linspace(0, fs/2, window_size+1)';  %genereaza un vector coloana cu window_size + 1 elemente, egal distanatate, de la 0 la fs/2, inclusiv
  f = f(1:window_size); %ne asiguram ca avem nr de frecvente posibile dorite
  t = linspace(0, (number_windows-1)*(window_size/fs), number_windows)'; %analog f pt a obtine toate momentele de timp in care are loc STFT
  hann_window = hanning(window_size); %aplicam functia hanning
  for i=1:number_windows
    index_begin = (i-1)*window_size + 1;
    index_end = i*window_size;
    window = signal(index_begin:index_end); %alegem intervalul curent pe care il formatam
    window = window .* hann_window;
    window = fft(window, window_size * 2);
    window = window(1:window_size); %se relizeaza formatarea intervalului
    S(:, i) = abs(window); %salvam valorile obtinute in spectograma
  endfor
endfunction

