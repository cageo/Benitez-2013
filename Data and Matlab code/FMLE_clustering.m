function [fmleresult]=FMLE_clustering(X,U,q,tol)
% [U,C,F,iter]=FMLE_clustering(X,U,q,tol)
% X: conjunto de datos Nxl
% K: numero de clases
% N: numero de patrones

% C=[1 1 1;1 1 1];
% U=[0.1 0.9;1 1;1 1; 1 1; 1 1];
% X=[2 2 2;2 2 2;2 2 2; 2 2 2; 2 2 2];

K=size(U,2); 
[N,l]=size(X);

% Paso 1

% Calculo de centroides iniciales
% Actualización de la matriz de prototipos C
C=zeros(K,l);
for j=1:K
    sumuijxi= sum(repmat(U(:,j).^q,1,size(X,2)).*X);
    sumuij= sum((U(:,j).^q));    
    C(j,:)=sumuijxi./sumuij; 
end
Cmemory=zeros(K,l,50);
Uant=zeros(size(U));
iter=1;

Cmemory(:,:,iter)=C;
while max(max(U-Uant))>tol %&& iter<=300


Uant = U;
% Paso 2

% Cálculo de la distancia entre cada patrón y los centroides iniciales
% D=d^2= x^2 + y^2, distancia euclidea cuadrada

% fuzzy covariance matrix
% if iter~=0
%     h=D.^(-1)./(sum(D.^(-1),2)*ones(1,K)); % probabilidad a posteriori
% else
%     h=(U.^q); % gath && geva
% 
% end
h = U; % probabilidad a posteriori

F=zeros(l,l,K);
P=zeros(1,K);
De=zeros(N,K);


for k=1:K
    
    F(:,:,k)= (ones(l,1)*h(:,k)') .* (X - ones(N,1)*C(k,:))' * (X - ones(N,1)*C(k,:));
    F(:,:,k)=F(:,:,k)/sum(h(:,k));
    if det(F(:,:,k))<=0
        errormsg = strcat('Covariance matrix is singular det(Fj)<=0, the algorithm no converge for k = ',num2str(k));
        errordlg(errormsg);
        break; 
    end
    P(k)=(1/N)*sum(h(:,k)); % probabilidad de que el k-esimo cluster se presente en X    
    Xc=(X-ones(N,1)*C(k,:));
    De(:,k)=sqrt(det(F(:,:,k)))*exp(sum(Xc*pinv(F(:,:,k)).*Xc,2)/2)/P(k) ;  
    
%     for i=1:N
%         F(:,:,k)=F(:,:,k) + h(i,k)*(X(i,:)-C(k,:))'*(X(i,:)-C(k,:));
%     end
%     F(:,:,k)= (ones(l,1)*h(:,j)') .* (X - ones(N,1)*C(k,:))' * (X - ones(N,1)*C(k,:));
%     F(:,:,k)=F(:,:,k)/sum(h(:,k));
%     
%     P(k)=(1/N)*sum(h(:,k)); % probabilidad de que el k-esimo cluster se presente en X    
%     Xc=(X-ones(N,1)*C(k,:));
%     for i=1:N
%          De(i,k)=sqrt(det(F(:,:,k)))*exp(Xc(i,:)*pinv(F(:,:,k))*Xc(i,:)'/2)/P(k) ;   
%     end
end

Dtmp= De + eps;
Dtmp = Dtmp.^(-1/(q-1));
% Actualización matriz de membresias
U = (Dtmp ./ (sum(Dtmp,2)*ones(1,K)));

% Paso 3
% Actualización de la matriz de prototipos C
for j=1:K
    sumuijxi= sum(repmat(U(:,j).^q,1,size(X,2)).*X);
    sumuij= sum((U(:,j).^q));    
    C(j,:)=sumuijxi./sumuij; 
end

% if(iter==1)
%     Fo=F;
% end
iter= iter + 1;
Cmemory(:,:,iter)=C;
end

[~,labels]=max(U,[],2);

% paquete fmle
fmleresult.X=X;
fmleresult.U=U;
fmleresult.labels=labels;
fmleresult.F=F;
% fmleresult.Fo=Fo;
fmleresult.C=C;
fmleresult.iter=iter;
fmleresult.De = De;
fmleresult.Cmemory = Cmemory;






end














