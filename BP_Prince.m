function [BPnet,tr] = BP_Prince(Input,Output,trainFcn,epochs,goal,lr,ly,fail,grad)

% ��ʼ������

net = feedforwardnet(ly,trainFcn);

% �������
net = init(net); 
net.trainParam.epochs = epochs;
net.trainParam.goal = goal;
net.trainParam.lr = lr;
net.trainParam.max_fail = fail;
net.trainParam.min_grad = grad;

% ѵ��
[net,tr] = train(net,Input,Output);
BPnet = net;