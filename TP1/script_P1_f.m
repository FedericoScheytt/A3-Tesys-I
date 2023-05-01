% Script: s_P1_f.m
% Author: Federico, Scheytt - Joaquin, Gonzalez Targon
% Date: Mayo 2023

clear, clc, close all

% Constantes 
T = 0.001;
e = 10;
tf = 50;

% Condiciones iniciales
x1i = [1 -0.5 -1 1.5];
x2i = [1 -5 10 -4];

for i=1:length(x1i)
   [x1, x2] = function_P1(x1i(i), x2i(i), T, e, tf);
   
   subplot(1,4,i), plot(x1,x2,'b')
        title(['$\varepsilon$ = ', num2str(e)],'Interpreter','latex')
        xlabel('x_{1}(t)')
        ylabel('x_{2}(t)')
        hold on, grid on
end
