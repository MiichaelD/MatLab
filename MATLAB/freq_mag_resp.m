% Show freq magnitude response for an FIR filter's coefficients
% We assume the number of coefficients is less than 128.
%
function freq_mag_resp(h)
    
    
    % Zero pad so that the results will look nice
    x = h;
    x(length(h)+1:128) = 0;
    % Get the frequency magnitude response of x
    X = fft(x);
    X_mag = abs(X);
    % Display the results
    half = ceil(length(X_mag)/2);
    %plot(1:128, X_mag(1:128), 'b');
    plot(1:half, X_mag(1:half), 'b');
      
  
    
    %%IIR%%
    %Get bandstop filter coefficients
%     B2 = fir1(100, [0.3, 0.5], 'stop');
%     x = zeros(1, 1000);
%     
%     x(50) = 1;
%     Y2 = fft(filter(x,B2));
%     half = 1:ceil(length(Y2)/2);
%     plot(half/max(half), abs(Y2(half)), 'b');
    title('frequency magnitude response');
end