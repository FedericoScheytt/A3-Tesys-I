clear 
clc

load('datosADSL.mat');

Fmax=1104e3;
Fs=2*Fmax;

t=[0:1/Fs:(length(datosADSL)-1)/Fs];

plot(t,datosADSL)
title('Señal ADSL');
xlabel('Tiempo [s]');
ylabel('Señal ADSL')
grid on

N=2^21;
X = fft(datosADSL,N);
F=[-Fs/2:Fs/N:Fs/2-Fs/N]';

figure
plot(F,abs(X))
title('Espectro de Amplitud');
xlabel('frecuencia [Hz]');
ylabel('X(F)')
grid on

%filtro de voz 
k300=ceil(300*N/Fs);
k3400=floor(3400*N/Fs);

Filtrovoz=zeros(N,1);
Filtrovoz(k300:k3400)= 1;
Filtrovoz(N-k3400:N-k300)= 1;

%filtro de upstream
k25875=ceil(25875*N/Fs);
k138k=floor(138000*N/Fs);

Filtroup=zeros(N,1);
Filtroup(k25875:k138k)= 1;
Filtroup(N-k138k:N-k25875)= 1;

%filtro de downstream
k138kd=floor(138000*N/Fs);
k1104k=floor(1104000*N/Fs);

Filtrodn=zeros(N,1);
Filtrodn(k138kd:k1104k)= 1;
Filtrodn(N-k1104k:N-k138kd)= 1;

%grafica espectros filtrados
figure
subplot(311),plot(F,fftshift(abs(X.*Filtrovoz)));grid on
xlabel('Frecuancia [Hz]');
ylabel('Filtro de voz');

subplot(312),plot(F,fftshift(abs(X.*Filtroup)));grid on
xlabel('Frecuancia [Hz]');
ylabel('Filtro de Upstream');

subplot(313),plot(F,fftshift(abs(X.*Filtrodn)));grid on
xlabel('Frecuancia [Hz]');
ylabel('Filtro de Downstream')

VozFiltrada = X.*Filtrovoz;

voz = real(ifft(VozFiltrada));

vozresample = resample(voz,8192,Fs);
soundsc(vozresample,4000);