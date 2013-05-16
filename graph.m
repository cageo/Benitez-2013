function graph(X,C,K,lab,axes_tag,handles)

% Visualizacion
if C==0
   C=zeros(K,size(X,2));
   for j=1:K
       C(j,:)=mean(X(lab==j,:));
   end
end
market_symbol={'.b', '.g', '.r','.c','.m','.y','.k' ...
               'ob', 'og', 'or','oc','om','oy','ok',...
               'xb', 'xg', 'xr','xc','xm','xy','xk',...
               '+b', '+g', '+r','+c','+m','+y','+k',...
               '*b', '*g', '*r','*c','*m','*y','*k',...
               'sb', 'sg', 'sr','sc','sm','sy','sk',...
               'db', 'dg', 'dr','dc','dm','dy','dk',...
               'vb', 'vg', 'vr','vc','vm','vy','vk',...
               'pb', 'pg', 'pr','pc','pm','py','pk',...
               'hb', 'hg', 'hr','hc','hm','hy','hk'};

figure
% if size(X,2)==2
    for j=1:K
        plot(handles.(axes_tag),X(lab==j,1),X(lab==j,2),market_symbol{mod(j-1,70)+1})
        hold on
    end
    plot(C(:,1),C(:,2),'+k')

%     xlabel(etiquetas{1},'FontSize',14,'FontName','Times New Roman')
%     ylabel(etiquetas{2},'FontSize',14,'FontName','Times New Roman')
%     title(etiquetas{3},'FontSize',14,'FontName','Times New Roman')
%     grid on
% end
% elseif size(X,2)>=3
%     for j= 1:K
%         Xclass=X(lab==j,:);
%         for i=1:length(Xclass)
%             tabla=[C(j,[1 2 3]); Xclass(i,[1 2 3])];
%             plot3(tabla(:,1)/1000,tabla(:,2)/1000,-tabla(:,3),strcat('',color_shape{j}),'MarkerEdgeColor',color(mod(j-1,7)+1),...
%                     'MarkerFaceColor',color(mod(j-1,7)+1), 'Markersize',2,'LineWidth',2)
%             hold on
%         end
% %         legend('cluster 9','cluster 11','cluster 12')
%     end
%     xlabel(etiquetas{1},'FontSize',14,'FontName','Times New Roman')
%     ylabel(etiquetas{2},'FontSize',14,'FontName','Times New Roman')
%     zlabel(etiquetas{3},'FontSize',14,'FontName','Times New Roman')
%     title(etiquetas{end},'FontSize',14,'FontName','Times New Roman')
%     
%     grid on
% end