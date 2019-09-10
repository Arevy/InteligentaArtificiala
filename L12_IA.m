function L12_IA()
X = -2:0.05:2;
t = sin(2*pi*X) + 0.1*randn(size(X));
S1 = 10;
[R,Q] = size(alphabet);
[S2,Q] = size(targets);
P = alphabet;
net = newff(minmax(P),[S1 S2],{'logsig' 'logsig'},'traingdx');
net.LW{2,1} = net.LW{2,1}*0.01;
net.b{2} = net.b{2}*0.01;

net = newff(minmax(X), [20,1], {'tansig', 'purelin'});
net.trainFcn = 'traingdx';

net.trainParam.epochs = 500;
net.trainParam.goal = 0.001;
netf = feedforwardnet(2); %definim reteaua netf
netf.layers{1:2}.transferFcn = 'logsig';
netf.inputs{1}.processFcns = {};%eliminam faza de preprocesare: scalare, etc.
netf.outputs{2}.processFcns = {};%eliminam faza de postprocesare: scalare, etc
netf = configure(netf,0,0);
netf.IW{1,1} = [10 10]';
netf.b{1} = [-5 5]';
netf.LW{2,1} = [1 1];
netf.b{2} = -1;
%multimea de antrenare pentru reteaua net
p = -2:0.1:2;
t = sim(netf,p);
net = feedforwardnet(2);
net.layers{1:2}.transferFcn = 'logsig';
net.inputs{1}.processFcns = {};%eliminam faza de preprocesare: scalare, etc.
net.outputs{2}.processFcns = {};%eliminam faza de postprocesare: scalare, etc
net = configure(net,0,0);
%definim parametri de antrenare
%antrenare cu batch gradient descend cu moment
net.trainFcn = 'traingdm';
net.trainParam.show = 50;
net.trainParam.lr = 0.05;
net.trainParam.mc = 0.9;
net.trainParam.epochs = 1000;
net.trainParam.goal = 1e-5;
net.divideFcn = '';
[net,tr]=train(net,p,t);
plotperform(tr);

[net antrenare] = train(net, X, t);

end