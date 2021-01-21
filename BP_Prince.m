function [BPnet,tr] = BP_Prince(Input,Output,trainFcn,epochs,goal,lr,ly,fail,grad)

% ³õÊ¼»¯ÍøÂç

net = feedforwardnet(ly,trainFcn);

% ÍøÂç²ÎÊı
net = init(net); 
net.trainParam.epochs = epochs;
net.trainParam.goal = goal;
net.trainParam.lr = lr;
net.trainParam.max_fail = fail;
net.trainParam.min_grad = grad;

% ÑµÁ·
[net,tr] = train(net,Input,Output);
BPnet = net;