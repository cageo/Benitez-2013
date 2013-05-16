function [seeds]=RandomStartingSeeds(X,K)

N     = size(X,1); 
I     = randperm(N);
Xr    = X(I,:);
seeds = Xr(1:K,:);

end