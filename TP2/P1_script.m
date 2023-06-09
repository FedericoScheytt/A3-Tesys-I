% Script: P1_script.m
% Author: Federico, Scheytt - Joaquin, Gonzalez Targon
% Date: Junio 2023

clear, clc, close all 

% Carga de datos  
    P1_datos
    
%% Calculo de respuesta del sistema
    % Inicializaciones
        t = 10;
        tspan = [0 t];
        x0 = [0,0,0,0];

    % Rutina de integracion numerica 
        [T,x] = ode45('P1_function_ode_file',tspan,x0);

    % Graficos
        figure(1)
            subplot(2,2,1), plot(T,x(:,1),'r'),
                title('Posicion de la masa 1 (\theta_{1}(t))')
                xlabel('Tiempo [seg]')
                ylabel('x_{1}(t)=\theta_{1}(t)[rad]')
                hold on, grid on
            subplot(2,2,2), plot(T,x(:,2),'b')
                title('Velocidad de la masa 1 (\omega_{1}(t))')
                xlabel('Tiempo [seg]')
                ylabel('x_{2}(t)=\omega_{1}(t)[rad/s]')
                hold on, grid on
            subplot(2,2,3), plot(T,x(:,3),'r')
                title('Posicion de la masa 2 (\theta_{2}(t))')
                xlabel('Tiempo [seg]')
                ylabel('x_{3}(t)=\theta_{2}(t)[rad]')
                hold on, grid on
            subplot(2,2,4), plot(T,x(:,4),'b')
                title('Velocidad de la masa 2 (\omega_{2}(t))')
                xlabel('Tiempo [seg]')
                ylabel('x_{4}(t)=\omega_{2}(t)[rad/s]')
                hold on, grid on
%% Calculo de funcion tranferencia
    % Matrices 
        A = [0,1,0,0; -k1/J1,-b2/J1,k1/J1,0; 0,0,0,1; k1/J2,0,(-k1-k2)/J2,-b1/J2];
        B = [0;1/J1;0;0];
        C = [1,0,0,0];
        D = 0;

    % Funcion transferencia
        [num,den] = ss2tf(A,B,C,D);
        G = tf(num,den);
     
 %% Calculo de polos y ceros
    % Polos y ceros
        polos = roots(den);
        ceros = roots(num);

%% Diagrama de bode
    % Bode
    figure(2)
        bode(num,den), grid on

%% Comparacion con datos experimentales
    % Carga de datos experimentales
    P1_datos_experimentales
  
    % Graficos comparativos
    figure(3)
        subplot(2,1,1), plot(T,x(:,1),'r',evol(:,2), evol(:,4)/2544, 'b'),
            title('Posicion de la masa 1 (\theta_{1}(t))')
            legend('Simulacion','Experimental')
            xlabel('Tiempo [seg]')
            ylabel('x_{1}(t)=\theta_{1}(t)[rad]')
            hold on, grid on
        subplot(2,1,2), plot(T,x(:,3),'r',evol(:,2), evol(:,5)/2544, 'b')
            title('Posicion de la masa 2 (\theta_{2}(t))')
            legend('Simulacion','Experimental')
            xlabel('Tiempo [seg]')
            ylabel('x_{3}(t)=\theta_{2}(t)[rad]')
            hold on, grid on
