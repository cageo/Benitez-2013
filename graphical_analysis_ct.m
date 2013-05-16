function graphical_analysis_ct(S_Ha,S_Ho,test,critical_q)

alpha=0.01:0.02:0.98;
P=zeros(size(alpha));

switch test
    case 'Hopkins'
        xlab = 'Statistic values (h)';
        Pqo  = 'P(h|Ho)';
        Pqa  = 'P(h|Ha)';
        qcritical='H_{1-\alpha} =';
        if (max(S_Ho) <= min(S_Ha))
            P=ones(length(alpha),1);
        else            
            for a=1:length(alpha)
              S_Ho_a = max( S_Ho(1:round((1-alpha(a))*length(S_Ho))) ); % q0_a;
              Beta=find(S_Ha <= S_Ho_a);
              P(a)= 1 - (length(Beta)/length(S_Ha));
            end        
        end

    case 'CoxLewis'
        xlab = 'Statistic values (R)';
        Pqo  = 'P(R|Ho)';
        Pqa  = 'P(R|Ha)';
        qcritical='H_{1-\alpha} =';
        if (max(S_Ha) <= min(S_Ho))
            P=ones(length(alpha),1);
        else
            for a=1:length(alpha)
            S_Ho_a = max( S_Ho(1:round((alpha(a))*length(S_Ho))) );% q0_a;
            Beta=find(S_Ha>=S_Ho_a);
            % Power Calc 
            N=length(S_Ho);
            B=length(Beta);
            P(a)=1-(B/N);
            end
        end
    
end

% Power Analysis
figure
subplot(2,1,1)
numbins=20;
count = denhist(S_Ha, numbins,1); hold on;
denhist(S_Ho, numbins,2);
hold on
plot([critical_q critical_q],[0,max(count)],'-g')
xlabel(xlab,'FontSize',14,'FontName','Times New Roman')
ylabel('Density','FontSize',14,'FontName','Times New Roman')
legend(Pqa,Pqo,'critical value','FontName','Times New Roman',2)
text(critical_q,max(count)/2,strcat(' \leftarrow ',qcritical,num2str(critical_q,'%4.4f')),'FontSize',10)
title('Probability density functions','FontSize',14,'FontName','Times New Roman')
% axis([min(S_Ho) max(S_Ha) 0 max(count)])

% ROC curve
subplot(2,1,2)
plot(alpha,P,'-^k','LineWidth',1.5); hold on;
xlabel('\alpha','FontSize',14);ylabel('1-\beta','FontSize',14);
title('ROC curve, Statistical power (1-\beta) vs random error (\alpha)','FontSize',14,'FontName','Times New Roman')
grid on
legend(test)
axis([0.01 0.98 0 1.2])

end

