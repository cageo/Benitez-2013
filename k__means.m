function [kmresult]=k__means(X,c0,varargin)

N    =size(X,1);
[k,l]=size(c0);
C=c0;
U=zeros(N,k); % matriz de particion hard

iter=0;  tol=inf; 
while(tol~=0)
Cant=C;

% Preallocating Memory for Speed up
D=zeros(N,k); % matriz de disimilitud, Dij^2=d(xi,cj)
for j=1:k
    D(:,j)= sum ( (X - ones(N,1)*C(j,:) ).^2,2);
end
[~,labels] = min(D,[],2);

for j=1:k
    if (sum(labels==j)~=0)
        C(j,:)=sum( X.*((labels==j)*ones(1,l)) ) / sum(labels==j);
    end
end

tol=sum(sum(abs(C-Cant),2));
iter=iter+1;
end

for j=1:k
    U(:,j)= labels==j;
end
J= sum(sum(U.*D),2);

% paquete kmeans
kmresult.X=X;
kmresult.U=U;
kmresult.labels=labels;
kmresult.C=C;
kmresult.iter=iter;
kmresult.J=J;

end