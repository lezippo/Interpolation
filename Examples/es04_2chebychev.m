g=@(x) 1./(1+25*x.^2)
a=-1;
b=1;
z=linspace(-1,1);
gz=g(z);

n=4;
xcheby4=zeros(n+1,1);
for k=1:n+1
xcheby4(k)=(a+b)/2+(b-a)/2*cos((2*k+1)/(2*(n+2))*pi);
end
ycheby4=g(xcheby4);
[f4,w4]=mylagrangew(xcheby4,ycheby4,z);
err4=abs(f4-gz);
spval4=spline(xcheby4,ycheby4,z);

n=8;
xcheby8=zeros(n+1,1);
for k=1:n+1
xcheby8(k)=(a+b)/2+(b-a)/2*cos((2*k+1)*pi/(2*(n+2)));
end
ycheby8=g(xcheby8);
[f8,w8]=mylagrangew(xcheby8,ycheby8,z);
err8=abs(f8-gz);
spval8=spline(xcheby8,ycheby8,z);

n=16;
xcheby16=zeros(n+1,1);
for k=1:n+1
xcheby16(k)=(a+b)/2+(b-a)/2*cos((2*k+1)*pi/(2*(n+2)));
end
ycheby16=g(xcheby16);
[f16,w16]=mylagrangew(xcheby16,ycheby16,z);
err16=abs(f16-gz);
spval16=spline(xcheby16,ycheby16,z);

figure (1)
hold on
plot(xcheby4,ycheby4,'o',xcheby8,ycheby8,'x',xcheby16,ycheby16,'*')
plot(z,f4,z,f8,z,f16)
fplot(g,[-1,1],'k')

figure (2)
hold on
plot(z,err4,'r--',z,err8,'b--',z,err16,'g--')
plot(z,w4,'r',z,w8,'b',z,w16,'g')

figure(3)
hold on
plot(xcheby4,ycheby4,'o',xcheby8,ycheby8,'x',xcheby16,ycheby16,'*')
plot(z,spval4,z,spval8,z,spval16)

