function [x1, x2] = function_P1(x1i, x2i, T, e, tf)
% function_P1(x1i, x2i, T, e, tf): Funcion que ...
%
% INPUT: 
%   x1i: 
%   x2i: 
%   T:   
%   e:   
%   tf:  
%
% OUTPUT:
%   x1: 
%   x2: 

% Author: Federcio Scheytt - Joaquin Gonzalez Targon
% Date: Mayo 2023
    
    % Discretizacion
    t = 0:T:tf-T;
    
    % Condiciones iniciales
    x1 = [x1i, zeros(1,length(t)-2)];
    x2 = [x2i, zeros(1,length(t)-2)];
    
    % Aproximacion de Euler
    for n = 1:length(t)-1
        x1(n+1) = x1(n) + T.*x2(n);
        x2(n+1) = x2(n) + T.*(e.*((1-(x1(n)).^2).*x2(n)) - x1(n));
    end

    return
end
