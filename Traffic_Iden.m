function varargout = Traffic_Iden(varargin)
%      TRAFFIC_IDEN����ʹ�����һ���µ�TRAFFIC_IDEN����������еĵ���
%      H=TRAFFIC_IDEN��������ص��µ�TRAFFIC_IDEN�򷵻ص����е����ľ��
%      ������ΪCALLLBA CK��TRAFFIC_IDEN��.M ���и�����������ġ�
%      TRAFFIC_IDEN(��Property������Value����...)����һ���µ�TRAFFIC_IDEN��������еĵ���*��
%      ����߿�ʼ������ֵ����Traffic_Iden_OpeningFcn������֮ǰӦ�õ�GUI��	
%      �޷�ʶ����������ƻ���Чֵʹ����Ӧ�ó���ֹͣ�� �������붼ͨ��varargin���ݸ�Traffic_Iden_OpeningFcn��
%      �����ָ�Ϲ��߲˵��ϵ�GUIѡ� ѡ��GUIֻ��������һ��ʵ����������
%      �༭�����ı����޸���Ӧ�԰���Traffic_Iden

%��ʼ��ʼ������-��Ҫ�༭
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



% ��Traffic_Iden��ÿɼ�֮ǰִ��
function Traffic_Iden_OpeningFcn(hObject, eventdata, handles, varargin)
% .�˺���û�����args����μ����FCN
% hObject    ͼ�ľ��
% eventdata  ����-��δ����MATLAB�汾�ж���
% handles    ���о�����û����ݵĽṹ(�μ�GUIDATA)
% varargin   Traffic_Iden�������в���(��VARARGIN)


% ѡ��Traffic_Iden��Ĭ�����������
handles.output = hObject;
handles.cd0 = cd;
handles.Color = 0;
handles.I = [];

axes(handles.axes1);
set(gca,'Xtick',[]);%ȥ��x��Ŀ̶�
set(gca,'Ytick',[]);%ȥ��y��Ŀ̶�
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

% ���¾���ṹ
guidata(hObject, handles);


%UIWA ITʹTraffic_Iden�ȴ��û���Ӧ(�μ�UIRESUME)
% uiwait(handles.figure1);


% �˺�����������ص�������
function varargout = Traffic_Iden_OutputFcn(hObject, eventdata, handles) 
% varargout ���ڷ������arg��vargout��Ԫ����
% hObject   ͼ�ľ��
% eventdata ����-��δ����MATLAB�汾�ж���
% handles   ���о�����û����ݵĽṹ(�μ�GUIDATA)

% ��ȡ����ṹ�е�Ĭ��������
varargout{1} = handles.output;


% ����ѡ��ť3�еİ�ťִ�С�
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    ��ѡ��ť3�ľ��
% eventdata  ����-��δ����MATLAB�汾�ж���
% handles    ���о�����û����ݵĽṹ(�μ�GUIDATA)


%��ʾ��get(hObject����Value��)���ص�ѡ��ť3���л�״̬


% ����ѡ��ť4�еİ�ťִ�С�
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    ��ѡ��ť4�ľ��
% eventdata  ����-��δ����MATLAB�汾�ж���
% handles    ���о�����û����ݵĽṹ(�μ�GUIDATA)

%��ʾ��get(hObject����Value��)���ص�ѡ��ť4���л�״̬


% ����ѡ��ť5�еİ�ťִ��
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    ��ѡ��ť5�ľ��
% eventdata  ����-��δ����MATLAB�汾�ж���
% handles    ���о�����û����ݵĽṹ(�μ�GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5


	
%ִ�а�ť���°�ť1��
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    ��ť1�ľ��
% eventdata  ����-��δ����MATLAB�汾�ж���
% handles    ���о�����û����ݵĽṹ(�μ�GUIDATA)
%%  ��ͼ
[filename, cd1] = uigetfile( ...
    {'*.tif;*.TIF;*.JPG;*.jpg;*.bmp;*.BMP;*.jpeg;*.JPEG;','Image file';...
    '*.*', 'All file (*.*)'},'Pick an Image');
axes(handles.axes1);
cla;%�������ϵ���൱�ڳ�ʼ��axes
axes(handles.axes2);
cla;
axes(handles.axes3);
cla;
axes(handles.axes4);
cla;
if filename

    cd(cd1);%Ŀ¼
    d = imread(filename);%��ȡͼƬ����
    cd(handles.cd0);
    handles.I = d;
    axes(handles.axes1);%��������ϵ
    imshow(d);%��ʾ�Ҷ�ͼ
    handles.filename = filename; 

    box on;%��ʾ�ұߺ��ϱ߿�
    
end

handles.Color = 0;
cd(handles.cd0);
set(handles.text2,'string','');
guidata(hObject, handles);


% ִ�а�ť���°�ť2��
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    ��ť2�ľ��
% eventdata  ����-��δ����MATLAB�汾�ж���
% handles    ���о�����û����ݵĽṹ(�μ�GUIDATA)
%% ��ȡ��־
% ������ɫ����
Color = 0; % ��ɫ���  1�Ǻ� 2 ���� 3�ǻ�ɫ

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
    
    case 1  %��
        
        DI = Image(:,:,1);%�Ҷ�ͼ
        GI = (Image(:,:,1)>110 & Image(:,:,2)<150 & Image(:,:,3)<150 ...
            & abs(double(Image(:,:,2))-double(Image(:,:,3)))<50 & abs(double(Image(:,:,1))-double(Image(:,:,2)))>30);
        %��ֵͼ
    case 2   %��
        
        DI = Image(:,:,3);
        GI = (Image(:,:,1)<100 & Image(:,:,2)<150 & Image(:,:,3)>120 ...
             & abs(double(Image(:,:,2))-double(Image(:,:,3)))>30);
        
    case 3 %��
        
        DI = rgb2gray(Image);  %�Ҷ�ͼ
        GI = (Image(:,:,1)>160 & Image(:,:,2)>90 & Image(:,:,3)<90 ...
            & abs(double(Image(:,:,1))-double(Image(:,:,2)))<100 & abs(double(Image(:,:,1))-double(Image(:,:,3)))>90);
        
end

axes(handles.axes2);
imshow(DI);

axes(handles.axes3);

imshow(GI);

handles.GI = GI;

guidata(hObject, handles);
        

% ִ�а�ť���°�ť3��
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject     ��ť3�ľ��
% eventdata  ����-��δ����MATLAB�汾�ж���
% handles    ���о�����û����ݵĽṹ(�μ�GUIDATA)

% �ָ��־
d = handles.GI;

se = ones(3);  % ��ʴ����ģ��  �������е�ȫ1����
imshow(d)



d = imdilate(d,se);%����

d = bwareaopen(d,100); % �Ƴ�С���� С����϶�������
%ɾ��С�������  ���ã�ɾ����ֵͼ��d�����С��100�Ķ���Ĭ�������ʹ��8����


L = bwlabel(d,8); %�����ͨ 8��ͨ
%L = bwlabel(BW,n)
% ����һ����BW��С��ͬ��L���󣬰����˱����BW��ÿ����ͨ���������ǩ��
% ��Щ��ǩ��ֵΪ1��2��num����ͨ����ĸ�������n��ֵΪ4��8����ʾ�ǰ�4��ͨѰ�����򣬻���8��ͨѰ�ң�Ĭ��Ϊ8

Num = max(max(L)); % �м�������   ������--��

S = zeros(1,Num);  %1*num��ȫ�����

for i = 1:Num
    
    S(i) = sum(sum(L == i));%�����
    
end

[S,id] = sort(S,'descend'); %��������  id��S��sizeһ����
%[B,IX]=sort(A,...)��IXΪ�����Ԫ����ԭ�����е���λ�û���λ�õ�������
%Ϊ��Aͬ����С�ı���������ÿ�У�dim=2����ÿ�У�dim=1���鲼1������m����鲼1������n
Ran = zeros(Num,4); % ��Χ

Fig = zeros(1,Num); % �����

for i = 1:Num
    
    [ix,iy] = find(L == id(i));%Ѱ�ҷ���Ԫ�ص�������ֵ
    
    Ran(i,:) = [min(ix),max(ix),min(iy),max(iy)]; % ÿһ������ķ�Χ
    
end


for i = 1:Num
    
    Fig(i) = max(Ran(i,2)-Ran(i,1),Ran(i,4)-Ran(i,3))/min(Ran(i,2)-Ran(i,1),Ran(i,4)-Ran(i,3));
    
end
in = 0;

for i = 1:Num
    
    if Fig(i) < 1.5 % ������ǽӽ�1�� ���Բ���̫����
        
        in = i;
        
        break;
        
    end
    
end

if in == 0
    
    in = 1; % �������������϶��������һ���� ��ʱ��϶����и��ŵ�
    
end
if handles.Color ~= 3
    
    xmin = Ran(in,1);
    xmax = Ran(in,2);
    ymin = Ran(in,3);
    ymax = Ran(in,4);
    
    II = handles.I(xmin:xmax,ymin:ymax,:);
    
elseif handles.Color == 3 % ��ɫ�Ķ���һ�� �к�ɫ�߿�
   
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



% ִ�а�ť���°�ť4��
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    ��ť4�ľ��
% eventdata  ����-��δ����MATLAB�汾�ж���
% handles    ���о�����û����ݵĽṹ(�μ�GUIDATA)
%% �����ť�ر����
close all;
clear;
clc;


% ִ�а�ť���°�ť5��
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject   ��ť5�ľ��
% eventdata  ����-��δ����MATLAB�汾�ж���
% handles    ���о�����û����ݵĽṹ(�μ�GUIDATA)
%% ʶ��ť

I = handles.Divice;
load Name Name;
load Trained_BP Trained_BP;
load Data Data;

if size(I,3) ~= 1
    I = rgb2gray(I);
end
I = imadjust(I); % �����Աȶ�    
I = imresize(I,[40,40]); % �����40*40��ͼ��

I = im2bw(I); % ��ֵ��
I = I(:);

distance = zeros(1,size(Data,2));
%zeros(n,m)����һ��nxm�ľ���
%size(a)��ʾ����a�Ĵ�С����s=size(a)������һ��������s��s�ĵ�һ��Ԫ���Ǿ�����������ڶ���Ԫ���Ǿ��������

for i = 1:size(Data,2)
    distance(i) = norm(I-Data(:,i),2);
end
% ʶ�𲿷� str�����ı�־���� ���ַ���ʶ��

% 1 ������ʶ�� �������仰 ��Ҫ��ע��
T = sim(Trained_BP,distance');
id = find(abs(T-1) == min(abs(T-1)));
str = Name{id(1)};


% 2 ģ��ƥ��:������С�ľͿ��Ա���Ϊ���Ǹ�ģ�� 
%  �������Ҫ ע������������

id = find(distance == min(distance));
str = Name{id(1)};

set(handles.text2,'string',str);
