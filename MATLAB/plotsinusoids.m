% usage: plotsinusoids(freq, mag, phase)
%
function plotsinusoids(freq, mag, phase)
max_plots = 4; % Maximum number of sinusoids to plot at once
num_points = 200; % Number of points per repetition
% Check parameters
if (or((length(mag)~=length(freq)), (length(phase)~=length(freq))))
    error('Error - freq, mag, and phase must be the same size')
end
% We want this for 2 repetitions, and num_points per rep.
freq_min = min(freq);
step = 2/(freq_min*num_points);
t = 0:step:2*(1/freq_min);
i=1;
my_limit = min(length(freq), max_plots);
while (i <= my_limit)
    x = mag(i)*cos(2*pi*freq(i)*t + phase(i));
    my_title =  sprintf('Sinusoid with f=%d, mag=%4.2f, phase=%4.2f', ...
    freq(i), mag(i), phase(i));
    subplot(my_limit,1,i);
    plot(t,x);
    title(my_title);
    ylabel('Amplitude');
    i = i + 1;
end
xlabel('Time (sec)');