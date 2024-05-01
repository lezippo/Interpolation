g=@(x) 1./(1+25*x.^2);
z=linspace(-1,1);
gz=g(z);

xdata4=linspace(-1,1,5);
ydata4=g(xdata4);
[f4,w4]=mylagrangew(xdata4,ydata4,z);
err4=abs(f4-gz);


xdata8=linspace(-1,1,9);
ydata8=g(xdata8);
[f8,w8]=mylagrangew(xdata8,ydata8,z);
err8=abs(f8-gz);

 
xdata16=linspace(-1,1,17);
ydata16=g(xdata16);
[f16,w16]=mylagrangew(xdata16,ydata16,z);
err16=abs(f16-gz);


figure (1)
hold on
plot(xdata4,ydata4,'o',xdata8,ydata8,'x',xdata16,ydata16,'*')
plot(z,f4,z,f8,z,f16)
fplot(g,[-1,1],'k')
legend('n=4','n=8','n=16')

figure (2)
hold on
plot(z,err4,'r--',z,err8,'b--',z,err16,'g--')
plot(z,w4,'r',z,w8,'b',z,w16,'g')
legend('err4','err8','err16','w4','w8','w16')








% using Chebyshev's nodes

a=-1;
b=1;

n=4;
xcheby4=zeros(n+1,1);

for k=1:n+1
xcheby4(k)=(a+b)/2+(b-a)/2*cos((2*k+1)/(2*(n+2))*pi);
end

ycheby4=g(xcheby4);
[f4,w4]=mylagrangew(xcheby4,ycheby4,z);
ERR4=abs(f4-gz);



n=8;
xcheby8=zeros(n+1,1);

for k=1:n+1
xcheby8(k)=(a+b)/2+(b-a)/2*cos((2*k+1)*pi/(2*(n+2)));
end

ycheby8=g(xcheby8);
[f8,w8]=mylagrangew(xcheby8,ycheby8,z);
ERR8=abs(f8-gz);



n=16;
xcheby16=zeros(n+1,1);

for k=1:n+1
xcheby16(k)=(a+b)/2+(b-a)/2*cos((2*k+1)*pi/(2*(n+2)));

end
ycheby16=g(xcheby16);
[f16,w16]=mylagrangew(xcheby16,ycheby16,z);
ERR16=abs(f16-gz);



figure (3)
hold on
plot(xcheby4,ycheby4,'o',xcheby8,ycheby8,'x',xcheby16,ycheby16,'*')
plot(z,f4,z,f8,z,f16)
fplot(g,[-1,1],'k')
legend('n=4','n=8','n=16')

figure (4)
hold on
plot(z,ERR4,'r--',z,ERR8,'b--',z,ERR16,'g--')
plot(z,w4,'r',z,w8,'b',z,w16,'g')
legend('err4','err8','err16','w4','w8','w16')

figure (5)
hold on
plot(z,err4,'r',z,err8,'b',z,err16,'g')
plot(z,ERR4,'r--',z,ERR8,'b--',z,ERR16,'g--')
legend('n=4','n=8','n=16','n=4, Chebyshev','n=8, Chebyshev','n=16, Chebyshev')

% in Figure 5 we can see how the error behaves by choosing equidistant nodes or Chebyshev nodes. In the central part of the graph we do not notice any major differences between the 2 distributions, but proceeding towards the extremes, the Chebyshev nodes greatly reduce the error
