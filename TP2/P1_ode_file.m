
function dx=P1_ode_file(t,x)

P1_datos

if t < D
    T = 0.5;
else
    T = 0;
end
dx = [
    x(2);
    (1/J1)*(T - b2*x(2) - K1*(x(1) - x(3)));
    x(4);
    (1/J2)*(-b1*x(4) - K1*(x(3) - x(1)) - K2*x(3));
];

