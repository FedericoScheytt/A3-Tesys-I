function [x1, x2] = function_P1(x1i, x2i, T, e, tf)
% function_P1(x1i, x2i, T, e, tf): Funcion que simula el comportamiento de un Oscilador de Van der
%   Pol, mediante la implementacion del metodo de Euler para la aproximacion de las derivadas de 
%   primer orden correspondientes al sistema de ecuaciones de estado que representan la dinamica 
%   fisica del sistema.
%   
%   EDO no lineal que caracteriza la respuesta del sistema:
%       v''(t) - e(1-v(t)^2)v'(t) + v(t) = 0
%
%   Ecuaciones de estado:
%       x1(t) = v(t)
%       x2(t) = v'(t)
%
%   EDO en funcion de las variables de estado:
%       x1'(t) = X2
%       x2'(t) = e(1-x1(t)^2)x2'(t) + x1(t) 
%
% INPUT: 
%   x1i: Valor inicial de x1
%   x2i: Valor inicial de x2
%   T:   Periodo de muestreo en segundos
%   e:   Parametro asociado al amortiguamiento del sistema 
%   tf:  Tiempo total de la simulacion en segundos
%
% OUTPUT:
%   x1: Vector de resultados x1
%   x2: Vector de resultados x2
%
% Author: Federcio Scheytt - Joaquin Gonzalez Targon
% Date: Mayo 2023

    %% Discretizacion
    t = 0:T:tf-T;
    
    %% Condiciones iniciales
    x1 = [x1i, zeros(1,length(t)-2)];
    x2 = [x2i, zeros(1,length(t)-2)];
    
    %% Aproximacion de Euler
    for n = 1:length(t)-1
        x1(n+1) = x1(n) + T.*x2(n);
        x2(n+1) = x2(n) + T.*(e.*((1-(x1(n)).^2).*x2(n)) - x1(n));
    end
    
    %% Return
    return
    
end
