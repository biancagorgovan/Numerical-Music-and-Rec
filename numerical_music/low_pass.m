function signal = low_pass(signal, fs, cutoff_freq)
  %Se face transformarea Fourier pt semnal
    SIGNAL = fft(signal);

    %Creez vectorul de frecventa (asemantor, task spectograma)
    n = length(SIGNAL);
    f = linspace(0, fs, n+1);
    f = f(1:n)';

    %Creez vectorul masca
    mask = f < cutoff_freq;

    %Aplic produsul Hadamard
    SIGNAL_filtered = SIGNAL .* mask;

    %Transformarea inversa Fourier
    filtered_signal = ifft(SIGNAL_filtered);

    % Normalizare
    signal = filtered_signal / max(abs(filtered_signal));
endfunction

