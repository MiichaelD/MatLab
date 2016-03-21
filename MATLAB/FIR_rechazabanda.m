   %filtro rechazabanda:
   %Get bandstop filter coefficients
   B2 = fir1(100, [0.3, 0.5], 'stop');
    
   %filtro pasa-alta:
   %Get highstop filter coefficients
   B3 = fir1(100, 0.5, 'high');
    
    
   %filtro pasa-alta:
   %Get highstop filter coefficients
   B4 = fir1(100,[0.2, 0.4, 0.6, 0.8], 'bandpass');
    
    
    x = zeros(1, 1000);
    x(50) = 1;
    Y2 = fft(conv(x,B3));
    half = 1:ceil(length(Y2)/2);
    plot(half/max(half), abs(Y2(half)),'b');
    title('Filtro rechazabanda en Matlab');