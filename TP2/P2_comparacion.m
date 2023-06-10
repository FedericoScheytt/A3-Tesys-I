close all, clc
%% Constantes
R=20;
b=0.5;
L=0.01;
M=0.2;
g=9.8;
K=2;

%% valores de equilibrio 
u_eq=10;
i_eq=0.5;
y_eq=0.2551;

%% condiciones iniciales Ki y Ky
Ki=(2*K*i_eq)/(y_eq);
Ky=-(K*(i_eq)^2)/((y_eq)^2);

%% comparacion de graficas no lineal y lineal
plot(y.time , y.data, 'k'), grid on, hold on;
plot(yL.time , yL.data, 'r'), grid on, hold on;
title('Comparacion lineal y no lineal');
xlabel('tiempo')
ylabel('distancia')
%fijarse que con poner 2V de entrada se nota la diferencia y poniendo 0.2V
%casi no se nota (variariar en Simulink)
