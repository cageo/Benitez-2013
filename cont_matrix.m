function [MC]=cont_matrix(L1,L2)

% Entradas: 
%   L1: es un vector fila o columna de N componentes, puede verse como una
%   función L1: X -> {1,2,3,...}, es decir que L1(i) retornará el cluster
%   al que el partrón xi en X fue asignado. L1 puede verse como el conjunto
%   de etiquetas que caracteriza la salida de un algoritmo de agrupamiento
%   particional.
%   L2: Se define igual que L1.
%
% Salidas:
%   MC: es la matriz de contingencia de k1 x k2 dimensiones donde k1 y k2 
%   son el máximo número de clases en L1 y L2 respectivamente. El elemento
%   i,j de MC equivale al número de elementos que pertenecen a la clase i y
%   a la clase j, de otra forma es el cardinal de la intersección entre la
%   clase i y j.
%
% Vea También adjusted_rand
%   
% Referecias:

k1=max(L1); k2=max(L2);
MC=zeros(k1,k2);

for i = 1:length(L1);
   MC(L1(i),L2(i))=MC(L1(i),L2(i))+1;
end




end