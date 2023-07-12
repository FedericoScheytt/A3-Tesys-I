function digito = P2_function(F1,F2)
%% P2_function(F1,F2): Funcion de identificacion de digitos.
%   Función que toma como argumentos de entrada dos frecuencias, F1 y F2 (F1 < F2), y como 
%   argumento de salida la variable digito, correspondiente al dígito identificado.
%
% INPUT: 
%   F1: Frecuencia 1 asociada al digito
%   F2: Frecuencia 2 asociada al digito
%
% OUTPUT:
%   digito: Digito identificado
%
% Author: Federcio Scheytt - Joaquin Gonzalez Targon
% Date: Julio 2023

%% Definicion de constantes
    FL = [697 770 852 941];
    FH = [1209 1336 1477 1633];
    OPC = {1 2 3 'A';4 5 6 'B';7 8 9 'C';'*' 0 '#' 'D'};

%% Identificacion de digitos
    fil = 0;
    col = 0;
    for i = 1:4
        if F1>FL(i)/1.018 && F1<FL(i)*1.018
            fil = i;
            break
        end
    end
    for j = 1:4
        if F2>FH(j)/1.018 && F2<FH(j)*1.018
            col = j;
            break
        end
    end
    if fil == 0 || col == 0
        digito = [];
    else
        digito = OPC(fil,col);
    end

end

