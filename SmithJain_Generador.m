function [Xo] = SmithJain_Generador(X)

% Creación de la Hipótesis de aleatoriedad espacial, con el algoritmo 
% heurístico planteado por Smith y Jain, 1984
% tic;


[N,l] = size(X);

Xmax = max(X); Xmin = min(X);
X= X ./ (ones(N,1)*Xmax - ones(N,1)*Xmin);

H = X;
limsup=max(X); liminf=min(X);
j=0;

h = waitbar(0,'Please wait...');

while j < N
        y = min(liminf)+ (max(limsup)-min(liminf))*rand(1,l);
        % estimador n
        [n,Nsub]=estimador(H,y);   
        cond=zeros(1,Nsub);
        for k=1:Nsub
            cond(k)=(H(k,:)-y)*n'; % <v,y> producto interno
        end
        cond=cond>0;
        acepto=all(cond);% son todos distintos de 0
        if(acepto==0) % se acepta y como elemento de H
            H(Nsub+1,:)=y;
            j=j+1;
            fprintf('iter %d \n',j)
        end
waitbar(j/(N),h)
end
delete(h)
Xo = H(N+1:end,:); % Conjunto de datos bajo Ho
% t_insercion=toc;
Xo= Xo .* (ones(N,1)*Xmax - ones(N,1)*Xmin);
end