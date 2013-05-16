function [n,N]=estimador(H,y)
    [N,l]=size(H);
%     sum=0;
%     for i=1:N
%         sum=sum+(H(i,:)-y)/(norm((H(i,:)-y),2)^(2+1));
%     end
%     
    num = H - ones(N,1)*y;
    den= sqrt(sum((H-ones(N,1)*y).^2,2))*ones(1,l);
    n=sum( num ./ den.^(l+1) )/N;

end