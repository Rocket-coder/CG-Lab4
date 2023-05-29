function [sx1,sy1]=ParaQuadInterpC1(X,Y,T,sx,sy,k,L);
% Quadratic polynomial y=a+bx+cx^2 throuth two points
% and with the given slope s0 at the initial point (xk,yk)
%----------------------------------------------------
x0=X(k); x1=X(k+1); 
y0=Y(k); y1=Y(k+1); 
t0=T(k); t1=T(k+1);
%---------------------------------------------------- 
Px = [x0, x1];  Py = [y0, y1];  % Points 
Vy  = [y0; y1; sy];  Vx  = [x0; x1; sx];      % 
%--- Evaluation of Coefficients of the spline -------
C = [1, t0, t0^2;...
     1, t1, t1^2;...
     0,  1, 2*t0];
Ay = C\Vy;
ay = Ay(1); by = Ay(2); cy = Ay(3);
Ay1=[cy,by,ay];                         % for output
Ax = C\Vx;
ax = Ax(1); bx = Ax(2); cx = Ax(3);
Ax1=[cx,bx,ax];  
%----Arrays of coordinates ------------------------
dt=0.05;
Nt=round(abs((t1-t0)/dt));
X=zeros(Nt+1,1); Y=zeros(Nt+1,1);
for p=0:Nt;
    t=t0+p*dt;
    X(p+1)=polynom2(ax,bx,cx,t);
    Y(p+1)=polynom2(ay,by,cy,t);
end;
%--- Output ---------------------------------------
sx0=2*cx*t0+bx;
sx1=2*cx*t1+bx;
sy0=2*cy*t0+by;
sy1=2*cy*t1+by;
SlopeX0=['x_t''(',number2str(t0,7,1),')=',number2str(sx0,8,3)];
SlopeX1=['x_t''(',number2str(t1,7,1),')=',number2str(sx1,8,3)];
SlopeY0=['y_t''(',number2str(t0,7,1),')=',number2str(sy0,8,3)];
SlopeY1=['y_t''(',number2str(t1,7,1),')=',number2str(sy1,8,3)];
Slope=[SlopeX0,blanks(6),SlopeY0,blanks(6),...
       SlopeX1,blanks(6),SlopeY1];
PyName=poly2str2(Ay1); PyName=['y= ',PyName];
PxName=poly2str2(Ax1); PxName=['x= ',PxName];
W=['For t\in',vec2strfloat([t0,t1],7,2),': '];
printstring([W,PxName,',  '],PyName);
printstring('---   ',Slope);
DrawParaSpline(X,Y,Px,Py,L,k,[W,PxName],PyName,Slope); 
end
