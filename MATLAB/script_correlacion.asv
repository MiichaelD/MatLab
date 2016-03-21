clear
clc

[x, fs] = wavread('HS_PE1_MO_M_21_2_2');

[r, c] = size(x);

if r > c
    z = x';
else
    z = x;
end

for k = 0:10:16000
    rho(k+10) = correlate(k,z,z);
end

plot(rho);

title('Desplazamiento vs coeficiente de correlación');
xlabel('Desplazamiento');
ylabel('Coeficiente de Correlación');