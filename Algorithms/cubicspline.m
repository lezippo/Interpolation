function spval=cubicspline(xdata,ydata,zval)
% Purpose: interpolate points (xdata(i),ydata(i)) (called nodes) with a natural cubic spline
%
% Syntax:  spval=cubicspline(xdata,ydata,zval)
% Input:
% xdata:   vector containing the abscissas of the nodes to interpolate,
%          WARNING: the abscissas of the nodes (elements of xdata) must be in ascending order
% ydata:   vector containing the ordinates of the nodes to interpolate
% zval:    vector of abscissas ("intermediate", see example) on which to compute
%          spline values
% Output:
% spval:   spline values
%
% Example:
% xdata=[0 1.525 3.050 4.575 6.10 7.625 9.15];
% ydata=[1 0.8617 0.7385 0.6292 0.5328 0.4481 0.3741];
%
% zval=linspace(0,9.15)
% take 100 (or more) points between xdata(1) and xdata(7) (to compute the
% spline between two nodes we need zval. The points of zval
% also fall BETWEEN the nodes)
%
% spval=cubicspline(xdata,ydata,zval)
%
% author: Zippo Luigi Emanuele


% The algorithm computes the values of a natural CUBIC spline, which can
% be written in the form:
% sj(x)=aj +bj(x−xj)+cj(x−xj)^2 +dj(x−xj)^3
%
% Therefore, we determine the coefficients a,b,c,d

n=length(xdata);
m=length(zval);

A=zeros(n);
b=zeros(1,n);
d=zeros(1,n);
A(1,1)=1;
A(n,n)=1;
h=zeros(1,n-1);
delta=zeros(n,1);

for i=1:n-1
    
    h(i)=xdata(i+1)-xdata(i);

end

for i=2:(n-1)

    for j=1:n

        if i==j

            A(i,j)=2*(h(i-1)+h(i));
            A(i,j-1)=h(i-1);
            A(i,j+1)=h(i);

        end

    end

delta(i)=3/h(i)*(ydata(i+1)-ydata(i))-3/h(i-1)*(ydata(i)-ydata(i-1));

end

% the vector of coefficients c can be calculated as the solution of the
% system A*x=delta

c=A\delta;

for i=1:n-1

    d(i)=(c(i+1)-c(i))/(3*h(i));
    b(i)=(ydata(i+1)-ydata(i))/h(i)-h(i)/3*(c(i+1)+2*c(i));

end

a=ydata;

% Horner's algorithm

for i=1:m

    for j=1:n-1

        if zval(i)>=xdata(j) && zval(i)<=xdata(j+1)

            spval(i)=d(j);
            spval(i)=spval(i)*(zval(i)-xdata(j))+c(j);
            spval(i)=spval(i)*(zval(i)-xdata(j))+b(j);
            spval(i)=spval(i)*(zval(i)-xdata(j))+a(j);

        end

        
    end

end

end
