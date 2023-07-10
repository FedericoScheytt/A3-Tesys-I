% Script: P2_script.m
% Author: Federico, Scheytt - Joaquin, Gonzalez Targon
% Date: Junio 2023

clc, close all

% Carga de datos
    P2_datos

%% Implementacion del diagrama de bloques no lineal
     % Graficas
        figure(1)
            subplot(3,1,1), plot(y.time,y.data,'b'), grid on, hold on;
                title('Posicion de la masa M (y(t))');
                xlabel('Tiempo [seg]')
                ylabel('y(t)')
            subplot(3,1,2),plot(i.time,i.data,'b'), grid on, hold on;
                title('Corriente (i(t))')
                xlabel('Tiempo [seg]')
                ylabel('i(t)')
            subplot(3,1,3),plot(u.time,u.data,'b'), grid on, hold on;
                title('Tension (u(t))')
                xlabel('Tiempo [seg]')
                ylabel('u(t)')
            
%% Implementacion del diagrama de bloques linealizado
    % Valores de equilibrio 
        u_eq = 10;
        i_eq = u_eq/R;
        y_eq = (k*(i_eq)^2)/(M*g);

    % Condiciones iniciales ki y ky
        ki = (2*k*i_eq)/y_eq;
        ky = -k*(i_eq/y_eq)^2;

    % Graficas
        figure(2)
            subplot(3,1,1), plot(yL.time,yL.data,'r'), grid on, hold on;
                title('Posicion de la masa M (y(t))');
                xlabel('Tiempo [seg]')
                ylabel('y(t)')
            subplot(3,1,2), plot(iL.time,iL.data,'r'), grid on, hold on
                title('Corriente (i(t))')
                xlabel('Tiempo [seg]')
                ylabel('i(t)')
            subplot(3,1,3),plot(uL.time,uL.data,'r'), grid on, hold on;
                title('Tension (u(t))')
                xlabel('Tiempo [seg]')
                ylabel('u(t)')

%% Comparacion de diagrama de bloques lineal y no lineal
    % Graficas
        figure(3)
            subplot(3,1,1), plot(y.time,y.data,'b', yL.time,yL.data,'r'), grid on, hold on;
                title('Comparacion de la posicion de la masa M (y(t))')
                legend('No lineal','Lineal')
                xlabel('Tiempo [seg]')
                ylabel('y(t)')
                hold on, grid on
            subplot(3,1,2), plot(i.time,i.data,'b', iL.time,iL.data,'r'), grid on, hold on;
                title('Comparacion de la corriente (i(t))')
                legend('No lineal','Lineal')
                xlabel('Tiempo [seg]')
                ylabel('i(t)')
                hold on, grid on
            subplot(3,1,3), plot(u.time,u.data,'b', uL.time,uL.data,'r'), grid on, hold on;
                title('Comparacion de la tension (u(t))')
                legend('No lineal','Lineal')
                xlabel('Tiempo [seg]')
                ylabel('u(t)')
                hold on, grid on

%%Calculo de funcion tranferencia
    num = ki;
    den = [M*L,b*L+R*M,R*b-ky*L,-ky*R];
    % Funcion transferencia   
        G = tf(num,den);

%% Calculo de polos y ceros
    % Polos y ceros
        polos = roots(den);
        ceros = roots(num);

%% Calculo de wn y xi
    [wn, xi] = damp(G);

%% Diagrama de bode
    % Bode
    figure(4)
        bode(num,den), grid on

%% Implementacion de control proporcional P
    
    % Constante de proporcionalidad    
        kp = 1000;
    % Graficos
        figure (5)
            subplot(2,1,1), plot(yLC.time,yLC.data,'b'), grid on, hold on
                title('Posicion de la masa M (y(t)) con control P');
                xlabel('Tiempo [seg]')
                ylabel('y(t)')
            subplot(2,1,2), plot(iLC.time,iLC.data,'b'), grid on, hold on
                title('Corriente (i(t)) con control P')
                xlabel('Tiempo [seg]')
                ylabel('i(t)')
