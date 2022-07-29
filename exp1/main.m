function varargout = main(varargin)
% MAIN MATLAB code for main.fig
%      MAIN, by itself, creates a new MAIN or raises the existing
%      singleton*.
%
%      H = MAIN returns the handle to a new MAIN or the handle to
%      the existing singleton*.
%
%      MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN.M with the given input arguments.
%
%      MAIN('Property','Value',...) creates a new MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main

% Last Modified by GUIDE v2.5 29-Dec-2018 21:42:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_OpeningFcn, ...
                   'gui_OutputFcn',  @main_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before main is made visible.
function main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main (see VARARGIN)

% Choose default command line output for main
handles.output = hObject;


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes main wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = main_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
choice=get(handles.popupmenu1,'Value');
fs=500;
dt=1/fs;
t=0:dt:2;
N=length(t);
switch choice
    case 1
       %�����10Hz���Ҳ���ʱ��Ϊ���涨���t���źŴ洢�ڱ���x��
       
       x=sin(2*pi*10*t);
       
    case 2
       %���������Ϊ1�ķ�����ʱ��Ϊ���涨���t���źŴ洢�ڱ���x��
       
       x=square(2*pi*t,50);
       
    case 3
        x=sawtooth(2*pi*t);
    case 4
        x=heaviside(t);
end
plot(handles.wave,t,x);
set(handles.wave,'YLim',[-1.5 1.5]);
title(handles.wave,'����');
%==================================
%��������������ź�x���и���Ҷ�任�Ĵ��룬����ʾ�任��ķ����׺���λ��
%��Ƶ��Ϊ����W������Ҷ�任��Ľ�������F��

    k = -N:N;
    W = 2*pi*k/((2*N+1)*dt);
    F = dt * x*exp(-j*t'*W); 
%==========================================
plot(handles.magnitude,W,abs(F));
title(handles.magnitude,'������');
plot(handles.phase,W,angle(F));
title(handles.phase,'��λ��');

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.panel,'Visible','on');
set(handles.panel1,'Visible','off');
set(handles.panel2,'Visible','off');

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.panel,'Visible','off');
set(handles.panel1,'Visible','on');
set(handles.panel2,'Visible','off');

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.panel,'Visible','off');
set(handles.panel1,'Visible','off');
set(handles.panel2,'Visible','on');


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double





% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in button1.
function button1_Callback(hObject, eventdata, handles)
% hObject    handle to button1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%========�벹������Ĵ���=========================
%�ο�ʵ�齲�壬�����������ɷ���Ϊ1������Ϊ1�ķ����źţ�ʱ���������Ϊt�������ź�Ϊy
    
    omega=2*pi; %��ý�Ƶ��
    t=-1:0.001:1;%�����ź�ʱ��
    y=square(2*pi*t,50); %���ɷ���
    plot(t,y)
    
%============================================
%��ȡ�û������г����������ʾ����ߴ�г���Ĳ��Ρ�

    n_max=1:1:str2num(get(handles.edit1,'String')); %����
    y_m=sin(2*pi*max(n_max)*t);
    
    plot(handles.C_harmonic,t,y_m);
    title(handles.C_harmonic,'��ߴ�г��')

    
%======�벹������Ĵ���======================
%��������д���룬���ǰmax��г���Է����źŵĺϳ�
%�ϳɺ�Ľ�������x������

     m=length(n_max); %��Ҫѭ������
    for k=1:m
       n=1:2: n_max(k); %�������������n ��һ�� 1*d ������
       M=4./(pi*n); %ϵ����M ��һ�� 1*d ������
       N=sin(2*pi*n'*t); %г��������� t ������һ��������N ��һ�� d*1 ������
       
       x=M*N; %�ϳɽ����x ��һ�� 1*2001 ������
   %    figure; %���ɿհ�ͼ��
   %    plot(t,y,'b',t, x,'r'); %������ͼ
    end
        

%============================
plot(handles.synthetic,t,y,t,x);
set(handles.synthetic,'YLim',[-1.5 1.5]);
title(handles.synthetic,'��κϳɺ�')



% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,filepath,~]=uigetfile({'*.mp3';'*.mp4';'*.wav'},...
                           'Select an audio file',...
                           'MultiSelect','off');
if(filename==0)
    return
else
    file=strcat(filepath,filename);
    set(handles.ViewPath,'String',filename);
    [tdata,fs]=audioread(file);%tdata�Ƕ������Ƶ�źţ�fs����Ƶ����Ƶ��
    tdata=tdata(:,2);%ȡ�������������ݽ��д���ע�⣺Ҳ���������������ݣ�����������������������
    tdata=tdata';
    t=0:1/fs:(length(tdata)-1)/fs;
    plot(handles.wave1,t,tdata);
    title(handles.wave1,'����');

    
    N=length(t);
    fdata=abs(fft(tdata,N));
    pdata=angle(fft(tdata,N));
    df=fs/N;
    f=(0:df:df*(N-1))-fs/2;
    plot(handles.magnitude1,f,fftshift(fdata));
    title(handles.magnitude1,'������');
    plot(handles.phase1,f,pdata);
    title(handles.phase1,'��λ��');
end


% --- Executes on button press in play.
function play_Callback(hObject, eventdata, handles)
% hObject    handle to play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filename=get(handles.ViewPath,'String');
[y Fs]=audioread(filename);
sound(y,Fs);


% --- Executes during object creation, after setting all properties.
function C_harmonic_CreateFcn(hObject, eventdata, handles)
% hObject    handle to C_harmonic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate C_harmonic
