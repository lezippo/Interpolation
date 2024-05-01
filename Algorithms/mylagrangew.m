function [f,w]=mylagrangew(xdata,ydata,z)
% Purpose: interpolate points (xdata(i),ydata(i)) (called nodes) with a
% polynomial function
%
% Syntax: f=mylagrange(xdata,ydata,z)
% Input:
% xdata:   vector containing the abscissas of the nodes to interpolate,
%          WARNING: the abscissas of the nodes (elements of xdata) must be
%          all distinct
% ydata:   vector containing the ordinates of the nodes to interpolate
% z:       vector of "intermediate" abscissas on which to compute
%          the values of the interpolating polynomial. We know the value of
%          the polynomial at the nodes, we compute it at many points BETWEEN
%          the nodes to reconstruct the behavior of the phenomenon.
% Output:
% f:       values of the interpolating polynomial at the points in the z vector
% w:       values of the nodal polynomial at the points in the z vector
% Example:
% xdata=0:2:24;
% ydata=[59 56 53 54 60 67 72 74 75 74 70 65 61];
% z=linspace(0,24,241);
%
% f=mylagrange(xdata,ydata,z);
%
% Author: Zippo Luigi Emanuele

n=length(xdata);   % number of nodes
m=length(z);       % number of given points

% Allocate some vectors for:

L=ones(n,m);       % base polynomials
f=zeros(1,m);      % values of the interpolating polynomial
w=ones(1,m);       % values of the nodal polynomial at the abscissas contained in z
dw=ones(1,n);      % values of the first derivative of the nodal polynomial at the abscissas contained in z

% Evaluate the nodal polynomial at the abscissas contained in z

for i=1:n

    w=w.*(z-xdata(i));

end

for i=1:n

    for j=1:n

        if j~=i
   
            % Evaluate the first derivative of the nodal polynomial at the
            % abscissas contained in z

            dw(i)=dw(i)*(xdata(i)-xdata(j));

        end
    end

    % Evaluate the nodal polynomial using the barycentric formula

    L(i,:)=1./((z-xdata(i)).*dw(i));

    f=f+ydata(i)*L(i,:);

end

f=f.*w;

end

