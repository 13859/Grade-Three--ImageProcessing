function varargout = Traffic_Iden(varargin)
%      TRAFFIC_IDEN本身就创造了一个新的TRAFFIC_IDEN或提高了现有的单例
%      H=TRAFFIC_IDEN将句柄返回到新的TRAFFIC_IDEN或返回到现有单例的句柄
%      函数名为CALLLBA CK在TRAFFIC_IDEN中.M 具有给定输入参数的。
%      TRAFFIC_IDEN(‘Property’，‘Value’，...)创建一个新的TRAFFIC_IDEN或提高现有的单例*。
%      从左边开始，属性值对在Traffic_Iden_OpeningFcn被调用之前应用到GUI。	
%      无法识别的属性名称或无效值使属性应用程序停止。 所有输入都通过varargin传递给Traffic_Iden_OpeningFcn。
%      请参阅指南工具菜单上的GUI选项。 选择“GUI只允许运行一个实例（单例）
%      编辑上述文本以修改响应以帮助Traffic_Iden

%开始初始化代码-不要编辑
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Traffic_Iden_OpeningFcn, ...
                   'gui_OutputFcn',  @Traffic_Iden_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end



% 在Traffic_Iden变得可见之前执行
function Traffic_Iden_OpeningFcn(hObject, eventdata, handles, varargin)
% .此函数没有输出args，请参见输出FCN
% hObject    图的句柄
% eventdata  保留-在未来的MATLAB版本中定义
% handles    具有句柄和用户数据的结构(参见GUIDATA)
% varargin   Traffic_Iden的命令行参数(见VARARGIN)


% 选择Traffic_Iden的默认命令行输出
handles.output = hObject;
handles.cd0 = cd;
handles.Color = 0;
handles.I = [];

axes(handles.axes1);
set(gca,'Xtick',[]);%去除x轴的刻度
set(gca,'Ytick',[]);%去除y轴的刻度
box on;

axes(handles.axes2);
set(gca,'Xtick',[]);
set(gca,'Ytick',[]);
box on;

axes(handles.axes3);
set(gca,'Xtick',[]);
set(gca,'Ytick',[]);
box on;

axes(handles.axes4);
set(gca,'Xtick',[]);
set(gca,'Ytick',[]);
box on;

% 更新句柄结构
guidata(hObject, handles);


%UIWA IT使Traffic_Iden等待用户响应(参见UIRESUME)
% uiwait(handles.figure1);


% 此函数的输出返回到命令行
function varargout = Traffic_Iden_OutputFcn(hObject, eventdata, handles) 
% varargout 用于返回输出arg的vargout单元数组
% hObject   图的句柄
% eventdata 保留-在未来的MATLAB版本中定义
% handles   具有句柄和用户数据的结构(参见GUIDATA)

% 获取句柄结构中的默认命令行
varargout{1} = handles.output;


% 按单选按钮3中的按钮执行。
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    单选按钮3的句柄
% eventdata  保留-在未来的MATLAB版本中定义
% handles    具有句柄和用户数据的结构(参见GUIDATA)


%提示：get(hObject，‘Value’)返回单选按钮3的切换状态


% 按单选按钮4中的按钮执行。
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    单选按钮4的句柄
% eventdata  保留-在未来的MATLAB版本中定义
% handles    具有句柄和用户数据的结构(参见GUIDATA)

%提示：get(hObject，‘Value’)返回单选按钮4的切换状态


% 按单选按钮5中的按钮执行
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    单选按钮5的句柄
% eventdata  保留-在未来的MATLAB版本中定义
% handles    具有句柄和用户数据的结构(参见GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5


	
%执行按钮按下按钮1。
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    按钮1的句柄
% eventdata  保留-在未来的MATLAB版本中定义
% handles    具有句柄和用户数据的结构(参见GUIDATA)
%%  读图
[filename, cd1] = uigetfile( ...
    {'*.tif;*.TIF;*.JPG;*.jpg;*.bmp;*.BMP;*.jpeg;*.JPEG;','Image file';...
    '*.*', 'All file (*.*)'},'Pick an Image');
axes(handles.axes1);
cla;%清除坐标系，相当于初始化axes
axes(handles.axes2);
cla;
axes(handles.axes3);
cla;
axes(handles.axes4);
cla;
if filename

    cd(cd1);%目录
    d = imread(filename);%获取图片数据
    cd(handles.cd0);
    handles.I = d;
    axes(handles.axes1);%创建坐标系
    imshow(d);%显示灰度图
    handles.filename = filename; 

    box on;%显示右边和上边框
    
end

handles.Color = 0;
cd(handles.cd0);
set(handles.text2,'string','');
guidata(hObject, handles);


% 执行按钮按下按钮2。
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    按钮2的句柄
% eventdata  保留-在未来的MATLAB版本中定义
% handles    具有句柄和用户数据的结构(参见GUIDATA)
%% 提取标志
% 按照颜色来分
Color = 0; % 颜色标记  1是红 2 是蓝 3是黄色

if get(handles.radiobutton3,'Value')
    
    Color = 1;
    
elseif get(handles.radiobutton4,'Value')
    
    Color = 2;
    
elseif get(handles.radiobutton5,'Value')
    
    Color = 3;

end

handles.Color = Color;

Image = handles.I;

switch Color
    
    case 1  %红
        
        DI = Image(:,:,1);%灰度图
        GI = (Image(:,:,1)>110 & Image(:,:,2)<150 & Image(:,:,3)<150 ...
            & abs(double(Image(:,:,2))-double(Image(:,:,3)))<50 & abs(double(Image(:,:,1))-double(Image(:,:,2)))>30);
        %二值图
    case 2   %蓝
        
        DI = Image(:,:,3);
        GI = (Image(:,:,1)<100 & Image(:,:,2)<150 & Image(:,:,3)>120 ...
             & abs(double(Image(:,:,2))-double(Image(:,:,3)))>30);
        
    case 3 %黄
        
        DI = rgb2gray(Image);  %灰度图
        GI = (Image(:,:,1)>160 & Image(:,:,2)>90 & Image(:,:,3)<90 ...
            & abs(double(Image(:,:,1))-double(Image(:,:,2)))<100 & abs(double(Image(:,:,1))-double(Image(:,:,3)))>90);
        
end

axes(handles.axes2);
imshow(DI);

axes(handles.axes3);

imshow(GI);

handles.GI = GI;

guidata(hObject, handles);
        

% 执行按钮按下按钮3。
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject     按钮3的句柄
% eventdata  保留-在未来的MATLAB版本中定义
% handles    具有句柄和用户数据的结构(参见GUIDATA)

% 分割标志
d = handles.GI;

se = ones(3);  % 腐蚀膨胀模版  三行三列的全1矩阵
imshow(d)



d = imdilate(d,se);%膨胀

d = bwareaopen(d,100); % 移除小对象 小区域肯定是噪声
%删除小面积对象  作用：删除二值图像d中面积小于100的对象，默认情况下使用8邻域


L = bwlabel(d,8); %标记连通 8连通
%L = bwlabel(BW,n)
% 返回一个和BW大小相同的L矩阵，包含了标记了BW中每个连通区域的类别标签，
% 这些标签的值为1、2、num（连通区域的个数）。n的值为4或8，表示是按4连通寻找区域，还是8连通寻找，默认为8

Num = max(max(L)); % 有几个区域   返回行--个

S = zeros(1,Num);  %1*num的全零矩阵

for i = 1:Num
    
    S(i) = sum(sum(L == i));%列求和
    
end

[S,id] = sort(S,'descend'); %降序排列  id和S的size一样大
%[B,IX]=sort(A,...)：IX为排序后备元素在原矩阵中的行位置或列位置的索引，
%为与A同样大小的标量矩阵，且每行（dim=2）或每列（dim=1）遍布1：行数m，或遍布1：列数n
Ran = zeros(Num,4); % 范围

Fig = zeros(1,Num); % 长宽比

for i = 1:Num
    
    [ix,iy] = find(L == id(i));%寻找非零元素的索引和值
    
    Ran(i,:) = [min(ix),max(ix),min(iy),max(iy)]; % 每一个区域的范围
    
end


for i = 1:Num
    
    Fig(i) = max(Ran(i,2)-Ran(i,1),Ran(i,4)-Ran(i,3))/min(Ran(i,2)-Ran(i,1),Ran(i,4)-Ran(i,3));
    
end
in = 0;

for i = 1:Num
    
    if Fig(i) < 1.5 % 长宽比是接近1的 所以不会太离谱
        
        in = i;
        
        break;
        
    end
    
end

if in == 0
    
    in = 1; % 如果都不满足就认定面积最大的一个了 这时候肯定是有干扰的
    
end
if handles.Color ~= 3
    
    xmin = Ran(in,1);
    xmax = Ran(in,2);
    ymin = Ran(in,3);
    ymax = Ran(in,4);
    
    II = handles.I(xmin:xmax,ymin:ymax,:);
    
elseif handles.Color == 3 % 黄色的多切一点 有黑色边框
   
    xmin = Ran(in,1)-round((Ran(in,2)-Ran(in,1))*0.15);
    xmax = Ran(in,2)+round((Ran(in,2)-Ran(in,1))*0.15);
    ymin = Ran(in,3)-round((Ran(in,4)-Ran(in,3))*0.15);
    ymax = Ran(in,4)+round((Ran(in,4)-Ran(in,3))*0.15);
    
    II = handles.I(xmin:xmax,ymin:ymax,:);
    
end

axes(handles.axes4);
imshow(II);
handles.Divice = II;
guidata(hObject, handles);



% 执行按钮按下按钮4。
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    按钮4的句柄
% eventdata  保留-在未来的MATLAB版本中定义
% handles    具有句柄和用户数据的结构(参见GUIDATA)
%% 这个按钮关闭软件
close all;
clear;
clc;


% 执行按钮按下按钮5。
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject   按钮5的句柄
% eventdata  保留-在未来的MATLAB版本中定义
% handles    具有句柄和用户数据的结构(参见GUIDATA)
%% 识别按钮

I = handles.Divice;
load Name Name;
load Trained_BP Trained_BP;
load Data Data;

if size(I,3) ~= 1
    I = rgb2gray(I);
end
I = imadjust(I); % 调整对比度    
I = imresize(I,[40,40]); % 都变成40*40的图像

I = im2bw(I); % 二值化
I = I(:);

distance = zeros(1,size(Data,2));
%zeros(n,m)生成一个nxm的矩阵
%size(a)显示矩阵a的大小或者s=size(a)。返回一个行向量s，s的第一个元素是矩阵的行数，第二个元素是矩阵的列数

for i = 1:size(Data,2)
    distance(i) = norm(I-Data(:,i),2);
end
% 识别部分 str是最后的标志名称 两种方法识别

% 1 神经网络识别 下面三句话 不要就注释
T = sim(Trained_BP,distance');
id = find(abs(T-1) == min(abs(T-1)));
str = Name{id(1)};


% 2 模板匹配:距离最小的就可以被认为是那个模版 
%  如果不需要 注释下面这两行

id = find(distance == min(distance));
str = Name{id(1)};

set(handles.text2,'string',str);
