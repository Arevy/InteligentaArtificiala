function driver()
    n = 10;
    [X, U] = genereazaExemple(@(x) sin(2*pi*x), n, 0.001);
    E = [];
    clf();
    for i = 0:8
        subplot(4, 3, i+1)
        title("Polinom de gradul " + i)
        hold on;
        ploateazaExemple(X, U);
        p = gasestePolinomOptim(X, U, i);
        ploteazaGraficPolinom(p);
        hold off;
        Y = arrayfun(@(x) polyval(p, x), X);
        E = [E; calculeazaEroare(U, Y)];
    end
    subplot(4, 3, [10, 11, 12]);
    hold on;
    title("Evolutia erorii");
    plot(linspace(0, 1, size(E, 1)), E);
    hold off
end

function [X, U] = genereazaExemple(f, n, sigma)
    X = rand(n, 1);
    noise = normrnd(0, sigma, n, 1);
    U = arrayfun(f, X) + noise;
end

function ploateazaExemple(X, U)    
    plot(X, U, 'o');
end
function p = gasestePolinomOptim(X, U, n)
    p = polyfit(X, U, n);
end


