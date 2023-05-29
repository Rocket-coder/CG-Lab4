function ParaQuadInterC0(X,Y,T,k,L)
% Quadratic polynomial y=a+bx+cx^2 throuth three points 
x0=X(k); x1=X(k+1); x2=X(k+2);
y0=Y(k); y1=Y(k+1); y2=Y(k+2);
t0=T(k); t1=T(k+1); t2=T(k+2);
%-------------------------------------------------- 
Px = [x0, x1, x2];
Py = [y0, y1, y2];
%---Coefficients-----------------------------------
C = [1, t0, t0^2;...
     1, t1, t1^2;...
     1, t2, t2^2];
Ay = C\Py';
ay = Ay(1); by = Ay(2); cy = Ay(3);
Ay1=[cy,by,ay];                         % for output
Ax = C\Px';
ax = Ax(1); bx = Ax(2); cx = Ax(3);
Ax1=[cx,bx,ax];                         % for output
%----Arrays of coordinates ------------------------
dt=0.05;
Nt=round(abs((t2-t0)/dt));
X=zeros(Nt+1,1); Y=zeros(Nt+1,1);
% err=0;
for p=0:Nt
    t=t0+p*dt;
    X(p+1)=polynom2(ax,bx,cx,t);
    Y(p+1)=polynom2(ay,by,cy,t);
end
%--- Output ---------------------------------------
% L=[Xmin, Xmax, Ymin, Ymax] % bounds of the region
%l=6; L=[-l, l, -l, l];
sx0=2*cx*t0+bx;
sx2=2*cx*t2+bx;
sy0=2*cy*t0+by;
sy2=2*cy*t2+by;
SlopeX0=['x_t''(',number2str(t0,7,1),')=',number2str(sx0,8,3)];
SlopeX2=['x-t''(',number2str(t2,7,1),')=',number2str(sx2,8,3)];
SlopeY0=['y_t''(',number2str(t0,7,1),')=',number2str(sy0,8,3)];
SlopeY2=['y_t''(',number2str(t2,7,1),')=',number2str(sy2,8,3)];
Slope=[SlopeX0,blanks(6),SlopeY0,blanks(6),...
       SlopeX2,blanks(6),SlopeY2];
PyName=poly2str2(Ay1); PyName=['y= ',PyName];
PxName=poly2str2(Ax1); PxName=['x= ',PxName];
W=['For t\in',vec2strfloat([t0,t2],7,2),' : '];
printstring([W,PxName,',  '],PyName);
DrawParaSpline(X,Y,Px,Py,L,k,[W,PxName],PyName,Slope); 
end

