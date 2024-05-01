x=[1200.5 1201.5 1202.5 1203 1204 1205];
y=[3 1.5 1.5 1 1 0];
z=linspace(1200.5,1205,1000);

pol=mylagrange(x,y,z);

hold on
plot(x,y,'k.')
plot(z,pol,'m',Linewidth=1.5)

V=vander(x);

a=V\y';

% valutiamo il polinomio a(1)+a(2)*x+a(3)*x^2+... nei valori di z

pol2=polyval(a,z);

plot(z,pol2,'b');

% The system V*a=y' is ill-conditioned: the matrix V, i.e. the matrix of Vandrmonde, amplifies the error. Consequently, the graph of the polynomial obtained by solving the linear system is extremely perturbed.

spval=spline(x,y,z);
plot(z,spval,Linewidth=1.5)

legend('nodi','pol. interpolante','Vandermonde','spline')
