function [X, Xp, Pf, buffer,r]= perframe(X,p,l)
% X: Conjunto de datos
% Xp: Retorna el porcentaje de datos 
%     definido por p, a partir de la media
% p: porcentaje de 0 - 100
% Pf: contorno del percentile frame

N=length(X);
center=mean(X);

dist=zeros(N,l);
for k=1:N
    dist(k,:)=norm(center-X(k,:),2);
end
[dist,I]=sort(dist,'ascend');
Xp=X(I(1:round(size(X,1)*p/100)),:);

buffer=X(I(1+round(size(X,1)*p/100):length(I)),:);

% genera el contorno del percentile frame
t=0:2*pi/20:2*pi;
r=dist(round(size(X,1)*p/100));
Pf=zeros(length(t),2);
Pf(:,1)=(r*cos(t) + center(1,1))';
Pf(:,2)=(r*sin(t)+center(1,2))';

% plot(X(:,1),X(:,2),'o',...
%                    'LineWidth',1,...
%                    'MarkerEdgeColor','k',...
%                    'MarkerFaceColor','k',...
%                    'MarkerSize',1)
% hold on
% % plot(Xuniforme(:,1),Xuniforme(:,2),'x',...
% %                      'LineWidth',1,...
% %                      'MarkerEdgeColor','b',...
% %                      'MarkerFaceColor','b',...
% %                      'MarkerSize',4)
% % hold on
% ot(Xp(:,1),Xp(:,2),'o',...
%                      'LineWidth',1,...
%                      'MarkerEdgeColor','g',...
%                      'MarkerFaceColor','g',...
%                      'MarkerSize',1)
% hold on
% 
% % plot(Pf(:,1),Pf(:,2),'r-')
% axis([-0.6 0.6 -0.6 0.6])
% xlabel('Este','FontSize',14,'FontName','Times New Roman')
% ylabel('Norte','FontSize',14,'FontName','Times New Roman')
% % legend('x_{i} \in X | x_{i,3} \leq 40 ','Percentile frame','FontSize',14,'FontName','Times New Roman')
% axis([-0.6 0.6 -0.6 0.6])



end
