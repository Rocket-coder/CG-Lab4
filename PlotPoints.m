function PlotPoints(Px,Py,L,Name)
% 
np=size(Px,1); % number of points
set(gcf,'Color','w') 
subplot(1,1,1)
%-- Origin ---------------------------------------------
d = 0.3;
ts0='\fontsize{16}\bf\color{black}';
if ((L(1)*L(2)<=0)&(L(3)*L(4)<=0));
    plot(0,0,  '-ko','LineWidth',1,'MarkerEdgeColor','k',...
                     'MarkerFaceColor','k','MarkerSize',10); 
    text(-d, d, [ts0,'O']);             
end;                 
hold on
%-- Corners ---------------------------------------------
plot(L(1),L(3),'-go','LineWidth',1,'MarkerEdgeColor','b',...
                 'MarkerFaceColor','b','MarkerSize',5);
hold on            
plot(L(2),L(3),'-go','LineWidth',1,'MarkerEdgeColor','b',...
                 'MarkerFaceColor','b','MarkerSize',5);
hold on            
plot(L(1),L(4),'-go','LineWidth',1,'MarkerEdgeColor','b',...
                 'MarkerFaceColor','b','MarkerSize',5);
            
plot(L(2),L(4),'-go','LineWidth',1,'MarkerEdgeColor','b',...
                 'MarkerFaceColor','b','MarkerSize',5); 
hold on             
%-- Curve --------------------------------------------
%plot(X,Y,'-bo','LineWidth',2,'MarkerEdgeColor','k',...
%               'MarkerFaceColor','k','MarkerSize',1);     
%hold on       
%-- Points -------------------------------------
d = 0.15;
ts2='\fontsize{16}\bf\color{blue}';
for p=0:np-1;
  plot(Px(p+1),Py(p+1),'-ko','LineWidth',1,'MarkerEdgeColor','r',...
                 'MarkerFaceColor','r','MarkerSize',8);   
  ps=int2str(p);
  text(Px(p+1)+d, Py(p+1), [ts2,'P_{',ps,'}']);       
  hold on
end;
%---------------------------------------------------------
set(gca,'XColor','b','YColor','b','fontsize',14,'fontweight','b');
ts1='\fontsize{20}\bf\color{red}';
title([ts1,Name]);  
ts3='\fontsize{16}\bf\color{black}';
xlabel([ts3,'x']); ylabel([ts3,'y']); 
%xlabel([ts3,Slope]); 
axis(L);
axis square; %axis tight; %axis equal 
grid on
%hold off
end
%
