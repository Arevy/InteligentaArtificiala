%datele: exemplele + etichetele
X = [0 0 0 0.5 0.5 0.5 1 1;0 0.5 1 0 0.5 1 0 0.5];
T = [1 1 1 1 -1 -1 -1 -1];
%reprezentare grafica a datelor
figure(1), hold on;
eticheta1 = find(T==1);
etichetaMinus1 = find(T==-1);
plot(X(1,eticheta1),X(2,eticheta1),'or');
plot(X(1,etichetaMinus1),X(2,etichetaMinus1),'xg');
axis([-2 2 -2 2]);
%pune pauza 2 secunde
pause(2);
%creaza perceptron
net = newp([-1 1;-1 +1],1,'hardlims');
view(net);
pause(5);
%afiseaza proprietatile perceptronului legate de vectorul de ponderi + bias
disp('Proprietati legate de vectorul de ponderi:');
disp(net.inputWeights{1});
pause(3);
disp('Proprietati legate de bias:');
disp(net.biases{1});
pause(3);
%initializeaza parametri retelei, implicit ponderile + bias sunt nule
net = init(net);
%seteaza numarul de epoci pentru antrenare
net.trainParam.epochs = 100;
%antreneaza reteaua
[net,antrenare] = train(net,X,T);
figure(1);
%ploteaza dreapta de separare
plotpc(net.IW{1},net.b{1})
title('Reprezentarea grafica a exemplelor de antrenare si a dreptei de separare'); 
%simuleaza reteaua pentru datele de intrare
etichetePrezise = sim(net,X);
isequal(etichetePrezise,T)

close all
% punctul 1
net = newp([-1 1;-1 +1],1,'hardlims');
net.inputWeights{1}.initFcn = 'rands';
net.biases{1}.initFcn = 'rands';
net.trainParam.epochs = 100;
net = init(net);
%antreneaza reteaua
[net,antrenare] = train(net,X,T);
pause(5);
close all;

%punctul 2
net = newp([-1 1;-1 +1],1,'hardlims');
net.inputWeights{1}.initFcn = 'rands';
net.biases{1}.initFcn = 'rands';
net.trainParam.epochs = 1;
net = init(net);
eroareAntrenare = 1;
epocaCurenta = 1;
%vectorPonderiOld = net.IW{1};
%valoareCosinus = zeros(1,500);
while (eroareAntrenare > 0) && (epocaCurenta <= 500)
    [net,antrenare] = train(net,X,T);
    figure,hold on;
    title(['Epoca ' num2str(epocaCurenta)]);
    eticheta1 = find(T==1);
    etichetaMinus1 = find(T==-1);
    plot(X(1,eticheta1),X(2,eticheta1),'or');
    plot(X(1,etichetaMinus1),X(2,etichetaMinus1),'xg');
    axis([-2 2 -2 2]);
    plotpc(net.IW{1},net.b{1});drawnow;
    
    title(['Epoca ' num2str(epocaCurenta)]);
    if (mod(epocaCurenta,10)==0)
        close all;
    end
    pause(1);
    eroareAntrenare = antrenare.perf(end);
    epocaCurenta = epocaCurenta + 1;
    %valoareCosinus(epocaCurenta-1) = (sum(net.IW{1}.*vectorPonderiOld))/(norm(net.IW{1}) * norm(vectorPonderiOld))
    %vectorPonderiOld = net.IW{1};
end
valoareCosinus(epocaCurenta) = 0;
valoareCosinus(epocaCurenta+1:end)=[];
%figure,plot(valoareCosinus);
%title('Evolutia cosinusului dintre vectorii de ponderi pentru 2 iteratii consecutive');

%punctul 3
close all;
X = [X [-50;40]]
T = [T 1]

figure(1),hold on;
eticheta1 = find(T==1);
etichetaMinus1 = find(T==-1);
plot(X(1,eticheta1),X(2,eticheta1),'or');
plot(X(1,etichetaMinus1),X(2,etichetaMinus1),'xg');
axis([-52 2 -2 42]);
net = newp([-1 1;-1 +1],1,'hardlims');
net.inputWeights{1}.initFcn = 'rands';
net.biases{1}.initFcn = 'rands';
net.trainParam.epochs = 1000;
net = init(net);
%antreneaza reteaua
[net,antrenare] = train(net,X,T);
figure(1),plotpc(net.IW{1},net.b{1})

%punctul 4
close all
figure(1),hold on;
eticheta1 = find(T==1);
etichetaMinus1 = find(T==-1);
plot(X(1,eticheta1),X(2,eticheta1),'or');
plot(X(1,etichetaMinus1),X(2,etichetaMinus1),'xg');
axis([-52 2 -2 42]);
net = newp([-1 1;-1 +1],1,'hardlims');
net.inputWeights{1}.initFcn = 'rands';
net.inputWeights{1}.learnFcn = 'learnpn';
net.biases{1}.initFcn = 'rands';
net.biases{1}.learnFcn = 'learnpn';

net.trainParam.epochs = 1000;
net = init(net);
%antreneaza reteaua
[net,antrenare] = train(net,X,T);
figure(1),plotpc(net.IW{1},net.b{1})

%punctul 5 - ia din laboratorul trecut
...
%punctul 6 - AND
...
%punctul 7
...

