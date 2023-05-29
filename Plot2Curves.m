function Plot2Curves(X1,Y1,Name1,X2,Y2,Name2,L,w,MT)
% 
set(gcf,'Color','w') 
subplot(1,2,1)
%-- Curve 1 --------------------------------------------
plot(X1,Y1,'-ko','LineWidth',w,'MarkerEdgeColor','k',...
               'MarkerFaceColor','k','MarkerSize',1);     
%hold on     
set(gca,'XColor','b','YColor','b','fontsize',14,'fontweight','b');
ts1='\fontsize{20}\bf\color{red}';
ts3='\fontsize{20}\bf\color{blue}';
xlabel([ts3,'t']); ylabel([ts3,'x']); 
title([ts1,Name1]);
axis(L);
axis square
grid on
hold off
%---------------------------------------------------------
subplot(1,2,2)
%-- Curve 2 --------------------------------------------
plot(X2,Y2,'-ko','LineWidth',w,'MarkerEdgeColor','k',...
               'MarkerFaceColor','k','MarkerSize',1);     
%hold on       
%---------------------------------------------------------
set(gca,'XColor','b','YColor','b','fontsize',14,'fontweight','b');
ts1='\fontsize{20}\bf\color{red}';
ts3='\fontsize{16}\bf\color{blue}';
xlabel([ts3,'t']); ylabel([ts3,'y']); 
title([ts1,Name2]);
axis(L);
axis square
grid on
if ~isempty(MT);
    p2t=mtit(MT,... 
         'FontName',  'Arial',...
         'FontAngle', 'normal',...
         'FontWeight','bold',...
         'fontsize',24,...
         'color','k',... %[0.3 .5 0.3],... %'b',...
	     'xoff',0.0,'yoff',-0.02);
    set(gcf,'Color','w')
end;    
%axis equal
hold off 
end

