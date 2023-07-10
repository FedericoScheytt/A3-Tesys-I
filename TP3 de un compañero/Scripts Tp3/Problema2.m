clear
clc

[Y, Fs, Nbits] = wavread('tonos.wav');
%{  
    y: muestras
    Fs: frecuencia de muestreo
    Nbits:cantidad de bits por muestra
%}
%{
t=[0:1/Fs:(length(Y)-1)/Fs];
plot(t,Y);grid on
xlabel('Tiempo [s]')
ylabel('Señal a analizar')
%}


N = 2^16;
X = fft(Y,N);
F = [-Fs/2:Fs/N:Fs/2-Fs/N];

%{
plot(F,abs(fftshift(X))./Fs)
grid on
xlabel('frecuencia [Hz]')
ylabel('amplitud')
%}

L=(450e-3)*Fs;
cantiter=length(Y)/L;
muestra1000hz=1000*L/Fs;

for i=1:1:cantiter
   Xframe=fft(Y(((i-1)*L)+1:1:(i*L)));
   
   [valor,pos1]= max(Xframe(1:muestra1000hz));
   [valor,pos2]= max(Xframe(muestra1000hz+1:L/2));
   pos2=pos2+muestra1000hz;
  
   IdentificarDigito(pos1*Fs/L, pos2*Fs/L)
end
