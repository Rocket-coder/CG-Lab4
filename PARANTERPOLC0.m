%PARANTERPOLC0;
TS='C0-interpolation ';
t0=0; t1=2*pi;  % the interval 
N=19; %13;          % number of points
if (mod(N-1,6)~=0); error('Wrong number of points'); end
%L=[Xmin, Xmax, Ymin, Ymax] % bounds of the region
l=6; L=[-l, l, -l, l];   
[XF,YF,X,Y,T] = ParametCurve(t0,t1,N,L);
t1=T(N);
pause
hold off
%---- Quadratic C0-interpolation -------------------
TSC=['Parametric Quadratic ',TS];
printstring(['---- ',TSC],' ----')
M2=(N-1)/2;  % number of intervals for quadratic C0-interpolation
for k=1:M2
       ParaQuadInterC0(X,Y,T,2*k-1,L); 
       pause
end
PlotCurve(XF,YF,L,1,TSC);
hold off
pause
printstring(' ',' ')
%---- Cubic approximation -------------------
TSC=['Parametric Cubic ',TS];
printstring(['---- ',TSC],' ----')
M3=(N-1)/3; % number of intervals for cubic C0-interpolation
for k=1:M3
     ParaCubicInterC0(X,Y,T,3*k-2,L);
     pause
end
PlotCurve(XF,YF,L,1,TSC);
hold off