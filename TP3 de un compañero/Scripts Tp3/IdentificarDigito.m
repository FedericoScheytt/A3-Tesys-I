function [ digito ] = IdentificarDigito( F1,F2 )
%IDENTIFICARDIGITO 
% toma F1 y F2 con F2>F1 
% devuelve el dígito identificado  
Fl=[697 770 852 941];
Fh=[1209 1336 1477 1633];

opciones={1   2   3  'A';...
          4   5   6  'B';...
          7   8   9  'C';...
         '*' '0' '#' 'D'};

columna=0;
fila=0;

for l=1:1:4
    if F1>Fl(l)/1.018 && F1<Fl(l)*1.018
        fila=l;
        break
    end
end

for h=1:1:4
    if F2>Fh(h)/1.018 && F2<Fh(h)*1.018
        columna=h;
        break;
    end
end

if fila==0 || columna==0
    digito=[];
else
    digito = opciones(fila,columna);
end
end

