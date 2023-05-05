
% Script: script_P1_c.m
% Author: Federico, Scheytt - Joaquin, Gonzalez Targon
% Date: Mayo 2023

clear, clc, close all

%% Constantes 
T = [0.001 0.1];
e = [0 1 10 50];
tf = 100;

%% Condiciones iniciales
x1i = 0;
x2i = 1;
    
%% Implementacion del metodo
for i = 1:length(T)
    % Discretizacion
    t = 0:T(i):tf-T(i);
    x1 = [x1i, zeros(1,length(t)-2)];
    x2 = [x2i, zeros(1,length(t)-2)];
    for j = 1:length(e)
        for n = 1:length(t)-1
            % Aproximacion de Euler
            x1(n+1) = x1(n) + T(i).*x2(n);
            x2(n+1) = x2(n) + T(i).*(e(j).*((1-(x1(n)).^2).*x2(n)) - x1(n));
        end
        % Graficos
        f_plot(i,j,x1,e,t);
    end 
end
    
%% Funcion f_plot
function f_plot(i,j,x1,e,t)
    figure(i)
        subplot(2,2,j), plot(t,x1,'r')
            title(['$\varepsilon$ = ', num2str(e(j))],'Interpreter','latex')
            legend('x_{1}(t)', 'Location', 'northwest')
            xlabel('Tiempo [seg]')
            ylabel('x_{1}(t)')
            hold on, grid on
end
