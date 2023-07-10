[Y, Fs, Nbits] = wavread('tonos.wav');

N = 2^16;
X = fft(Y,N);
F = [-Fs/2:Fs/N:Fs/2-Fs/N];

L=(450e-3)*Fs;
cantiter=length(Y)/L;
muestra1000hz=1000*L/Fs;

h = fir1(80,0.325);
H = fft(h,L)';

for i=1:1:cantiter
   Xframe=fft(Y(((i-1)*L)+1:1:(i*L))).*H;
   
   [valor,pos1]= max(Xframe(1:muestra1000hz));
   [valor,pos2]= max(Xframe(muestra1000hz+1:L/2));
   pos2=pos2+muestra1000hz;
  
   IdentificarDigito(pos1*Fs/L, pos2*Fs/L)
end