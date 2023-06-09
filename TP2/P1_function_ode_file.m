function dx = P1_function_ode_file(t,x)
% P1_function_ode_file(t,x): Funcion que
%
% INPUT: 
%   x: 
%   t: 
%
% OUTPUT:
%   dx: 
%
% Author: Federcio Scheytt - Joaquin Gonzalez Targon
% Date: Junio 2023

%% Carga de datos
    P1_datos

%% Torque aplicado en funcion del tiempo
    if t < D
        T = 0.5;
    else
        T = 0;
    end
    
%%
    dx = [  
            x(2);
            (1/J1)*(T - b2*x(2) - K1*(x(1) - x(3)));
            x(4);
            (1/J2)*(-b1*x(4) - K1*(x(3) - x(1)) - K2*x(3));
         ];

