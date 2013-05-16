function [seed_pos]=randomstart(N,K,nruns)


% N: numero de patrones en la poblacion (X)
% K: numero de clases o semillas a generar
% nruns: numero de combinaciones de semillas a generar

% seed_pos: matriz de N filas por K columnas cada fila representa la
% posicion de un posible centroide en X



perm_indexes=randperm(N);

if (K*nruns <= N)
    seed_pos=zeros(nruns,K);
    j=[1 K];
    for i=1:nruns
        seed_pos(i,:)=perm_indexes(j(1):j(2));       
        j=j+K;
    end
else
    nruns_mod=floor(N/K); fprintf('nruns ha sido modificado por: %i \n\n',nruns_mod)
    seed_pos=zeros(nruns_mod,K);
    j=[1 K];
    for i=1:nruns_mod
        seed_pos(i,:)=perm_indexes(j(1):j(2));       
        j=j+K;
    end
end




% centro_pos=zeros(nruns,K);
% for n=1:nruns
%     nuevo_centro=round(N*rand(1,K));
%     if(sum(sum(centro_pos == ones(nruns,1)*nuevo_centro,2))==0)
%         centro_pos(n,:)=nuevo_centro;
%     else
%         iter=1;
%         while(sum(sum(centro_pos == ones(nruns,1)*nuevo_centro,2))~=0 || iter<=100)
%               nuevo_centro=round(N*rand(1,K));
%               iter=iter+1;
%         end
%         centro_pos(n,:)=nuevo_centro;
%     end
% end
% 
% seed_pos=centro_pos;
end