clear,clc,close all 

%% Item b
    P1_datos
    t = 10;

    %inicializaciones
    tspan = [0 t];
    x0 = [0,0,0,0];

    %funcion
    [T,x] = ode45('P1_ode_file',tspan,x0);

    %plot
    figure(1)
    subplot(2,2,1), plot(T,x(:,1),'r'),
        title('Posicion de la masa 1')
        xlabel('Tiempo [seg]')
        ylabel('x_{1}(t)=\theta_{1}(t)[rad]')
        hold on, grid on
    subplot(2,2,2), plot(T,x(:,2),'b')
        title('Velocidad de la masa 1')
        xlabel('Tiempo [seg]')
        ylabel('x_{2}(t)=\omega_{1}(t)[rad/s]')
        hold on, grid on
    subplot(2,2,3), plot(T,x(:,3),'r')
        title('Posicion de la masa 2')
        xlabel('Tiempo [seg]')
        ylabel('x_{3}(t)=\theta_{2}(t)[rad]')
        hold on, grid on
    subplot(2,2,4), plot(T,x(:,4),'b')
        title('Velocidad de la masa 2')
        xlabel('Tiempo [seg]')
        ylabel('x_{4}(t)=\omega_{2}(t)[rad/s]')
        hold on, grid on

%% Item c
    % matrices
    A = [0,1,0,0; -K1/J1,-b2/J1,K1/J1,0; 0,0,0,1; K1/J2,0,(-K1-K2)/J2,-b1/J2];
    B = [0;1/J1;0;0];
    C = [1,0,0,0];
    D = 0;

    % funcion transferencia
    [num,den] = ss2tf(A,B,C,D);
    G = tf(num,den);

 %% Item e
    % calculo de polos
    polos = roots(den);
    ceros = roots(num);

%% Item d
    % bode
    figure(2)
    bode(num,den), grid on

%% Item f
   P1_datos_experimentales
   tExp = evol(:,2);
   x1Exp = evol(:,4)/2544;
   x2Exp = evol(:,5)/2544;
   
   figure(3)
    subplot(2,1,1), plot(T,x(:,1),'r',tExp, x1Exp, 'b'),
        title('Posicion de la masa 1')
        legend('Teorica','Experimental')
        xlabel('Tiempo [seg]')
        ylabel('x_{1}(t)=\theta_{1}(t)[rad]')
        hold on, grid on
    subplot(2,1,2), plot(T,x(:,3),'r',tExp, x2Exp, 'b')
        title('Posicion de la masa 2')
        legend('Teorica','Experimental')
        xlabel('Tiempo [seg]')
        ylabel('x_{3}(t)=\theta_{2}(t)[rad]')
        hold on, grid on
