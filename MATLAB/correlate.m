%
% correlate.m - How much are 2 signals alike?
%
% Usage: [rho] = correlate(k, x, y);
% inputs: k = shift (integer between 0 and length(y)-1)
% x, y = the signals to correlate
% output: rho = the correlation coefficient -1..0..1
%
% Note: This function assumes length(x) = length(y).
%
function [rho] = correlate(k, x, orig_y)
% Shift y by k units
y = [orig_y(k+1:length(orig_y)), orig_y(1:k)];
N = length(x);
%I created a new variable for transposed arrays, because it was
%causing a memory problem when multiplying an array by its transpose.
xt = x.';
yt = y.';
sxx = x*xt - sum(x)*sum(x)/N;
syy = y*yt - sum(y)*sum(y)/N;
sxy = x*yt - sum(x)*sum(y)/N;

rho = sxy / sqrt(sxx*syy);

