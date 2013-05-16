function [X_ref] = h0_tibshirani(X,method,r)

% h0 tibshirani genera la distribución base o referencia X_ref de acuerdo 
% a la hipótesis nula de que todos los patrones se distribuyen aleatoriamente en
% la región más pequeña que contiene a X, es decir, que cada punto en X_ref
% tiene la misma probabilidad de ocurrir 
% (Tibshirani, R.; Walther, G. & Hastie, T, 2001 p.3)
% 
% Entradas: 
%   X: Conjunto de datos que determinará región en la se distribuirá X_ref
%   method: Puede ser la cadena 'a' o 'b', y depende del método para
%   generar los puntos en la región de X.
%   r: Número de conjuntos referencia a generar
%                                                  
% Salidad:
%   X_ref: Es una matriz de matrices de dimensión Nxdxr, que contiene r
%   conjuntos de referencia.
%
% Vea también:
%
% Autores: Duque Perdomo,D,P. dpduque@javerianacali.edu.co
%          Flórez Ospina,J,F. jfflorez@javerianacali.edu.co
% Facultad Ingeniería, Pontificia Universidad Javeriana
% k__means.m, versión 1 2011/02/04 


[N,d]=size(X);
X_ref=zeros(N,d,r);
[X] = normalization('nomean',X);

switch method
    case 'a'
        h = waitbar(0,'Please wait...');
        % Metodología (a)
        [Sup_lim]=max(X);
        [Inf_lim]=min(X);
        for i=1:r
            for j=1:d
                X_ref(:,j,i) = Inf_lim(j) + (Sup_lim(j)-Inf_lim(j)).*rand(N,1);
                waitbar(j/d,h)
            end
            
        end
        delete(h)
%         figure
%         if d>3
%             d=3;
%         end
%         graph(X(:, 1:d ),d,'r'); hold on;
%         graph(X_ref(:, 1:d ),d,'b');

    case 'b'
        % Metodología SVD (b)
        [U,D,V] = svd(X); % X=U*D*V'
        X_prima=X*V;
        [Sup_lim]=max(X_prima);
        [Inf_lim]=min(X_prima);
        Z_prima=zeros(N,d,r);
        h = waitbar(0,'Please wait...');
        for i=1:r
            for j=1:d
                Z_prima(:,j,i) = Inf_lim(j) + (Sup_lim(j)-Inf_lim(j)).*rand(N,1);
                waitbar(j/d,h)
            end
            X_ref(:,:,i)=Z_prima(:,:,i)*V';
            
        end
        delete(h)
%         figure
%         if d>3
%             d=3;
%         end
%         graph(X(:, 1:d ),d,'r'); hold on;
%         graph(X_ref(:, 1:d ),d,'g');
end