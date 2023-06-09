
function dx = P1_function_ode_file(t,x)
    % P1_function_ode_file(t,x)
    % Author: Federcio Scheytt - Joaquin Gonzalez Targon
    % Date: Junio 2023

    % Carga de datos
        P1_datos

    % Entrada
        if t < D
            T = 0.5;
        else
            T = 0;
        end

    % Ecuaciones de estado
        dx = [  x(2);
                (1/J1)*(T - b2*x(2) - k1*(x(1) - x(3)));
                x(4);
                (1/J2)*(-b1*x(4) - k1*(x(3) - x(1)) - k2*x(3));
             ];

