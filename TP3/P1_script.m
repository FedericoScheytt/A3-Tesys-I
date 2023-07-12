% Script: P1_script.m
% Author: Federico, Scheytt - Joaquin, Gonzalez Targon
% Date: Julio 2023

clear, clc, close all 

%% Carga de datos de la señal
    load('canon.mat')
    % Discretizacion de tiempos
        t = (0:1/Fs:(length(yruidosa)-1)/Fs)';
    % Grafico señal ruidosa
        figure(1)
            plot(t,yruidosa,'b'), hold on, grid on
                title('Señal ruidosa')
                xlabel('Tiempo [seg]')
                ylabel('y_{r}(t)')
 
%% Espectro de la señal ruidosa mediente FFT
    % Calculo de N
        L = length(yruidosa);
        N = 2^(ceil(log2(L))); % N > L
    % FFT
        Yr = fft(yruidosa,N);
    % Discretizacion de tiempos
        F = (-Fs/2:Fs/N:Fs/2-Fs/N)';
    % Grafico del espectro de la señal ruidosa
        figure(2)
            plot(F,abs(fftshift(Yr)),'b'), hold on, grid on
                title('Espectro señal ruidosa')
                xlabel('Frecuencia [Hz]')
                ylabel('|Y_{r}(F)|')

%% Filtrado en el dominio FFT
    % Filtro
        k100 = ceil(100*N/Fs); % ruido de 100Hz
        f = ones(N,1);
        f(k100-30:k100+30) = 0;
        f(N-k100-30:N-k100+30) = 0;  
    % Filtrado
        Yf = Yr.*f;     
    % IFFT
        yf = real(ifft(Yf,N));
        yfiltrada = yf(1:L);
    %Grafico del espectro del filtro
        figure(3)
            plot(F,abs(fftshift(Yf)),'r',F,abs(fftshift(1000*f)),'b'), hold on, grid on
                axis([-2000 2000 0 10000])
                title('Espectro señal filtrada y filtro')
                legend('Señal','Filtro')
                xlabel('Frecuencia [Hz]')
                ylabel('|Y(F)|')
    % Grafico de la señal filtrada
        figure(4)
            plot(t,yfiltrada,'b'), hold on, grid on
                title('Señal filtrada')
                xlabel('Tiempo [seg]')
                ylabel('y_{f}(t)')
            
    % Comparacion de sonidos
        % Señal ruidosa
            soundsc(yruidosa,Fs);
        % Señal filtrada
            soundsc(yfiltrada,Fs);
        
%% Filtro FIR rechaza banda de fase lineal
    % Orden 1000
        M = 1000; 
    % Frecuencias limite de la banda de rechazo
        w1 = 2*80/Fs;
        w2 = 2*110/Fs;
    % Filtro FIR
        num = fir1(M,[w1 w2], 'stop');
        den = [1 zeros(1,length(num)-1)];
        f = tf(num,den,1/Fs);
        % Bode
        figure(5)
            [mag,fase,w] = bode(f);
    % Filtrado
        yfiltrada = filter(num,den,yruidosa);
    % Grafico de la señal filtrada
        figure(6)
            plot(t,yfiltrada,'b'), hold on, grid on
                title('Señal filtrada por filtro FIR')
                xlabel('Tiempo [seg]')
                ylabel('y_{f}(t)')
    % Espectros
        Yr = fft(yruidosa,N);
        Yf = fft(yfiltrada,N);        
    % Grafico del espectro del filtro
        figure(7)
            plot(F,abs(fftshift(Yr)),'r'), hold on, grid on
                title('Espectro señal ruidosa')
                xlabel('Frecuencia [Hz]')
                ylabel('|Y_{r}|')
        figure(8)
            plot(F,abs(fftshift(Yf)),'r'), hold on, grid on
                title('Espectro señal filtrada')
                xlabel('Frecuencia [Hz]')
                ylabel('|Y_{f}|')
        
        
%% Notas musicales



    