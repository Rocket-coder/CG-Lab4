function [sx2,sy2]=ParaCubicInterpC1(X,Y,T,sx,sy,k,L);
% Cubic polynomial y=a+bt+ct^2+dt^3 throuth three points
% and with the given slope s0 at the initial point (xk,yk)
x0=X(k); x1=X(k+1); x2=X(k+2); 
y0=Y(k); y1=Y(k+1); y2=Y(k+2); 
t0=T(k); t1=T(k+1); t2=T(k+2);
%-------------------------------------------------- 
Px = [x0, x1, x2];      Py = [y0, y1, y2];
Vx = [x0; x1; x2; sx];  Vy = [y0; y1; y2; sy];    
%---Coefficients-----------------------------------
C = [1, t0, t0^2,   t0^3;...
     1, t1, t1^2,   t1^3;...
     1, t2, t2^2,   t2^3;...
     0,  1, 2*t0, 3*t0^2];
Ay = C\Vy;
ay = Ay(1); by = Ay(2); cy = Ay(3); dy=Ay(4);
Ay1=[dy,cy,by,ay];                 % for output
Ax = C\Vx;
ax = Ax(1); bx = Ax(2); cx = Ax(3); dx=Ax(4);
Ax1=[dx,cx,bx,ax]; 
%----Arrays of coordinates ------------------------
dt=0.05;
Nt=round(abs((t2-t0)/dt));
X=zeros(Nt+1,1); Y=zeros(Nt+1,1);
for p=0:Nt;
    t=t0+p*dt;
    X(p+1)=polynom3(ax,bx,cx,dx,t);
    Y(p+1)=polynom3(ay,by,cy,dy,t);
end;
%--- Output ---------------------------------------
sx0=polynom2(bx,2*cx,3*dx,t0);
sx2=polynom2(bx,2*cx,3*dx,t2);
sy0=polynom2(by,2*cy,3*dy,t0);
sy2=polynom2(by,2*cy,3*dy,t2);
SlopeX0=['x_t''(',number2str(t0,7,1),')=',number2str(sx0,8,3)];
SlopeX2=['x_t''(',number2str(t2,7,1),')=',number2str(sx2,8,3)];
SlopeY0=['y_t''(',number2str(t0,7,1),')=',number2str(sy0,8,3)];
SlopeY2=['y_t''(',number2str(t2,7,1),')=',number2str(sy2,8,3)];
Slope=[SlopeX0,blanks(6),SlopeY0,blanks(6),...
       SlopeX2,blanks(6),SlopeY2];
PyName=poly2str2(Ay1); PyName=['y= ',PyName];
PxName=poly2str2(Ax1); PxName=['x= ',PxName];
W=['For t\in',vec2strfloat([t0,t2],7,2),': '];
printstring([W,PxName,',  '],PyName);
printstring('---   ',Slope);
DrawParaSpline(X,Y,Px,Py,L,k,[W,PxName],PyName,Slope); 
end
   
   
   
   




