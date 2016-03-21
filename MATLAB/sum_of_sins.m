% sum_of_sins.m
% Show a random signal as a sum of sins
%
% Make our random x signal
x = round(rand(1,8)*10);
Xsize = length(x);

% Get FFT (FastFourierTransform) of x
X = fft(x);
Xmag = abs(X);
Xphase = angle(X);

% Show the freq-domain info as sum of sinusoids
% Find the IFFT (the hard way) part 1
n=0:Xsize-1; %m=0:Xsize-1;

% Do the sinusoids as discrete points only
s0 = Xmag(1)*cos(2*pi*0*n/Xsize + Xphase(1))/Xsize;
s1 = Xmag(2)*cos(2*pi*1*n/Xsize + Xphase(2))/Xsize;
s2 = Xmag(3)*cos(2*pi*2*n/Xsize + Xphase(3))/Xsize;
s3 = Xmag(4)*cos(2*pi*3*n/Xsize + Xphase(4))/Xsize;
s4 = Xmag(5)*cos(2*pi*4*n/Xsize + Xphase(5))/Xsize;
s5 = Xmag(6)*cos(2*pi*5*n/Xsize + Xphase(6))/Xsize;
s6 = Xmag(7)*cos(2*pi*6*n/Xsize + Xphase(7))/Xsize;
s7 = Xmag(8)*cos(2*pi*7*n/Xsize + Xphase(8))/Xsize;

% Redo the sinusoids as smooth curves
t = 0:0.05:Xsize-1;
smooth0 = Xmag(1)*cos(2*pi*0*t/Xsize + Xphase(1))/Xsize;
smooth1 = Xmag(2)*cos(2*pi*1*t/Xsize + Xphase(2))/Xsize;
smooth2 = Xmag(3)*cos(2*pi*2*t/Xsize + Xphase(3))/Xsize;
smooth3 = Xmag(4)*cos(2*pi*3*t/Xsize + Xphase(4))/Xsize;
smooth4 = Xmag(5)*cos(2*pi*4*t/Xsize + Xphase(5))/Xsize;
smooth5 = Xmag(6)*cos(2*pi*5*t/Xsize + Xphase(6))/Xsize;
smooth6 = Xmag(7)*cos(2*pi*6*t/Xsize + Xphase(7))/Xsize;
smooth7 = Xmag(8)*cos(2*pi*7*t/Xsize + Xphase(8))/Xsize;

% Find the IFFT (the hard way) part 2
my_sum_of_sins = (s0+s1+s2+s3+s4+s5+s6+s7);
smooth_sum = smooth0 + smooth1 + smooth2 + smooth3;
smooth_sum = smooth_sum + smooth4 + smooth5 + smooth6 + smooth7;

% Show both discrete points and smooth curves together
xaxis1 = (0:length(smooth0)-1)/20; % for 8 points
xaxis2 = (0:length(s0)-1);
figure(1);
subplot(4,1,1); plot(xaxis1, smooth0,'g', xaxis2, s0,'r*');
subplot(4,1,2); plot(xaxis1, smooth1,'g', xaxis2, s1,'r*');
subplot(4,1,3); plot(xaxis1, smooth2,'g', xaxis2, s2,'r*');
subplot(4,1,4); plot(xaxis1, smooth3,'g', xaxis2, s3,'r*');
ylabel('amplitude');
xlabel('sample');
figure(2);
subplot(4,1,1); plot(xaxis1, smooth4,'g', xaxis2, s4, 'r*');
subplot(4,1,2); plot(xaxis1, smooth5,'g', xaxis2, s5, 'r*');
subplot(4,1,3); plot(xaxis1, smooth6,'g', xaxis2, s6, 'r*');
subplot(4,1,4); plot(xaxis1, smooth7,'g', xaxis2, s7, 'r*');
ylabel('amplitude');
xlabel('sample');

% Show the original versus the reconstruction from freq-domain
figure(3);
subplot(2,1,1); plot(0:Xsize-1, x, 'bd');
title('original');
min_y = floor(min(smooth_sum));
max_y = ceil(max(smooth_sum));
axis([0, Xsize-1, min_y, max_y]); % Make the axes look nice
xaxis1 = (0:length(smooth_sum)-1)/20;
xaxis2 = (0:length(s0)-1);
subplot(2,1,2);

plot(xaxis1, smooth_sum, 'b', xaxis2, my_sum_of_sins, 'rd');
title('sum of sinusoids');
Error = my_sum_of_sins - x
