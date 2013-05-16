function [H,Xuniforme]=HopkinsTestFunction(E,Po,X)
% -------------------------------------------------------------------------
% HOPKINS STATISTIC - WITH PERCENTILE FRAME
%
% PARÁMETROS DE ENTRADA:
%   X:      Conjunto de Datos, matriz de Nxl, donde N es el número de
%           patrones y l es la dimensionalidad.
%   Po:     Porcentaje de origenes de muestreo (El número de origenes de
%           muestreo de determindao por Po*N/100, Po <= 10).
%   E:      Número de Experimentos (number of montecarlo trials).

%
% PARÁMETROS DE SALIDA:
%   H:     Valor del estadístico de Hopkins, corresponde a un vector si
%           E>1; El número de experimentoa E es la longitud del vector.
%      
%
% Authors: Duque. D. P and Flórez. J. F
% Last revision: Sunday, May 01, 2011
% -------------------------------------------------------------------------

[N,l]=size(X);
M=round(N*(Po/100));
k=length(X(1,:)); 

% Standarization
j=ones(N,1);
X=(X-j*mean(X));
p=50;

% Xp datas into the percentile frame
% r percentile frame radius
[X, Xp, Pf, buffer,r]= perframe(X,p,k);


% preallocating memory for the M, l-dimentional sampling origins 
So=zeros(M,k); 

% It places the sampling origins (yj) into the percentile frame
counter=0;
while( counter < M )        
        origins =  zeros(1,l);
        [Sup_lim]=max(Xp); [Inf_lim]=min(Xp);
        for j=1:l
                origins(j) = Inf_lim(j) + (Sup_lim(j)-Inf_lim(j)).*rand(1,1);
        end    
        
        dist=norm(origins,2);
        if(dist<=r)
            agregar=ismember(origins,So,'rows'); 
            % si y no pertenece a H agregar=0;
            % se agrega y a H  
            if(agregar==0) 
                counter=counter+1;
                So(counter,:)=origins; 
            end
        end
end
Xuniforme=So; % Represents the Random Position Hypothesis (Ho)


% tic
h=zeros(E,1);
for q=1:length(h)

% Random Choice of M datas in Xp
[ir]=randperm(length(Xp));
tmp=Xp(ir,:);
X1=tmp(1:M,:);

%Construction of Statistic (h)
delta=zeros(M,1);
d=zeros(M,1);

X1buffer=[X1;buffer]; % market points + buffer

% Proximity Matrix uses euclidean distance as dissimilarity measure
deltatmp=eudist(X1,X1buffer);
dtmp=eudist(Xuniforme,X1buffer); 

for j=1:M
    % Compute the Nearest Neighbor distance between xj and X-{xj}
    delta(j)=min(deltatmp(j,deltatmp(j,:) ~= 0)); % Select the Nearest Neighbor to xj

    % Compute the Nearest Neighbor distance between yj in X' and X
    d(j)=min(dtmp(j,:)); % Select the Nearest Neighbor to yj
end

% Compute the Hopkins Statistic for l-dimensional euclidean space
h(q)=sum(d.^k)/(sum(d.^k)+sum(delta.^k));

end;

H=h;
% figure('Color',[1 1 1])
% plot(buffer(:,1),buffer(:,2),'o',...
%  'LineWidth',1,...
%  'MarkerEdgeColor','k',...
%  'MarkerFaceColor','k',...
%  'MarkerSize',2),hold on
% % 
% plot(Xuniforme(:,1),Xuniforme(:,2),'o',...
%                      'LineWidth',1,...
%                      'MarkerEdgeColor','b',...
%                      'MarkerFaceColor','b',...
%                      'MarkerSize',2),hold on
% plot(X1(:,1),X1(:,2),'o',...
%  'LineWidth',1,...
%  'MarkerEdgeColor','g',...
%  'MarkerFaceColor','g',...
%  'MarkerSize',2),hold on
% 
% legend('Buffer Zone','Sampling Origins','Marked Points')
% grid on
