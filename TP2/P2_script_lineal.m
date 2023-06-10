close all, clc
%% Item C
%Constantes
R=20;
b=0.5;
L=0.01;
M=0.2;
g=9.8;
K=2;
%valores de equilibrio 
u_eq=10;
i_eq=0.5;
y_eq=0.2551;

%condiciones iniciales Ki y Ky
Ki=(2*K*i_eq)/(y_eq);
Ky=-(K*(i_eq)^2)/((y_eq)^2);

%graficas
figure (1)
plot(iL.time ,iL.data, 'r'),grid on, hold on
title('corriente')
xlabel('tiempo')
ylabel('i(t)')
figure (2)
plot(yL.time , yL.data, 'k'), grid on, hold on;
title('posicion de la masa');
xlabel('tiempo')
ylabel('y(t)')
%% Item j
%calculo de polos
num= [Ki];
den= [M*L,b*L+R*M,R*b-Ky*L,-Ky*R];
G=tf(num,den)
polos=roots(den)

%% Item h
%Diagrama de Bode
figure (3)
bode(G)
%% Item m
% Agregado control Kp 
Kp=1000;
figure (4)
plot(iL_control.time ,iL_control.data, 'r'),grid on, hold on
title('control corriente')
xlabel('tiempo')
ylabel('i(t)')
figure (5)
plot(yL_control.time , yL_control.data, 'k'), grid on, hold on;
title('control posicion de la masa');
xlabel('tiempo')
ylabel('y(t)')