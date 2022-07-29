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

% Last Modified by GUIDE v2.5 26-May-2020 20:10:38

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


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global y1;
global y2;
global Yi;
%调制过程
        fs=1000;
        t= -0.1:1/fs:0.1;
        N=length(t);
       Yi=y1.*y2;
       Yw = fft(Yi);;
       f=(0:N-1)*fs/length(t) - fs/2;
       plot(handles.axes5,t,Yi);
       set(handles.axes5,'YLim');
       title(handles.axes5,'调制时域波形');
       plot(handles.axes6,f,fftshift(abs(Yw)));
       title(handles.axes6,'调制幅度谱');
       guidata(hObject, handles); 

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
        global Yi;
        global omega1;
        global omega2;
%解调过程
        fs=1000;
        t= -0.1:1/fs:0.1;
        N=length(t);
        f=(0:N-1)*fs/length(t) - fs/2;
       % Wp=fL/(fs/2); Ws=fH/(fs/2); 
       Wp=0.09; Ws=0.2; 
        Rp=3; Rs=20;
       [N,Wn]= buttord(Wp,Ws,Rp,Rs) ; 
       [B,A]=butter(N,Wn,'low');
       m0=filtfilt(B,A,Yi); %m0是滤波器滤波后的信号
       Yk = fft(m0);
       plot(handles.axes5,t,m0);
       set(handles.axes5,'YLim');
       title(handles.axes5,'解调时域波形');
       plot(handles.axes6,f,fftshift(abs(Yk)));
       title(handles.axes6,'解调幅度谱');
        guidata(hObject, handles); 
function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

fs=1000;
omega2 = str2num(get(handles.edit2,'String'));
t= -0.1:1/fs:0.1;
global y2;
global omega2;
y2=sin(2*pi*omega2*t);
fy = fft(y2);
N=length(t);
f=(0:N-1)*fs/length(t) - fs/2;
plot(handles.axes4,t,y2);
set(handles.axes4,'YLim');
title(handles.axes4,'时域波形');

plot(handles.axes3,f,fftshift(abs(fy)));
title(handles.axes3,'幅度谱');
guidata(hObject, handles); 

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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fs=1000;
omega1 = str2num(get(handles.edit1,'String'));
t= -0.1:1/fs:0.1;
global y1;
global omega1;
y1=sin(2*pi*omega1*t);
fy = fft(y1);
N=length(t);
f=(0:N-1)*fs/length(t) - fs/2;
plot(handles.axes2,t,y1);
set(handles.axes2,'YLim');
title(handles.axes2,'时域波形');
plot(handles.axes1,f,fftshift(abs(fy)));
title(handles.axes1,'幅度谱');
guidata(hObject, handles); 
