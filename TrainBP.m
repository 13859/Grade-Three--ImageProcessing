clear;clc;close all;

%%
Name = {'��ֹ������ͨ��','��ֹͣ��','��ֹ��ת��'...
    'T��·��','խ��','ע������'...
    '���к��','����ת��','�Ҳ���ʻ','ֱ��'};
%Name = {'��ֹ������ͨ��','��ֹͣ��','��ֹ��ת��','��ֹʻ��','��ֹ��ת��','��ֹ��ͷ','��ֹ����','��ʱͣ��','�ᳵ����','��������'...
    %'T��·��','խ��','ע������','���ν���·��','������·','ע��Σ��','ע���ͯ','����·','Y�ͽ���·��','�׻�·��'...
    %'���к��','����ת��','�Ҳ���ʻ','ֱ��','����ֱ�к���ת����ʻ','������ʻ','��������','��·����','������','����ֱ�к�ת����ʻ'}; % �����ź� ��һ���Ͷ�Ӧ 1.png �ڶ�������2.png 

Num = 10; % ��ʶͼƬ����
Image = cell(1,Num); % �������ͼ��

Scale = 40; % ͳһ����ͼƬ��С
%���ɣ�40*40��*9��ȫ�����
Data = zeros(Scale*Scale,Num);

figure
for i = 1:Num
       %num2str����ֵת�����ַ��� 
       %strcat���������ַ���
       %��ȡͼƬ�ڵ���Ϣimread('1.png'...'9.png')
    Image{i} = imread(strcat(num2str(i),'.png'));
    %���ͼ���ǻҶ�
    %==1�ǻҶȣ�==3��RGB
    if size(Image{i},3) ~= 1
        %ת��Ϊ�Ҷ�ͼ��
        Image{i} = rgb2gray(Image{i});
    end
    Image{i} = imadjust(Image{i}); % �����ҶȶԱȶ�
    
    Image{i} = imresize(Image{i},[Scale,Scale]); % �����40*40��ͼ��
 
    Image{i} = im2bw(Image{i}); % ��ֵ����ֻ�кڰ���ɫ��
    subplot(6,5,i);%��������
    imshow(Image{i});%��ʾͼ��
   
    Data(:,i) = Image{i}(:); % ת��������
    
end

Dist = dist(Data);

Input = Dist;
%ones����ȫ1����
Output = -1*ones(Num,Num);%ȫ-1����Num=9
Label = 1:Num;

for i = 1:Num
  
    Output(i,i) = 1;
    
end

% ת��������  ÿ��Num�� ģʽ����Ӧ����һ�е���1 ����Ϊ0

Input = [Input Input Input Input]; % �ظ�ѵ��
Output = [Output Output Output Output];

%% ��������

% �������� epochs
% ѵ��Ŀ�� goal
% ѧϰЧ�� lr

% ѧϰ���� trainFcn

% 'trainrp'   �����ݶ��½�
% 'traingdm'  ���Ӷ���
% 'traingdx'  ����Ӧ
% 'trainlm'   LM�㷨

%rng(152,'twister'); % ���� <�̶������>  ������ֵ�������⻻
% �������˼�������� ÿ���ܳ��� ������̶���� ������������ �������ֵ �ǿ�����㻻�� ��һ�����һ�����


% ���� ����Ҹ��Ƚ���һ��  matlab��ANN һ����һ��Ŀ������ �Ǿ���ֹ�㷨�� 
% ���� ��������������100������ �����Լ��ֳ������� Ȼ��ֱ�ѵ���� ����ϸ����Ҳû����ϸ�о�
% [20,5] ����˼�� �������� ��һ��20 �ڶ���5 [3] ����˼���� һ�� 3����Ԫ
%ǰ�������磬Ĭ��ѵ��������trainlm��LM�㷨��

ly = [23];  %����ͽڵ���Ŀ
net_BP = feedforwardnet(ly);
net_BP.trainParam.epochs = 1e3;   % ѵ����������
net_BP.trainParam.goal = 1e-32;   % ѵ��Ŀ������
net_BP.trainParam.lr = 0.05;      % ѧϰ��
net_BP.trainParam.max_fail = 1e1;      % ������
net_BP.trainParam.min_grad = 1e-15;    % ��С�ݶ�

%��ѵ������train
%ѵ��������ʱ�䡢����ָ�ꡢ�ݶȡ�У����
[net_BP,tr] = train(net_BP,Input,Output);
%nntraintool('close'); % �ر�ѵ������

% �������

% ѵ�����
%����һ�������磨ѵ���õ������磬��������룩
T = sim(net_BP,Input);
%1��9��0����
Lab = zeros(1,Num); % ����ÿһ����ӽ�1��

for i = 1:Num
    
    [~,id] = min(abs(T(:,i)-1));
    Lab(i) = id(1);
    
end

E1 = (Lab-Label);

% ��ͼ

% �������ͼ

figure;
plot(tr.perf);
title('�������');

% ������

clc;

fprintf('\n\n>>ѵ�����:\n'); % ѵ�����
fprintf('  %d\n',sqrt(sum(E1.^2)/(numel(E1)-1)));

fprintf('\n\n>>��������:\n'); % ��������
fprintf('  %d\n',numel(tr.perf));

% ��ͼ

figure; % ��ʵ���ݸ��������ݶԱ�

plot(Lab,'ro');
hold on;
plot(Label,'.b');
legend('��������','��ʵ����');
xlim([1 Num]);

title(strcat('ʶ����������',num2str(sum(Lab~=Label))));

% ����ѵ���õ������Ա������õ�GUI��

Trained_BP = net_BP;

save Trained_BP Trained_BP
save Name Name
save Data Data