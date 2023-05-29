function ParaCubicInterC0(X,Y,T,k,L);
% Cubic polynomial y=a+bx+cx^2+dx^3 throuth four points 
x0=X(k); x1=X(k+1); x2=X(k+2); x3=X(k+3);
y0=Y(k); y1=Y(k+1); y2=Y(k+2); y3=Y(k+3);
t0=T(k); t1=T(k+1); t2=T(k+2); t3=T(k+3);
%-------------------------------------------------- 
Px = [x0, x1, x2, x3];
Py = [y0, y1, y2, y3];
%---Coefficients-----------------------------------
C = [1, t0, t0^2, t0^3;...
     1, t1, t1^2, t1^3;...
     1, t2, t2^2, t2^3;...
     1, t3, t3^2, t3^3];
Ay = C\Py';
ay = Ay(1); by = Ay(2); cy = Ay(3); dy = Ay(4);
Ay1=[dy,cy,by,ay];             % for output
Ax = C\Px';
ax = Ax(1); bx = Ax(2); cx = Ax(3); dx = Ax(4);
Ax1=[dx,cx,bx,ax];             % for output
%----Arrays of coordinates ------------------------
dt=0.05;
Nt=round(abs((t3-t0)/dt));
%Nt=5;
X=zeros(Nt+1,1); Y=zeros(Nt+1,1);
%err=0;
for p=0:Nt;
    t=t0+p*dt;
    X(p+1)=polynom3(ax,bx,cx,dx,t);
    Y(p+1)=polynom3(ay,by,cy,dy,t);
end;
%--- Output ---------------------------------------
% L=[Xmin, Xmax, Ymin, Ymax] % bounds of the region
l=6; L=[-l, l, -l, l];
sx0=polynom2(bx,2*cx,3*dx,t0);
sx3=polynom2(bx,2*cx,3*dx,t3);
sy0=polynom2(by,2*cy,3*dy,t0);
sy3=polynom2(by,2*cy,3*dy,t3);
SlopeX0=['x_t''(',number2str(t0,7,1),')=',number2str(sx0,7,2)];
SlopeX3=['x-t''(',number2str(t3,7,1),')=',number2str(sx3,7,2)];
SlopeY0=['y_t''(',number2str(t0,7,1),')=',number2str(sy0,7,2)];
SlopeY3=['y_t''(',number2str(t3,7,1),')=',number2str(sy3,7,2)];
Slope=[SlopeX0,blanks(6),SlopeY0,blanks(6),...
       SlopeX3,blanks(6),SlopeY3];
% PName=poly2str(A1); Name=['y= ',PName];
% W=['For ',vec2strfloat([x0,x3],7,1),' : '];
% printstring(W,[Name,',  ',Slope]);
% DrawSpline3(X,Y,Px,Py,L,k,[W,Name],Slope);  
PyName=poly2str2(Ay1); PyName=['y= ',PyName];
PxName=poly2str2(Ax1); PxName=['x= ',PxName];
W=['For t\in',vec2strfloat([t0,t3],7,2),' : '];
printstring([W,PxName,',  '],PyName);
DrawParaSpline(X,Y,Px,Py,L,k,[W,PxName],PyName,Slope);
end

