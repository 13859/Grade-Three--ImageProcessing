clear;clc;close all;

%%
Name = {'禁止机动车通行','禁止停车','禁止左转弯'...
    'T型路口','窄桥','注意行人'...
    '人行横道','向右转弯','右侧行驶','直行'};
%Name = {'禁止机动车通行','禁止停车','禁止左转弯','禁止驶入','禁止右转弯','禁止掉头','禁止超车','临时停车','会车让行','减速让行'...
    %'T型路口','窄桥','注意行人','环形交叉路口','连续弯路','注意危险','注意儿童','上坡路','Y型交叉路口','易滑路面'...
    %'人行横道','向右转弯','右侧行驶','直行','立交直行和左转弯行驶','环岛行驶','机动车道','干路先行','鸣喇叭','立交直行和转弯行驶'}; % 这个编号号 第一个就对应 1.png 第二个就是2.png 

Num = 10; % 标识图片个数
Image = cell(1,Num); % 用来存放图像

Scale = 40; % 统一处理图片大小
%生成（40*40）*9的全零矩阵
Data = zeros(Scale*Scale,Num);

figure
for i = 1:Num
       %num2str把数值转换成字符串 
       %strcat横向连接字符串
       %获取图片内的信息imread('1.png'...'9.png')
    Image{i} = imread(strcat(num2str(i),'.png'));
    %如果图像不是灰度
    %==1是灰度，==3是RGB
    if size(Image{i},3) ~= 1
        %转换为灰度图像
        Image{i} = rgb2gray(Image{i});
    end
    Image{i} = imadjust(Image{i}); % 调整灰度对比度
    
    Image{i} = imresize(Image{i},[Scale,Scale]); % 都变成40*40的图像
 
    Image{i} = im2bw(Image{i}); % 二值化（只有黑白两色）
    subplot(6,5,i);%四行五列
    imshow(Image{i});%显示图像
   
    Data(:,i) = Image{i}(:); % 转换成向量
    
end

Dist = dist(Data);

Input = Dist;
%ones产生全1矩阵
Output = -1*ones(Num,Num);%全-1矩阵，Num=9
Label = 1:Num;

for i = 1:Num
  
    Output(i,i) = 1;
    
end

% 转换成向量  每列Num个 模式所对应的那一行等于1 其余为0

Input = [Input Input Input Input]; % 重复训练
Output = [Output Output Output Output];

%% 参数设置

% 迭代次数 epochs
% 训练目标 goal
% 学习效率 lr

% 学习函数 trainFcn

% 'trainrp'   弹性梯度下降
% 'traingdm'  附加动量
% 'traingdx'  自适应
% 'trainlm'   LM算法

%rng(152,'twister'); % 这里 <固定随机数>  里面数值可以随意换
% 这个的意思是这样： 每次跑程序 如果不固定这个 结果就是随机的 里面的数值 是可以随便换的 换一组就是一个结果


% 参数 这个我给先解释一下  matlab的ANN 一旦有一个目标满足 那就终止算法了 
% 并且 比如我们输入了100个样本 它会自己分成若干组 然后分别训练的 具体细节我也没有仔细研究
% [20,5] 的意思是 两个隐层 第一个20 第二个5 [3] 的意思就是 一层 3个神经元
%前馈神经网络，默认训练函数是trainlm（LM算法）

ly = [23];  %隐层和节点数目
net_BP = feedforwardnet(ly);
net_BP.trainParam.epochs = 1e3;   % 训练次数设置
net_BP.trainParam.goal = 1e-32;   % 训练目标设置
net_BP.trainParam.lr = 0.05;      % 学习率
net_BP.trainParam.max_fail = 1e1;      % 检测次数
net_BP.trainParam.min_grad = 1e-15;    % 最小梯度

%神经训练函数train
%训练次数、时间、性能指标、梯度、校验检查
[net_BP,tr] = train(net_BP,Input,Output);
%nntraintool('close'); % 关闭训练窗口

% 计算误差

% 训练误差
%仿真一个神经网络（训练好的神经网络，网络的输入）
T = sim(net_BP,Input);
%1行9列0矩阵
Lab = zeros(1,Num); % 查找每一列最接近1的

for i = 1:Num
    
    [~,id] = min(abs(T(:,i)-1));
    Lab(i) = id(1);
    
end

E1 = (Lab-Label);

% 画图

% 迭代误差图

figure;
plot(tr.perf);
title('迭代误差');

% 输出结果

clc;

fprintf('\n\n>>训练误差:\n'); % 训练误差
fprintf('  %d\n',sqrt(sum(E1.^2)/(numel(E1)-1)));

fprintf('\n\n>>迭代次数:\n'); % 迭代次数
fprintf('  %d\n',numel(tr.perf));

% 误差画图

figure; % 真实数据跟仿真数据对比

plot(Lab,'ro');
hold on;
plot(Label,'.b');
legend('仿真数据','真实数据');
xlim([1 Num]);

title(strcat('识别错误个数：',num2str(sum(Lab~=Label))));

% 保存训练好的网络以便我们用到GUI中

Trained_BP = net_BP;

save Trained_BP Trained_BP
save Name Name
save Data Data