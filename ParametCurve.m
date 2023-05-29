function [XF,YF,X,Y,T] = ParametCurve(t0,t1,N,L)
% N - number of points in the curve y=equation(x)
% [t0,t1] - interval
%-----------------------------------------------------
dt=0.01;
ra=1.5; rb=5.8;
TF=ceil(abs(t1-t0)/dt);
DN=ceil(TF/N)-1;
TFN=1+(N-1)*DN;
t2=TFN*dt-1;
R=zeros(TF,1);
XF=zeros(TF,1); YF=zeros(TF,1); TT=zeros(TF,1);
for k=1:TF
    t=t0+(k-1)*dt;
    [r,~]=parametric(t,t0,t1);  
    R(k)=r;   
    TT(k)=t;
end
Rma=max(R(:));  Rmi=min(R(:));
c=(rb-ra)/(Rma-Rmi);
RN=ra+c*(R-Rmi);
for k=1:TFN
    t=t0+(k-1)*dt;
    XF(k)=RN(k)*cos(t);
    YF(k)=RN(k)*sin(t);
end
dX=(XF(2)-XF(1))/dt; % derivative x'(t0)
dY=(YF(2)-YF(1))/dt; % derivative y'(t0)
SlopeX0=['x_t''(',number2str(t0,7,1),')=',number2str(dX,9,4)];
SlopeY0=['y_t''(',number2str(t0,7,1),')=',number2str(dY,9,4)];
Xname=['x(t) :     ',SlopeX0];
Yname=['y(t) :     ',SlopeY0];
[~,Name]=parametric(t0,t0,t1);
L1=[t0, t2, ra-0.5, rb+0.5]; 
Name1=['Normalized   ',Name];
PlotCurve(TT,RN,L1,3,Name1)
hold off
pause
L2=[t0, t2, -rb-0.5, rb+0.5];
Plot2Curves(TT,XF,Xname,TT,YF,Yname,L2,3,Name1);
hold off
pause
X=zeros(N,1);
Y=zeros(N,1);
T=zeros(N,1);
for k=1:N
    s=1+(k-1)*DN;
    X(k)=XF(s); Y(k)=YF(s); T(k)=TT(s); 
end
XF=XF(1:TFN); YF=YF(1:TFN);
%------------------------------------------------------
Title=['System of ',int2str(N),' ponts based on ',Name];
PlotPoints(X,Y,L,Title); 
hold on 
pause
PlotCurve(XF,YF,L,1,Title); 
%hold off
end

