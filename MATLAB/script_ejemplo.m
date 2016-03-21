%ejemplo de scrip: serie de funciones en un solo archivo

denominador = input('dame el valor del denominador: ');
numerador = 20;

%checar la division entre 0

if (denominador ~= 0)
    result = numerador / denominador;
else
    sprintf('\n no puedes dividir entre %d', 0)
end

sprintf('\nel resultado de dividir %d  entre %d es %.3f\n',numerador, denominador, result)