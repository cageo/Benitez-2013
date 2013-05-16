function [result] = output_param(S_Ho,S_Ha,test,alpha,num_exp)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

% Cálculo de la potencia estadística
S_Ho=sort(S_Ho,1,'ascend');


if strcmp(test,'Hopkins')
    qo         = mean(S_Ha); %valor medio del estadistico q al evaluar Xa
    critical_q = max(S_Ho(1:round((1-alpha)*num_exp)));    
    Power      = 1 - sum(S_Ha <= critical_q)/num_exp;
    pvalue     = sum(S_Ho >= qo)/num_exp;
    cl         = 1 - alpha; % confidence level
elseif strcmp(test,'CoxLewis')
    qo         = mean(S_Ha); %valor medio del estadistico q al evaluar Xa
    critical_q = max(S_Ho(1:round(alpha*num_exp)));    
    Power      = 1 - sum(S_Ha >= critical_q)/num_exp;
    pvalue     = sum(S_Ho <= qo)/num_exp;
    cl         = 1 - alpha; % confidence level    
end

result.qo=qo;
result.critical_q=critical_q;
result.Power=Power;
result.pvalue=pvalue;
result.cl=cl;

% SalidaHopkins.Ha=[mean(S_Ha,2) var(S_Ha,0,2)];
% SalidaHopkins.Ho=[mean(S_Ho,2) var(S_Ho,0,2)];
% SalidaHopkins.Potencia=Phop;
% SalidaCox.Ha=[mean(S_Ha_cox,2) var(S_Ha_cox,0,2)];
% SalidaCox.Ho=[mean(S_Ho_cox,2) var(S_Ho_cox,0,2)];
% SalidaCox.Potencia=Pcox;


end

