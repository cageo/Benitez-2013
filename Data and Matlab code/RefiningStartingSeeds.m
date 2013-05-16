function [seeds]=RefiningStartingSeeds(X,K)

% [seeds]=RefiningStartingSeeds(X,K)
% X: Conjunto de Datos Nxl, N numero de patrones, l dimensionalidad
% K: Numero de clusters

N=size(X,1);
% vector de orden aleatorio
I=randperm(N);
X = X(I,:);
% Ar=Ar';


% --- The bootstraping datasets will be selected --------------------------

Ns=10; % Number of bootstraping samples
S = ones(Ns,1);
S(1:Ns-1) = ceil(N/Ns)*S(1:Ns-1); S(Ns) = N - (Ns-1)*ceil(N/Ns); 

fake_datasets = {};
fake_datasets{1} = X(1:S(1),:); X(1:S(1),:)=[];

for j=2:Ns
    fake_datasets{j} = X(1:S(j),:); X(1:S(j),:)=[];
end
% -------------------------------------------------------------------------

theta=[];
for i=1:Ns
    % loop se seleccion aleatoria
    r=zeros(K,1);
    for k=1:K
        r(k)=ceil(S(i)*rand);    
    end
    theta_rnd = fake_datasets{i}(r,:);
    [result]  = k__means(fake_datasets{i},theta_rnd);
    theta     = [theta ; result.C];
end

% --- The better respresentation of prototypes matrix will be selected ----
c=[1 K];
J=zeros(length(S),1);
P={};

for i=1:Ns
    theta_0  = theta(c(1):c(2),:);
    result   = k__means(theta,theta_0);
    P{i}     = result.C; 
    J(i)     = result.J;
    c        = c + K;
end
[~, arg] = min(J);
seeds    = P{arg};

end