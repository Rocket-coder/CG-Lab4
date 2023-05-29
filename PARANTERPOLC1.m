%PARANTERPOLC1;
TS='C1-interpolation ';
t0=0; t1=2*pi;  % the interval 
N=19; %13;          % number of points
if (mod(N-1,2)~=0); error('Wrong number of points'); end
%L=[Xmin, Xmax, Ymin, Ymax] % bounds of the region
l=6; L=[-l, l, -l, l];   
[XF,YF,X,Y,T] = ParametCurve(t0,t1,N,L);
t1=T(N);
pause
hold off
%error('Stop')
%------------------------------------------------------
inSX=0.13; inSY=1.13;          % any slope
%inSX=0.092; inSY=1.676;    % from quadratic C0
%inSX=0.26; inSY=1.73;   % from cubic C0
%inSX=0.2997; inSY=1.5606; % perfect
%------------------------------------------------------
SlopeX0=['x_t''(',number2str(t0,7,1),')=',number2str(inSX,8,3)];
SlopeY0=['y_t''(',number2str(t0,7,1),')=',number2str(inSY,8,3)];
InSlope=[SlopeX0,',',blanks(3),SlopeY0]; 
%---- Quadratic C1-interpolation -------------------
TSC=['Parametric Quadratic ',TS];
 printstring(['---- ',TSC],' ----')
M2=N-1;  % number of intervals for quadratic C1-interpolation
sx0=inSX; sy0=inSY;
for k=1:M2
        [sx1,sy1]=ParaQuadInterpC1(X,Y,T,sx0,sy0,k,L); 
        sx0=sx1;  sy0=sy1;
        pause
end
Title=[TSC,' for ',InSlope];
PlotCurve(XF,YF,L,1,Title);
hold off
pause
printstring(' ',' ')
%---- Cubic C1-approximation -------------------
TSC=['Parametric Cubic ',TS];
printstring(['---- ',TSC],' ----')
M3=(N-1)/2; % number of intervals for cubic C0-interpolation
sx0=inSX; sy0=inSY;  % from cubic C0
for k=1:M3
      [sx2,sy2]=ParaCubicInterpC1(X,Y,T,sx0,sy0,2*k-1,L);
            sx0=sx2;  sy0=sy2;
      pause
end    
Title=[TSC,' for ',InSlope];
PlotCurve(XF,YF,L,1,Title);
hold off