function [ARI] = adjusted_rand(L1,L2)

% ADJUSTED_RAND
% Parámetros de entrada:
%   L1,L2: son vectores fila o columna de N componentes, es decir, son el 
%   conjunto de etiquetas que asocian cada patrón de un conjunto X a una 
%   clase, el máximo número de clases es igual al max(L1 o L2), L1 y L2 
%   representan dos clasificaciones distintas de un mismo conjunto, 
%   si L1=L2 ARI=1, de L1 ~= L2 ARI arrojara valores en el 
%   intervalo [0,1) dependiendo de que tan parecidas sean L1 y L2.
%
% Parámetros de Salida:
%   ARI: valor scalar en el intervalo [0,1], adjusted rand intex
%
% Referencias:
%   Jain, A. K. & Dubes, R. C. Hall, P. (Ed.) Algorithms for Clustering
%   Data 2 Ed., 1988, p. 173
%
%   Hubert, L. and Arabie, P. (1985) Comparing partitions. Journal of 
%   Classification, 193–218
%
% Vea también: comb, cont_matrix
%
% Autores: Duque Perdomo,D,P. dpduque@javerianacali.edu.co
%          Flórez Ospina,J,F. jfflorez@javerianacali.edu.co
% Facultad Ingeniería, Pontificia Universidad Javeriana

N=length(L1);
[MC]=cont_matrix(L1,L2); % matiz de contingencia
a=sum(MC,2);
b=sum(MC);
if (sum(b==0)~= 0 || sum(a==0)~= 0)
    ARI=0;
    return;    
else
    Ind=(0.5*sum(sum(MC.^2,2)) - N/2 );
    % Ind=sqrt(sum(comb(a,2))*sum(comb(b,2)));
    EInd=sum(comb(a,2))*sum(comb(b,2))/comb(N,2);
    MaxInd=0.5*(sum(comb(a,2))+sum(comb(b,2)));
end

if EInd~=Ind
    ARI=(Ind-EInd)/(MaxInd-EInd);
else
    ARI=0;
end


end
function [c]=comb(n,k)
% if length(n)==1
%     c=nchoosek(n,k);
% elseif length(n)>1
    c=zeros(size(n,1),1);
    for i=1:length(n)
        c(i)=nchoosek(n(i),k);
    end
        
% end
end