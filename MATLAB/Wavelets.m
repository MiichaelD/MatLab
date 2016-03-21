% Set wavelet name. 
wname = 'db5';
% Compute the four filters associated with wavelet name given 
% by the input string wname. 
[Lo_D,Hi_D,Lo_R,Hi_R] = wfilters(wname); 
subplot(221); stem(Lo_D); 
title('Decomposition low-pass filter'); 
subplot(222); stem(Hi_D); 
title('Decomposition high-pass filter'); 
subplot(223); stem(Lo_R); 
title('Reconstruction low-pass filter'); 
subplot(224); stem(Hi_R); 
title('Reconstruction high-pass filter'); 
xlabel('The four filters for db5')

fvtool(Lo_D,1,Hi_D,1)
fvtool(Lo_R,1,Hi_R,1)


n = 1:400; % we will have 100 samples
x = 4*sin(2*pi*50*n*0.0002)
xn=x+0.5*randn(size(x)); 
[cA,cD]=dwt(xn,'db8'); 
subplot(3,1,1),plot(xn),title('Original Signal')
grid
subplot(3,1,2),plot(cA),title('One Level Approximation')
grid
subplot(3,1,3),plot(cD),title('One Level Detail')
grid





n = 1:750;
fs=2500;
len=100;
[x1,t1]=0.5 *sin(2*pi*50*n); % The time vector t1 is in milliseconds
[x2,t2]=0.25*sin(2*pi*100*n);
[x3,t3]=1.0 *sin(2*pi*200*n);
y1=cat(2,x1,x2,x3);  % Concatenate the signals
ty1=[t1,t2+len,t3+2*len];  %Concatenate the time vectors 1 to len, len to 2*len, etc.
[A1,D1]=dwt(y1,'db8');
subplot(3,1,1),plot(y1),title('Original Signal')
subplot(3,1,2),plot(A1),title('One Level Approximation')
subplot(3,1,3),plot(D1),title('One Level Detail')


n = 1:400; % 
x = 4*sin(2*pi*50*n*0.0002)
xn=x+0.5*randn(size(x));
[C,L]=wavedec(xn,4,'db8')
A1 = wrcoef('a',C,L,'db8',1);  % Reconstruct the approximations at various levels
A2 = wrcoef('a',C,L,'db8',2);
A3 = wrcoef('a',C,L,'db8',3);
A4 = wrcoef('a',C,L,'db8',4);
subplot(5,1,1),plot(xn),title('Original Signal')
subplot(5,1,2),plot(A1),title('Reconstructed Approximation - Level 1')
subplot(5,1,3),plot(A2),title(' Reconstructed Approximation - Level 2')
subplot(5,1,4),plot(A3),title(' Reconstructed Approximation - Level 3')
subplot(5,1,5),plot(A4),title(' Reconstructed Approximation - Level 4')


n = 1:400; 
x = 4*sin(2*pi*50*n*0.0002)
x(302:305)=.25; %se crean discontinuidades
[A,D]=dwt(x,'db8');
subplot(3,1,1),plot(x),title('Original Signal')
subplot(3,1,2),plot(A),title('First Level Approximation')
subplot(3,1,3),plot(D),title('First Level Detail')



%compresion por aproximacion de ondiculas
load leleccum
x=leleccum;
w = 'db3';
[C,L] = wavedec(x,4,w);
A4 = wrcoef('a',C,L,'db3',4);
A3 = wrcoef('a',C,L,'db3',3);
A2 = wrcoef('a',C,L,'db3',2);
A1 = wrcoef('a',C,L,'db3',1);
a3 = appcoef(C,L,w,3);
subplot(2,1,1),plot(x),axis([0,4000,100,600])
title('Original Signal')
subplot(2,1,2),plot(A3),axis([0,4000,100,600])
title('Approximation Reconstruction at Level 3 Using the Daubechies-3 Wavelet')
(length(a3)/length(x))*100 %este comando nos dirá el % de valores


%compresion por umbrales
load leleccum
x=leleccum;
w = 'db3';  % Specify the Daubechies-4 wavelet
[C,L] = wavedec(x,4,w);% Multi-level decomposition to 4 levels.
a3 = appcoef(C,L,w,3);% Extract the level 3 approximation coefficients
d3 = detcoef(C,L,3); % Extract the level 3 detail coefficients.
subplot(2,1,1), plot(a3),title('Approximation Coefficients at Level 3')
subplot(2,1,2), plot(d3),title('Detail Coefficients at Level 3')



%mejor compresion por umbrales
load leleccum
x=leleccum;  % Uncompressed signal
w = 'db3';  % Set wavelet family
n=3;  % Set decomposition level 
[C,L] = wavedec(x,n,w);  % Find the decomposition structure of x to level n using w.
thr = 10;  % Set the threshold value
keepapp = 1;  %Logical parameter = do not threshold approximation coefficients
sorh='h';  % Use hard thresholding
[xd,cxd,lxd, perf0,perfl2] =wdencmp('gbl',C,L,w,n,thr,sorh,keepapp);
subplot(2,1,1), plot(x),title('Original Signal')
subplot(2,1,2),plot(xd),title('Compressed Signal (Detail Thresholding)')
perf0  % Percent of coefficients set to zero
perfl2  % Percent retained energy in the compressed signal


%comprobación
D1 = wrcoef('d',C,L,w,1);
D2 = wrcoef('d',C,L,w,2);
D3 = wrcoef('d',C,L,w,3);
d1 = wrcoef('d',cxd,lxd,w,1);
d2 = wrcoef('d',cxd,lxd,w,2);
d3 = wrcoef('d',cxd,lxd,w,3);
subplot(3,2,1),plot(D3),title('Original Detail - Levels 3 to 1')
subplot(3,2,2),plot(d3),title('Thresholded Detail - Levels 3 to 1')
subplot(3,2,3),plot(D2)
subplot(3,2,4),plot(d2)
subplot(3,2,5),plot(D1)
subplot(3,2,6),plot(d1)






