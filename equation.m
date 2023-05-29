function [y,Name]=equation(x)
C=[0.646,-1.111,1.243,-1.315,0.755];
Name='y=0.65x-1.11sin(1.24x)-1.31cos(0.75x)';
y=C(1)*x+C(2)*sin(C(3)*x)+C(4)*cos(C(5)*x);
end

