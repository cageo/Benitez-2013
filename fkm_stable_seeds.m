function [seeds]=fkm_stable_seeds(X,k,nruns,q,tol)

N=size(X,1);
W=zeros(nruns,nruns);
order=1:nruns;

% Choosing the most stable fuzzy k-means partition
[seed_pos]=randomstart(N,k,nruns);
nruns=size(seed_pos,1);
Umemory=zeros(N,k,nruns);
Plabels=zeros(N,nruns);
iter=1;

h = waitbar(0,'Please wait...');
            
for n=1:nruns
    centroides = X(seed_pos(n,:),:); % k centros distintos
    [fkmresult]=fuzzy_kmeans(X,centroides,q,tol);
    Umemory(:,:,n)=fkmresult.U;
    Plabels(:,n)=fkmresult.labels;
    iter=iter+1;
    waitbar(iter/(2*nruns),h)
end
for i=1:nruns
    for j=1:nruns
        W(i,j,k-1) = adjusted_rand(Plabels(:,i),Plabels(:,j));
    end
    iter=iter+1;
    waitbar(iter/(2*nruns),h)
end

delete(h)

Wsum    = sum( W(:,:,k-1).*(W(:,:,k-1)==1) ); % frecuencia de stabilidad
vecF    = order(Wsum==max(Wsum)); % vector de indices part estables
Uindex  = vecF( ceil(length(vecF)*rand) );
seeds   = Umemory(:,:,Uindex);

end