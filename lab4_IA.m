function lab4_IA
    f=inline('sin(2*pi*x)','x');
    m=50;
    sigma=0.25;
    n=3;
 
    [S]=geneazaExemple(f,sigma,m);
%     ploateazaExemple(S(:,1),S(:,2));
%     hold on
    for i=1:9
        subplot(3,3,i);
        ploateazaExemple(S(:,1),S(:,2));
        hold on
        p = gasestePolinomOptim(S(:,1),S(:,2), i);
        ploteazaGraficPolinom(p);
        [E(i)]=calculeazaEroarea(S(:,1),S(:,2),p);
    end
    
%     p = gasestePolinomOptim(S(:,1),S(:,2), n);
%     ploteazaGraficPolinom(p);
%     [E]=calculeazaEroarea(S(:,1),S(:,2),p);
    
    
end
function [S]=geneazaExemple(f,sigma,m)
    x=rand(m, 1);
    u=f(x)+sigma*randn(m, 1);
    S=[x u];
end
function ploateazaExemple(x,u)
    plot(x, u, 'o');
end
function p = gasestePolinomOptim(x, u, n)
    p = polyfit(x, u, n);
end
function ploteazaGraficPolinom(p)
X=0:0.01:1;
Y=polyval(p, X);
plot(X, Y);
end
function [E]=calculeazaEroarea(x, u, p)
    E=sum((u - polyval(p, x)).^2)/length(u);
end
