% Script: P2_script.m
% Author: Federico, Scheytt - Joaquin, Gonzalez Targon
% Date: Julio 2023

clc, close all

%% Carga de datos
    %[Y, Fs, Nbits] = wavread('tonos.wav');
    [Y, Fs] = audioread('tonos.wav');	
    
    t=[0:1/Fs:(length(Y)-1)/Fs];
    plot(t,Y), grid on
        xlabel('Señal a analizar')
        ylabel('Tiempo [s]')
        
	N = 2^16;
    X = fft(Y,N);
    F = [-Fs/2:Fs/N:Fs/2-Fs/N];
    
    plot(F,abs(fftshift(X))./Fs), grid on
        xlabel('frecuencia [Hz]')
        ylabel('amplitud')