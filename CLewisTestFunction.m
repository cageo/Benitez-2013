function [Rd]=CLewisTestFunction(A,Po,E)
% -------------------------------------------------------------------------
% ESTADÍSTICO DE COX-LEWIS - CON MARCO DE MUESTREO (PERCENTILE FRAME)
%
% [Rd]=CLewisTestFunction(A,Po,E)
% Esta función computa el estadístico de Cox-lewis y se basa en los pasos
% seguidos por Panayirci y Dubes en 1983. Además usa como marco de muestreo
% el percentile frame (Dube y Jain, 1987), en el cual se ubican los origenes 
% de muestreo, cabe recordar que dichos origenes obedecen a la hipótesis de
% aleatoriedad espacial asumida como uniformemente distribuida.
% Adicionalmente, el parámetro E indica el número de experimentos a
% realizar, es decir dada la naturaleza aleatoria de la ubicación de los
% origenes de muestreo cada corrida del algoritmo generara un valor
% distinto para el estadístico, por tanto un E=200 implicara una matriz de
% salida Rd con dimensiones Ex1.
%
% PARÁMETROS DE ENTRADA:
%   A:      Conjunto de Datos, matriz de Nxl, donde N es el número de
%           patrones y l es la dimensionalidad.
%   Po:     Porcentaje de origenes de muestreo (El número de origenes de
%           muestreo de determindao por Po*N/100, Po <= 10).
%   E:      Número de Experimentos (number of montecarlo trials).

%
% PARÁMETROS DE SALIDA:
%   Rd:     Valor del estadístico de Cox-lewis, corresponde a un vector si
%           E>1;
%
% Autores: Duque. D. P and Flórez. J. F
% Última revisión: Domingo, May 01, 2011
% -------------------------------------------------------------------------



% Example:
% A=rs; N=length(A); M=round(N*0.1);
% m=[0 0;0 1;1 0;1 1];
% s=[0.02 0.02 0.02 0.02];
% N=800;
% [A,N,M]=GaussGen(N,m,s);    

[N,l]=size(A); 
M=round(N*Po/100);
j=ones(N,1);

% Elimina el valor promedio de los datos (para facilitar cálculos posteriores)
C=mean(A);
A=(A-j*C);

p=50; % percent of the frame
% Xp datas into the percentile frame
% r percentile frame radius
[X, Xp, Pf, buffer,r]= perframe(A,p,l);

% -------------------------------------------------------------------------

Rd=zeros(E,1);
for q=1:length(Rd)
% preallocating memory for the M, l-dimentional sampling origins 
H=zeros(M,l); 

% It places the sampling origins (yj) into the percentile frame
counter=0;
while( counter < M )        
        origins =  zeros(1,l);
        [Sup_lim]=max(Xp); [Inf_lim]=min(Xp);
        for j=1:l
                origins(j) = Inf_lim(j) + (Sup_lim(j)-Inf_lim(j)).*rand(1,1);
        end
       
        dist=norm(origins,2); % because the dataset mean is zero in the feature space
        % estimador n
        if(dist<=r)
            agregar=ismember(origins,H,'rows'); 
            % si y no pertenece a H agregar=0;
            % se agrega y a H  
            if(agregar==0) 
                counter=counter+1;
                H(counter,:)=origins; 

            end
        end
end

Xuniforme=H; % Represents the Random Position Hypothesis (Ho)

%Construction of Statistic (R)
u=zeros(M,1);
v=zeros(M,1);

% Proximity Matrix uses euclidean distance as dissimilarity measure
[U]=eudist(Xuniforme,X);
[V]=eudist(X,X);

for j=1:M
    % Compute the Nearest Neighbor distance between yj in X1 and X
    [u(j),i] = min(U(j, U(j,:)~=0 )); % X-{xj}    
    % Compute the Nearest Neighbor distance between x(i) in X and X-{x(i)}
    v(j)=min(V(i, V(i,:) ~= 0)); % Select the Nearest Neighbor to xj
end

cond = 2*u > v;
u=u(cond);
v=v(cond);

Mp=length(u);
B=2*asin(v./(2*u));
R=(4/3)*(1 - pi./ (2*pi + sin(B) - (pi+B).*cos(B)) );
% Compute the Cox-Lewis for l-dimensional euclidean space
Rmean=((1/Mp)*sum(R));
Rstd=std(R);
Rd(q)=Rmean;
end

% figure('Color',[1 1 1])
% plot(buffer(:,1),buffer(:,2),'o',...
%  'LineWidth',1,...
%  'MarkerEdgeColor','k',...
%  'MarkerFaceColor','k',...
%  'MarkerSize',3),hold on
% 
% plot(Xuniforme(:,1),Xuniforme(:,2),'o',...
%                      'LineWidth',1,...
%                      'MarkerEdgeColor','b',...
%                      'MarkerFaceColor','b',...
%                      'MarkerSize',3),hold on
% plot(X1(:,1),X1(:,2),'o',...
%  'LineWidth',1,...
%  'MarkerEdgeColor','g',...
%  'MarkerFaceColor','g',...
%  'MarkerSize',3),hold on

% legend('Buffer Zone','Sampling Origins','Marked Points')
% grid on
