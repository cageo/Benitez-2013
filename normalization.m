function [X] = normalization(valfun,X)
% X: dataset (Nxl matrix)
% valfun: 'zscore', 'range', 'nomean'

[N]=size(X,1);
switch valfun
    case 'zscore'
        X=( X - ones(N,1)*mean(X) )./ (ones(N,1)*std(X));
    case 'range'
        X=( X - ones(N,1)*mean(X) ) ./ (ones(N,1)*max(X) - ones(N,1)*min(X));
    case 'nomean'
        X=( X - ones(N,1)*mean(X) );
    otherwise 
        fprintf('valfun is not defined')
end
end