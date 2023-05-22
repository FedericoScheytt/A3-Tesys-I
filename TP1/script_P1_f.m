% Script: script_P1_f.m
% Author: Federico, Scheytt - Joaquin, Gonzalez Targon
% Date: Mayo 2023

clear, clc, close all

%% Constantes 
T = 0.001;
e = 10;
tf = 50;
c = ['k', 'r', 'b', 'g'];

%% Condiciones iniciales
x1i = [1 -0.5 -1 1.5];
x2i = [1 -5 10 -4]; 

%% Implementacion de la solucion
for i=1:length(x1i)
    % Calculo de los vectores x1 y x2
    [x1, x2] = function_P1(x1i(i), x2i(i), T, e, tf);
    % Graficos
    f_plot(i,x1i,x2i,x1,x2,c)
end

%% Funcion f_plot
function f_plot(i,x1i,x2i,x1,x2,c)
    figure(1)
        subplot(2,2,i), plot(x1,x2,'r',x1i(i),x2i(i),'*k')
            title(['$(x_{1i}, x_{2i}) = ($', num2str(x1i(i)), ',', num2str(x2i(i)), '$)$'], 'Interpreter', 'latex')
            xlabel('x_{1}(t)')
            ylabel('x_{2}(t)')
            legend('Trayectoria','Condicion inicial')
            hold on, grid on
    figure (2)
        plot(x1i(i),x2i(i),'*k', x1,x2,c(i))
            title('Plano de fase')
            xlabel('x_{1}(t)')
            ylabel('x_{2}(t)')
            hold on, grid on
end
