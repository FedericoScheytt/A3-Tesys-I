clc,close all 
%% Constantes
R=20;
b=0.5;
L=0.01;
M=0.2;
g=9.8;
K=2;

%% graficas
figure(1)
plot(y.time , y.data, 'k'), grid on, hold on;
title('posicion de la masa');
xlabel('tiempo')
ylabel('y(t)')
figure(2)
plot(i.time , i.data, 'k'), grid on, hold on;
title('corriente')
xlabel('tiempo')
ylabel('i(t)')