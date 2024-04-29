% autore: Zippo Luigi Emanuele

axis equal
hold on

% viso, parte inferiore

xdata=[0.2514    0.2567    0.2701    0.2864    0.3145    0.3560    0.3974    0.4730    0.5426    0.6078]*10^3;
ydata=[-0.9866   -1.0191   -1.0576   -1.0843   -1.1169   -1.1465   -1.1628   -1.1821   -1.1895   -1.1910]*10^3;
zval=linspace(251.4,607.8,1000);

spval=cubicspline(xdata,ydata,zval);
plot(zval,spval,'r',-zval+2*607.8,spval,'r','LineWidth',2)

% viso, parte superiore

xdata=[251.4  262.6583  290.7996  327.8276  401.8837  511.4866  607.8];
ydata=[-986.6 -885.8398-34 -856.2174 -829.5572 -796.9726 -779.1991 -773.2747];
zval=linspace(251.4,607.8,1000);

spval=cubicspline(xdata,ydata,zval);
plot(zval,spval,'r',-zval+2*607.8,spval,'r','LineWidth',2)





% testa, parte inferiore

xdata=[25.6790   27.1602   32.0469   52.8203   81.4050  108.6218  157.4988  206.3758  251.4];
ydata=[-651.8228 -697.7375 -755.5012 -808.8216 -857.6985 -888.8021 -928.7923 -959.8959 -986.6];
zval=linspace(25.6790,251.4,1000);

spval=cubicspline(xdata,ydata,zval);
plot(zval,spval,'r',-zval+2*607.8,spval,'r','LineWidth',2)

%testa, parte superiore

xdata=[25.6790   30.1224   39.0091   52.3392   73.0749  104.1784  141.2065 197.4890  252.2905  326.3465  401.8837  483.3453  551.4769  589.9860  607.8];
ydata=[-651.8228 -588.1346 -540.7387 -493.3429 -440.0225 -368.9287 -308.2028 -235.6279 -180.8264 -127.5061  -84.5536  -56.4123  -43.0822  -41.6011  -41.6011];
zval=linspace(25.6790,607.8,1000);

spval=cubicspline(xdata,ydata,zval);
plot(zval,spval,'r',-zval+2*607.8,spval,'r','LineWidth',2)





%cerchio laterale, parte inferiore

xdata=[34.039   65.2253   91.9505  113.6648  125.3571  140.3901  152.0824  163.7747  172.1264  177.1374];
ydata=[-763.4231 -760.0824 -738.3681 -711.6429 -691.5989 -656.5220 -624.7857 -584.6978 -544.6099 -514.5440];
zval=linspace(34.039,177.1374,1000);

spval=cubicspline(xdata,ydata,zval);
plot(zval,spval,'k',-zval+2*607.8,spval,'k','LineWidth',2)

%cerchio laterale, parte superiore

xdata=[142.0604  153.7527  163.7747  170.4560  173.7967  175.4670 176.4 177.1374];
ydata=[-307.4231 -319.1154 -340.8297 -365.8846 -387.5989 -414.3242 -466 -514.5440];
zval=linspace(142.0604,177.1374,1000);

spval=cubicspline(xdata,ydata,zval);
plot(zval,spval,'k',-zval+2*607.8,spval,'k','LineWidth',2)





%cerchio centrale

xdata=[310.0542+4  311.5353+7  326.3465+7  354.4878+3  388.5536  421.1382  481.8642  538.1468  607.8];
ydata=[-349.6742 -303.7594 -250.4391+8 -192.6754 -151.2040 -121.5816  -86.0347  -66.7801  -56.4123];
zval=linspace(310.0542+4,607.8,1000);

spval=cubicspline(xdata,ydata,zval);
plot(zval,spval,'k',-zval+2*607.8,spval,'k',zval,-spval-2*349.6742,'k',-zval+2*607.8,-spval-2*349.6742,'k','LineWidth',2)





% occhi

xdata=[451.0714+10 457.7527+5  461.0934+5  464.4341+5  471.1154+4  479.4670  491.1593  504.5220  512.8736  514.5440 519.5549-4];
ydata=[-922.1044 -892.0385 -875.3352+9 -858.6319+5 -845.2692+5 -835.2473 -831.9066 -840.2582 -860.3022 -882.0165 -922.1044];
zval=linspace(451.0714+10,519.5549-4,1000);

spval=cubicspline(xdata,ydata,zval);
plot(zval,spval,'k',-zval+2*607.8,spval,'k','LineWidth',2)
plot(zval,-1850-spval,'k',-zval+2*607.8,-1850-spval,'k','LineWidth',2)

xdata=[461.071,461.071];
ydata=[-922.104, -927.896];

plot(xdata,ydata,'k',-xdata+2*607.8,ydata,'k','LineWidth',2)

xdata=[515.555,515.555];

plot(xdata,ydata,'k',-xdata+2*607.8,ydata,'k','LineWidth',2)
