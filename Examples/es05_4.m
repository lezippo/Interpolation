xdata=[0 0.169 0.516 0.960 1.328 1.370 1.447 1.884 2.203 2.544 2.919 3.731 4.572 4.620 4.673 4.775 4.781 4.788 4.803 4.827 4.858 4.873 4.9];
ydata=[0.652 0.784 0.964 1.075 1.103 1.103 1.131 1.339 1.464 1.506 1.499 1.214 1.193 1.186 1.213 1.220 1.211 1.175 1.160 1.023 0.883 0.849 0.779];
n=length(xdata);
zval=linspace(0,4.9,1000);

spval=cubicspline(xdata,ydata,zval);

figure(1)
plot(xdata,ydata,'k.',zval,spval,'m')
axis equal

polval=mylagrange(xdata,ydata,zval);

figure(2)
plot(xdata,ydata,'k.',zval,polval,'b')

