% Script: script_P2.m
% Author: Federico, Scheytt - Joaquin, Gonzalez Targon
% Date: Mayo 2023

clear, clc, close all

%% Carga del archivo de datos
load('datosProb2.mat')

%% Constantes
c = 3e+8;
Ts = 1/Fs;
dT = 16;

%% Discretizaciones
n = t.*Fs;
l = -(length(x1)-1):length(x1)-1;

%% Calculo de correlaciones
rxx1 = xcorr(x1);
rxx2 = xcorr(x2);
ry1x1 = xcorr(y1,x1);
ry2x2 = xcorr(y2,x2);

%% Calculo de picos de la correlacion
[p1, D1pos] = max(ry1x1);
[p2, D2pos] = max(ry2x2);

    %% Calculo del tiempo de retardo en muentras D
    D1 = D1pos - length(x1);
    D2 = D2pos - length(x1);

    %% Calculo de las distancias respectivas
    d1 = (c*D1*Ts)/2;
    d2 = (c*D2*Ts)/2;

    %% Distancia del vehiculo entre los dos intervalos de tiempo
    d = d1-d2;

    %% Velocidad del vehiculo
    v = d/dT;
 
%% Grafico de correlacion cruzada        
figure(1)
    plot(l,ry1x1,'r', l, ry2x2, 'b')
        title('Correlacion cruzada')
        legend('r_{y1x1}(l)', 'Location', 'northeast', 'r_{y2x2}(l)', 'Location', 'northeast')
        xlabel('Indice l')
        ylabel('Correlacion')
        hold on, grid on

%% Graficos de autocorrelacion
figure(2)
    subplot(1,2,1), plot(l, rxx1,'r')
        axis([l(1), l(length(l)-2), 0 , 6000]);
        title('Autoorrelacion de x1')
        legend('r_{xx1}(l)', 'Location', 'northwest')
        xlabel('Indice l')
        ylabel('Correlacion')
        hold on, grid on
    subplot(1,2,2), plot(l, rxx2, 'b')
        axis([l(1), l(length(l)-2), 0 , 6000]);
        title('Autoorrelacion de x2')
        legend('r_{xx2}(l)', 'Location', 'northwest')
        xlabel('Indice l')
        ylabel('Correlacion')
        hold on, grid on
