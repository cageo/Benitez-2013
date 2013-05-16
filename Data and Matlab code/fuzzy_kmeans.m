function [fkmresult]=fuzzy_kmeans(X,K,q,tol)

% FUZZY_KMEANS

% Entradas: 
%     X, Conjunto de datos, cada fila equivale a un observación (patrón)
%     K, Número de Grupos Esperado o Semillas Iniciales (K vectores fila)
%     q, valor del fuzificador generelamente esta en [1,3]
%     tol, parámetro de convergencia
%     opcion: "1" para graficar el clustering y "0" lo contario

% Salidas:           
%     C, matriz de prototipos final o centroides finales
%     lab, asigna una etiqueta a cada patrón correspondiente al cluster
%          que más pertenencia tenga sobre el mismo (versión hard)

% Autores: Diana Patricia Duque, Juan Felipe Flórez
% Última revisión: viernes, julio 1, 2011

if(nargin==2)
    q=2;
    tol=1e-5;
elseif(nargin<2)
    error('debe definir X y K')
end
if(nargin==3)
    tol=1e-5;
end

[N l]=size(X);

if size(K,1)==1 && size(K,2)==1
    % paso 1
    [U]=initfcm(K,N); U=U';
else
    C=K;
    % Número de Clusters
    K=size(C,1);
    % Paso 2
    [U]=startfcm(X,C,q,N);
end

C=zeros(K,l); D=zeros(N,K);
Uo=zeros(N,K);

iter=0;
while max(max(abs(U-Uo)))>=tol
Uo=U;
% Paso 3 - Actualización de Prototipos o Semillas
for j=1:K
    sumuijxi= sum(repmat(U(:,j).^q,1,size(X,2)).*X);
    sumuij= sum((U(:,j).^q));    
    C(j,:)=sumuijxi./sumuij; 
end

% Cálculo de la distancia entre cada patrón y los centroides iniciales
% D=d^2= x^2 + y^2, distancia euclidea cuadrada
for j=1:K
    D(:,j)= sum((X-ones(N,1)*C(j,:)).^2,2);
end
Dtmp=D+eps;
Dtmp = (Dtmp).^(-1/(q-1));
% Actualización matriz de membresias
U = (Dtmp ./ (sum(Dtmp,2)*ones(1,K)));
iter=iter+1;
end

Jq= sum(sum(U.^q.*D),2);
[~,labels] = max(U,[],2);

fkmresult.X=X;
fkmresult.U=U;
fkmresult.labels=labels;
fkmresult.C=C;
fkmresult.iter=iter;
fkmresult.Jq=Jq;

end

function [U]=startfcm(X,Co,q,N)
  % Co: Centros o Semillas iniciales
    K=size(Co,1);
    D=zeros(N,K);
    for j=1:K
        D(:,j)= sum((X-ones(N,1)*Co(j,:)).^2,2);
    end
    D=D+eps;
    D = (D).^(-1/(q-1));
    U = (D ./ (sum(D,2)*ones(1,K)));
end