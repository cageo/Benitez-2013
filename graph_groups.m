function graph_groups(X,etiquetas)


color=['b', 'g', 'r','y','c','k','m'];
color_shape={'ob', 'og', 'or','oy','oc','ok','om','sb', 'sg', 'sr','sy','sc','sk','sm'};
j=round(14*rand);
if size(X,2)==2
    figure
    plot(X(:,1),X(:,2),color_shape{j},'MarkerEdgeColor',color(mod(j,7)+1),...
                'MarkerFaceColor',color(mod(j,7)+1), 'Markersize',3)
    hold on
    xlabel(etiquetas{1},'FontSize',14,'FontName','Times New Roman')
    ylabel(etiquetas{2},'FontSize',14,'FontName','Times New Roman')
    title(etiquetas{end},'FontSize',14,'FontName','Times New Roman')
    grid on
    
elseif size(X,2)==3
    figure
    plot3(X(:,1),X(:,2),X(:,3),color_shape{j},'MarkerEdgeColor',color(mod(j,7)+1),...
                    'MarkerFaceColor',color(mod(j,7)+1), 'Markersize',3)
    hold on
    xlabel(etiquetas{1},'FontSize',14,'FontName','Times New Roman')
    ylabel(etiquetas{2},'FontSize',14,'FontName','Times New Roman')
    zlabel(etiquetas{3},'FontSize',14,'FontName','Times New Roman')
    title(etiquetas{end},'FontSize',14,'FontName','Times New Roman')
    grid on
    
else
    
end