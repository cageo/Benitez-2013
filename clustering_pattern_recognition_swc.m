function varargout = clustering_pattern_recognition_swc(varargin)
% CLUSTERING_PATTERN_RECOGNITION_SWC M-file for clustering_pattern_recognition_swc.fig
%      CLUSTERING_PATTERN_RECOGNITION_SWC, by itself, creates a new CLUSTERING_PATTERN_RECOGNITION_SWC or raises the existing
%      singleton*.
%
%      H = CLUSTERING_PATTERN_RECOGNITION_SWC returns the handle to a new CLUSTERING_PATTERN_RECOGNITION_SWC or the handle to
%      the existing singleton*.
%
%      CLUSTERING_PATTERN_RECOGNITION_SWC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CLUSTERING_PATTERN_RECOGNITION_SWC.M with the given input arguments.
%
%      CLUSTERING_PATTERN_RECOGNITION_SWC('Property','Value',...) creates a new CLUSTERING_PATTERN_RECOGNITION_SWC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before clustering_pattern_recognition_swc_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to clustering_pattern_recognition_swc_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help clustering_pattern_recognition_swc

% Last Modified by GUIDE v2.5 07-Mar-2012 09:41:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @clustering_pattern_recognition_swc_OpeningFcn, ...
                   'gui_OutputFcn',  @clustering_pattern_recognition_swc_OutputFcn, ...
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


% --- Executes just before clustering_pattern_recognition_swc is made visible.
function clustering_pattern_recognition_swc_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to clustering_pattern_recognition_swc (see VARARGIN)

% Set the colors indicating a selected/unselected tab
handles.unselectedTabColor=get(handles.tab1text,'BackgroundColor');
handles.selectedTabColor=handles.unselectedTabColor-0.1;

% Set units to normalize for easier handling
set(handles.tab1text,'Units','normalized')
set(handles.tab2text,'Units','normalized')
set(handles.tab3text,'Units','normalized')
set(handles.tab1Panel,'Units','normalized')
set(handles.tab2Panel,'Units','normalized')
set(handles.tab3Panel,'Units','normalized')

% Create tab labels (as many as you want according to following code template)

% Tab 1
pos1=get(handles.tab1text,'Position');
handles.a1=axes('Units','normalized',...
                'Box','on',...
                'XTick',[],...
                'YTick',[],...
                'Color',handles.selectedTabColor,...
                'Position',[pos1(1) pos1(2) pos1(3) pos1(4)+0.01],...
                'ButtonDownFcn','clustering_pattern_recognition_swc(''a1bd'',gcbo,[],guidata(gcbo))');
handles.t1=text('String','Clustering tendency',...
                'Units','normalized',...
                'Position',[(pos1(3)-pos1(1))/2,pos1(2)/2+pos1(4)],...
                'HorizontalAlignment','left',...
                'VerticalAlignment','middle',...
                'Margin',0.001,...
                'FontSize',8,...
                'Backgroundcolor',handles.selectedTabColor,...
                'ButtonDownFcn','clustering_pattern_recognition_swc(''t1bd'',gcbo,[],guidata(gcbo))');

% Tab 2
pos2=get(handles.tab2text,'Position');
pos2(1)=pos1(1)+pos1(3);
handles.a2=axes('Units','normalized',...
                'Box','on',...
                'XTick',[],...
                'YTick',[],...
                'Color',handles.unselectedTabColor,...
                'Position',[pos2(1) pos2(2) pos2(3) pos2(4)+0.01],...
                'ButtonDownFcn','clustering_pattern_recognition_swc(''a2bd'',gcbo,[],guidata(gcbo))');
handles.t2=text('String','Clustering analysis',...
                'Units','normalized',...
                'Position',[pos2(3)/2,pos2(2)/2+pos2(4)],...
                'HorizontalAlignment','left',...
                'VerticalAlignment','middle',...
                'Margin',0.001,...
                'FontSize',8,...
                'Backgroundcolor',handles.unselectedTabColor,...
                'ButtonDownFcn','clustering_pattern_recognition_swc(''t2bd'',gcbo,[],guidata(gcbo))');
           
% Tab 3 
pos3=get(handles.tab3text,'Position');
pos3(1)=pos2(1)+pos2(3);
handles.a3=axes('Units','normalized',...
                'Box','on',...
                'XTick',[],...
                'YTick',[],...
                'Color',handles.unselectedTabColor,...
                'Position',[pos3(1) pos3(2) pos3(3) pos3(4)+0.01],...
                'ButtonDownFcn','clustering_pattern_recognition_swc(''a3bd'',gcbo,[],guidata(gcbo))');
handles.t3=text('String','Cluster validity',... % """
                'Units','normalized',...
                'Position',[pos3(3)/2,pos3(2)/2+pos3(4)],...
                'HorizontalAlignment','left',...
                'VerticalAlignment','middle',...
                'Margin',0.001,...
                'FontSize',8,...
                'Backgroundcolor',handles.unselectedTabColor,...
                'ButtonDownFcn','clustering_pattern_recognition_swc(''t3bd'',gcbo,[],guidata(gcbo))');
            
% Manage panels (place them in the correct position and manage visibilities)
pan1pos=get(handles.tab1Panel,'Position');
set(handles.tab2Panel,'Position',pan1pos)
set(handles.tab3Panel,'Position',pan1pos)
set(handles.tab2Panel,'Visible','off')
set(handles.tab3Panel,'Visible','off')

% Inialization variables

handles.radiobutton1.Value = 0; handles.radiobutton1.PrevState = 0;
handles.radiobutton2.Value = 0; handles.radiobutton2.PrevState = 0;
handles.radiobutton3.Value = 0; handles.radiobutton3.PrevState = 0;

handles.radiobutton4.Value = 1; 
handles.radiobutton5.Value = 0; 
handles.radiobutton6.Value = 0; 

handles.ClusteringTendency.Hopkins=1;
handles.ClusteringTendency.CoxLewis=0;

% Choose default command line output for clustering_pattern_recognition_swc
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes clustering_pattern_recognition_swc wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = clustering_pattern_recognition_swc_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% Text object 1 callback (tab 1)
function t1bd(hObject,eventdata,handles)

set(hObject,'BackgroundColor',handles.selectedTabColor)
set(handles.t2,'BackgroundColor',handles.unselectedTabColor)
set(handles.t3,'BackgroundColor',handles.unselectedTabColor)
set(handles.a1,'Color',handles.selectedTabColor)
set(handles.a2,'Color',handles.unselectedTabColor)
set(handles.a3,'Color',handles.unselectedTabColor)
set(handles.tab1Panel,'Visible','on')
set(handles.tab2Panel,'Visible','off')
set(handles.tab3Panel,'Visible','off')


% Text object 2 callback (tab 2)
function t2bd(hObject,eventdata,handles)

set(hObject,'BackgroundColor',handles.selectedTabColor)
set(handles.t1,'BackgroundColor',handles.unselectedTabColor)
set(handles.t3,'BackgroundColor',handles.unselectedTabColor)
set(handles.a2,'Color',handles.selectedTabColor)
set(handles.a1,'Color',handles.unselectedTabColor)
set(handles.a3,'Color',handles.unselectedTabColor)
set(handles.tab2Panel,'Visible','on')
set(handles.tab1Panel,'Visible','off')
set(handles.tab3Panel,'Visible','off')


% Text object 3 callback (tab 3)
function t3bd(hObject,eventdata,handles)

set(hObject,'BackgroundColor',handles.selectedTabColor)
set(handles.t1,'BackgroundColor',handles.unselectedTabColor)
set(handles.t2,'BackgroundColor',handles.unselectedTabColor)
set(handles.a3,'Color',handles.selectedTabColor)
set(handles.a1,'Color',handles.unselectedTabColor)
set(handles.a2,'Color',handles.unselectedTabColor)
set(handles.tab3Panel,'Visible','on')
set(handles.tab1Panel,'Visible','off')
set(handles.tab2Panel,'Visible','off')


% Axes object 1 callback (tab 1)
function a1bd(hObject,eventdata,handles)

set(hObject,'Color',handles.selectedTabColor)
set(handles.a2,'Color',handles.unselectedTabColor)
set(handles.a3,'Color',handles.unselectedTabColor)
set(handles.t1,'BackgroundColor',handles.selectedTabColor)
set(handles.t2,'BackgroundColor',handles.unselectedTabColor)
set(handles.t3,'BackgroundColor',handles.unselectedTabColor)
set(handles.tab1Panel,'Visible','on')
set(handles.tab2Panel,'Visible','off')
set(handles.tab3Panel,'Visible','off')


% Axes object 2 callback (tab 2)
function a2bd(hObject,eventdata,handles)

set(hObject,'Color',handles.selectedTabColor)
set(handles.a1,'Color',handles.unselectedTabColor)
set(handles.a3,'Color',handles.unselectedTabColor)
set(handles.t2,'BackgroundColor',handles.selectedTabColor)
set(handles.t1,'BackgroundColor',handles.unselectedTabColor)
set(handles.t3,'BackgroundColor',handles.unselectedTabColor)
set(handles.tab2Panel,'Visible','on')
set(handles.tab1Panel,'Visible','off')
set(handles.tab3Panel,'Visible','off')


% Axes object 3 callback (tab 3)
function a3bd(hObject,eventdata,handles)

set(hObject,'Color',handles.selectedTabColor)
set(handles.a1,'Color',handles.unselectedTabColor)
set(handles.a2,'Color',handles.unselectedTabColor)
set(handles.t3,'BackgroundColor',handles.selectedTabColor)
set(handles.t1,'BackgroundColor',handles.unselectedTabColor)
set(handles.t2,'BackgroundColor',handles.unselectedTabColor)
set(handles.tab3Panel,'Visible','on')
set(handles.tab1Panel,'Visible','off')
set(handles.tab2Panel,'Visible','off')


% --- Load and Preprocessing data -----------------------------------------

% --- Executes on button press in AddFiles.
function AddFiles_Callback(hObject, eventdata, handles)
% hObject    handle to AddFiles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
[filename, pathname,~] = uigetfile( ...
   {'*.mat';'*.csv'},'Pick a dataset file');
[~, name, ext] = fileparts(filename);

switch ext
    case '.mat'
        set(handles.text1,'String',filename)
        X = open(strcat(pathname,filename));
        handles.DataSet.DataSet = X.(name);        
        handles.DataSet.DataSetCopy = X.(name);  
    case '.csv'
        set(handles.text1,'String',filename)
        X = open(strcat(pathname,filename));
        handles.DataSet.DataSet = X.(name);        
        handles.DataSet.DataSetCopy = X.(name); 
    otherwise
        set(handles.text1,'String','')
        errordlg(strcat(ext,' file',' can not be open'))
end
catch exception
    if(strcmp('MATLAB:fileparts:MustBeChar',exception.identifier))
    end
end
guidata(hObject,handles);

function edit_TitleLabels_Callback(hObject, eventdata, handles)
% hObject    handle to edit_TitleLabels (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_TitleLabels as text
%        str2double(get(hObject,'String')) returns contents of edit_TitleLabels as a double
% if handles.Reset==0
    TitleLabels=get(hObject,'String');
    try
        handles.DataSet.TitleLabels = eval(TitleLabels);
    catch exception
        errordlg(strcat(exception.message,'Push on the button (?), to see the syntax'),'Syntax error')
    end
% else
%     set(hObject,'String','')
%     handles.Reset=0;
% end
guidata(hObject,handles);
% --- Executes during object creation, after setting all properties.
function edit_TitleLabels_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_TitleLabels (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in helpTitleLabels.
function helpTitleLabels_Callback(hObject, eventdata, handles)
% hObject    handle to helpTitleLabels (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
user_message = 'In the editable white box you can write dataset information as dataset and features names, for example, {attrib1_name,attrib2_name,...,attribN_name,dataset_title}';
helpdlg(user_message,'Help about Dataset and features names');
             
% --- Executes on button press in PlotDataset.
function PlotDataset_Callback(hObject, eventdata, handles)
% hObject    handle to PlotDataset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% if (handles.radiobutton1.Value == 0 &&  handles.radiobutton2.Value == 0 ...
%     && handles.radiobutton3.Value ==0 && isfield(handles,'DataSet'))
%     handles.DataSet.DataSet=handles.DataSet.DataSetCopy;
% end

if isfield(handles,'DataSet') && isfield(handles.DataSet,'DataSet')
    prompt = {'Enter array of plotting atributes (at most 3-vector component): '};
    dlg_title = 'Plotting attributes';
    num_lines = 1;

    def = {'[1 2]'};
    if isfield(handles.DataSet,'TitleLabels')
        features_names = handles.DataSet.TitleLabels; % labels & title
    else
        features_names = {'x_{1}','x_{2}','x_{3}','Data Set'};
    end
    answer = inputdlg(prompt,dlg_title,num_lines,def);
    if isempty(answer)
        return;
    end
    try
        graph_groups(handles.DataSet.DataSet(:,str2num(answer{1})),[features_names(str2num(answer{1})) features_names(end)])
    catch exception
        errordlg(exception.message)
    end

else
    errordlg('First, you must load a dataset','Error 1')
end
guidata(hObject,handles);

% --- Executes on button press in Reset.
function Reset_Callback(hObject, eventdata, handles)
% hObject    handle to Reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if isfield(handles,'DataSet')
    handles=rmfield(handles,'DataSet'); % remove field
end
set(handles.text1,'String','');
set(handles.edit_TitleLabels,'String','');
set(handles.edit_p,'String','');
set(handles.text10,'String','');
set(handles.text11,'String','');
set(handles.text12,'String','');
set(handles.text13,'String','');


handles.radiobutton1.Value=0; handles.radiobutton1.PrevState = 0;
handles.radiobutton2.Value=0; handles.radiobutton2.PrevState = 0;
handles.radiobutton3.Value=0; handles.radiobutton3.PrevState = 0;

guidata(hObject,handles);

% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if (handles.radiobutton2.Value == 1 || handles.radiobutton3.Value == 1)
        errordlg('Just one standardization method can be pressed at the time','Error 2');
        set(hObject,'Value',0)
        
elseif ((get(hObject,'Value') == get(hObject,'Max')) && isfield(handles,'DataSet'))
	% Radio button is selected-take appropriate action       
    handles.DataSet.DataSet = normalization('nomean',handles.DataSet.DataSet);  
    % Save the state of radiobutton1
    handles.radiobutton1.Value = 1;
    handles.radiobutton1.PrevState = 1;
    
elseif (handles.radiobutton1.PrevState == 1 && get(hObject,'Value')==0)
    handles.radiobutton1.PrevState = 0;
    handles.radiobutton1.Value = 0;
    handles.DataSet.DataSet = handles.DataSet.DataSetCopy;  
else
    errordlg('First, you must load a dataset','Error 1');  
    set(hObject,'Value',0)
	% Radio button is not selected-take appropriate action
    handles.radiobutton1.Value = 0;
    handles.radiobutton1.PrevState = 0;
end
guidata(hObject, handles);

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
if (handles.radiobutton1.Value == 1 || handles.radiobutton3.Value == 1)
        errordlg('Just one standardization method can be pressed at the time','Error 2');
        set(hObject,'Value',0)
       
elseif (get(hObject,'Value') == get(hObject,'Max') && isfield(handles,'DataSet'))
     isfield(handles,'DataSet')
	% Radio button is selected-take appropriate action       
    handles.DataSet.DataSet = normalization('range',handles.DataSet.DataSet);  
    % Save the state of radiobutton1
    handles.radiobutton2.Value = 1;
    handles.radiobutton2.PrevState = 1;
    
elseif (handles.radiobutton2.PrevState == 1 && get(hObject,'Value')==0)
    handles.radiobutton2.PrevState = 0;
    handles.radiobutton2.Value = 0;
    handles.DataSet.DataSet = handles.DataSet.DataSetCopy;    
else
    errordlg('First, you must load a dataset','Error 1');  
    set(hObject,'Value',0)
	% Radio button is not selected-take appropriate action
    handles.radiobutton2.Value = 0;
    handles.radiobutton2.PrevState = 0;
end
guidata(hObject, handles);

% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
if (handles.radiobutton1.Value == 1 || handles.radiobutton2.Value == 1)
        errordlg('Just one standardization method can be pressed at the time','Error 2');
        set(hObject,'Value',0)
        
elseif (get(hObject,'Value') == get(hObject,'Max') && isfield(handles,'DataSet'))
    % Radio button is selected-take appropriate action       
    handles.DataSet.DataSet = normalization('zscore',handles.DataSet.DataSet);  
    % Save the state of radiobutton1
    handles.radiobutton3.Value = 1;
    handles.radiobutton3.PrevState = 1;
    
elseif (handles.radiobutton3.PrevState == 1 && get(hObject,'Value')==0)
    handles.radiobutton3.PrevState = 0;
    handles.radiobutton3.Value = 0;
    handles.DataSet.DataSet = handles.DataSet.DataSetCopy;   
    
else
    errordlg('First, you must load a dataset','Error 1');  
    set(hObject,'Value',0)
	% Radio button is not selected-take appropriate action
    handles.radiobutton3.Value = 0;
    handles.radiobutton3.Value = 0;
end
guidata(hObject, handles);


function edit_p_Callback(hObject, eventdata, handles)
% hObject    handle to edit_p (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_p as text
%        str2double(get(hObject,'String')) returns contents of edit_p as a double
   


if isempty(get(hObject,'String'))
    attrib = 1:size(handles.DataSet.DataSetCopy,2);
elseif isvector(eval(get(hObject,'String')))
    attrib = eval(get(hObject,'String'));
else
    attrib = 1:size(handles.DataSet.DataSetCopy,2);
end

if isfield(handles,'DataSet')
    handles.DataSet.DataSet = handles.DataSet.DataSetCopy(:,attrib );
else
    errordlg('First, you must load a dataset','Error 1');
    return;
end
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edit_p_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_p (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Clustering Tendency -------------------------------------------------

% --- Executes on selection change in RandomnessTestMenu.
function RandomnessTestMenu_Callback(hObject, eventdata, handles)
% hObject    handle to RandomnessTestMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns RandomnessTestMenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from RandomnessTestMenu
contents = cellstr(get(hObject,'String'));
test = contents{get(hObject,'Value')};

if strcmp(test,'Hopkins test - upper tail (h)')
    handles.ClusteringTendency.Hopkins=1;
    handles.ClusteringTendency.CoxLewis=0;
    set(handles.text7,'String','Critical(h)');
%     
else % Cox-Lewis Test has been selected by the user
    handles.ClusteringTendency.Hopkins=0;
    handles.ClusteringTendency.CoxLewis=1;
    set(handles.text7,'String','Critical(R)');
end
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function RandomnessTestMenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RandomnessTestMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double
handles.ClusteringTendency.param(1)= round(str2double(get(hObject,'String')));
set(hObject,'String',num2str(handles.ClusteringTendency.param(1)));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'String','100');
handles.ClusteringTendency.param(1)= 100;
guidata(hObject,handles);

function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double

if str2double(get(hObject,'String')) <= 10 && str2double(get(hObject,'String')) > 0
    handles.ClusteringTendency.param(2)= str2double(get(hObject,'String'));
else
    errordlg('Sampling origins input must take values in the interval (0,10]','Error 5');
    handles.ClusteringTendency.param(2)= 10;
    set(hObject,'String','10');
end
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'String','10');
handles.ClusteringTendency.param(2)= 10;
guidata(hObject,handles);

function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double

if str2double(get(hObject,'String')) <= 1 && str2double(get(hObject,'String')) >= 0
    handles.ClusteringTendency.param(3)= str2double(get(hObject,'String'));
else
    errordlg('Random error input must taking values in [0,1] interval','Error 6');
    handles.ClusteringTendency.param(3)= 0.05;
    set(hObject,'String','0.05');
end
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'String','0.05');
handles.ClusteringTendency.param(3)= 0.05;
guidata(hObject,handles);

% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles) % rejection method
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4

if (handles.radiobutton5.Value == 1 || handles.radiobutton6.Value == 1)
        errordlg('Just one insertion method can be pressed at the time');
        set(hObject,'Value',0);
elseif (handles.radiobutton4.Value == 1 && get(hObject,'Value')==get(hObject,'Min'))
    handles.radiobutton4.Value = 0;    
else
    handles.radiobutton4.Value = 1;
    set(hObject,'Value',1);
end
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function radiobutton4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'Value',1); handles.radiobutton4.Value = 1;
guidata(hObject,handles);

% --- Executes on button press in radiobutton4.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5

if (handles.radiobutton4.Value == 1 || handles.radiobutton6.Value == 1)
        errordlg('Just one insertion method can be pressed at the time');
        set(hObject,'Value',0);
elseif (handles.radiobutton5.Value == 1 && get(hObject,'Value')==get(hObject,'Min'))
    handles.radiobutton5.Value = 0;   
else
    handles.radiobutton5.Value = 1;
    set(hObject,'Value',1);
end
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function radiobutton5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'Value',0); handles.radiobutton5.Value = 0;
guidata(hObject,handles);

% --- Executes on button press in radiobutton6.
function radiobutton6_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton6

if (handles.radiobutton4.Value == 1 || handles.radiobutton5.Value == 1)
        errordlg('Just one insertion method can be pressed at the time');
        set(hObject,'Value',0);
elseif (handles.radiobutton6.Value == 1 && get(hObject,'Value')==get(hObject,'Min'))
    handles.radiobutton6.Value = 0;   
else
    handles.radiobutton6.Value = 1;
    set(hObject,'Value',1);
end
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function radiobutton6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'Value',0); handles.radiobutton6.Value = 0;
guidata(hObject,handles);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if handles.ClusteringTendency.Hopkins == 1
    if isfield(handles.ClusteringTendency,'S_Ha')
        graphical_analysis_ct(handles.ClusteringTendency.S_Ha, ...
                              handles.ClusteringTendency.S_Ho, ...
                              'Hopkins',...
                              handles.ClusteringTendency.critical_q)
    else
        errordlg('You must first push the calculate button','Erro 2')
    end
else
    if isfield(handles.ClusteringTendency,'S_Ra')
        graphical_analysis_ct(handles.ClusteringTendency.S_Ra, ...
                              handles.ClusteringTendency.S_Ro, ...
                              'CoxLewis',...
                              handles.ClusteringTendency.critical_q)
    else
        errordlg('You must first push the calculate button','Erro 2')
    end
end

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)s

if isfield(handles,'DataSet')
    % Input parameters
    X          = handles.DataSet.DataSet; 
    num_trials = handles.ClusteringTendency.param(1);
    so         = handles.ClusteringTendency.param(2);
    alpha      = handles.ClusteringTendency.param(3);
    if isnan(num_trials) || isnan(so) || isnan(alpha)
        errordlg('The input parameters are not good defined', 'Error 7');        
        return
    end
    
    if handles.radiobutton1.Value~=1
       msgbox('It is recommended that you remove the mean of the dataset to improve the computing time. Please do it and then push down the Calculate button again','Attention !')
       return;
    end
    
    selector = [handles.radiobutton4.Value, handles.radiobutton5.Value, handles.radiobutton6.Value];
    if sum(selector)~=0
        if     selector(1)==1
                Xo  = SmithJain_Generador(X);
        elseif selector(2)==1
                Xo  = h0_tibshirani(X,'a',1);
        elseif selector(3)==1
                Xo  = h0_tibshirani(X,'b',1);
        end
    else
        errordlg('Some insertion method must be chosen');
        return;
    end
    
    if (handles.ClusteringTendency.Hopkins == 1)
        [S_Ha]=HopkinsTestFunction(num_trials,so,X);
        [S_Ho]=HopkinsTestFunction(num_trials,so,Xo);
        [result] = output_param(S_Ho,S_Ha,'Hopkins',alpha,num_trials);
        set(handles.text10,'String',result.cl)
        set(handles.text11,'String',result.critical_q)
        set(handles.text12,'String',result.Power)
        set(handles.text13,'String',result.pvalue)
        
        handles.ClusteringTendency.S_Ha=S_Ha;
        handles.ClusteringTendency.S_Ho=S_Ho;
        handles.ClusteringTendency.critical_q = result.critical_q;
        if(result.pvalue < alpha)
            msgbox('Your data set has clustering tendency','The Randomness Hypothesis has been rejected')
        else
            msgbox('Your data set does not have clustering tendency','The Randomness Hypothesis has been acepted')
        end
    else
        [S_Ra]=CLewisTestFunction(X ,so,num_trials);
        [S_Ro]=CLewisTestFunction(Xo,so,num_trials);
        [result] = output_param(S_Ro,S_Ra,'CoxLewis',alpha,num_trials);
        set(handles.text10,'String',result.cl)
        set(handles.text11,'String',result.critical_q)
        set(handles.text12,'String',result.Power)
        set(handles.text13,'String',result.pvalue) 
        
        handles.ClusteringTendency.S_Ra=S_Ra;
        handles.ClusteringTendency.S_Ro=S_Ro;
        handles.ClusteringTendency.critical_q = result.critical_q;
        if(result.pvalue < alpha)
            msgbox('Your data set has clustering tendency','The Randomness Hypothesis has been rejected')
        else
            msgbox('Your data set does not have clustering tendency','The Randomness Hypothesis has been acepted')
        end
    end
else
    errordlg('First, you must load a dataset','Error 1');      
end

guidata(hObject,handles)


% --- Clustering ----------------------------------------------------------

% --- Executes on selection change in popupmenu_c1.
function popupmenu_c1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_c1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_c1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_c1
contents = cellstr(get(hObject,'String'));
index =get(hObject,'Value');
% handles.clustering.algorithm = contents{1};
% algorithm=get(hObject,'String');
handles.clustering.algorithm = contents{index};
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function popupmenu_c1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_c1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.clustering.algorithm = 'k-means algorithm';
guidata(hObject,handles)

% --- Executes on selection change in popupmenu_c2.
function popupmenu_c2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_c2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_c2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_c2
contents               = cellstr(get(hObject,'String'));
index                  = get(hObject,'Value');
handles.clustering.ini = contents{index};
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function popupmenu_c2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_c2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.clustering.ini = 'Random seeds';
guidata(hObject,handles)


function edit_c1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_c1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_c1 as text
%        str2double(get(hObject,'String')) returns contents of edit_c1 as a double
handles.clustering.k = str2double(get(hObject,'String')); % tolerance
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit_c1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_c1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.clustering.k = str2double(get(hObject,'String')); % tolerance
guidata(hObject,handles);


function edit_c2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_c2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_c2 as text
%        str2double(get(hObject,'String')) returns contents of edit_c2 as a double
handles.clustering.tol = str2double(get(hObject,'String')); % tolerance
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit_c2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_c2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.clustering.tol = str2double(get(hObject,'String')); % tolerance
guidata(hObject,handles);


function edit_c3_Callback(hObject, eventdata, handles)
% hObject    handle to edit_c3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_c3 as text
%        str2double(get(hObject,'String')) returns contents of edit_c3 as a double
if str2double(get(hObject,'String')) >= 2 && str2double(get(hObject,'String')) <= 2.3
    handles.validity.q = str2double(get(hObject,'String')) ;
else
    handles.validity.q = 2;
    set(hObject,'String',handles.validity.q);
end
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit_c3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_c3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.clustering.q = str2double(get(hObject,'String')); % fuzzifier
guidata(hObject,handles);

% --- Executes on button press in pushbutton_c1.
function pushbutton_c1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_c1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isfield(handles,'DataSet')
    algorithm = handles.clustering.algorithm;
    if isnan(handles.clustering.k) || handles.clustering.k == 1
        errordlg('you must to define a valid number of clases','Error 3')
        return;
    end
    if  sum(strcmp(handles.clustering.algorithm,{'k-means algorithm','fuzzy k-means algorithm'}))~=0  && ...
        strcmp(handles.clustering.ini,'Fuzzy k-means stable seeds')
        errordlg('Fuzzy k-means stable seeds are not available for kmeans and fuzzy kmeans','Error 4')        
        return;
    elseif strcmp(handles.clustering.algorithm,'fuzzy maximum likelyhood estimation algorithm') && ...
           sum(strcmp(handles.clustering.ini,{'Refining starting seeds','Random seeds' }))~=0
        errordlg('fuzzy maximum likelyhood estimation algorithm must be initilized with fuzzy k-means stable seeds','Error 4')        
        return;
    end
    % Starting seeds
    switch handles.clustering.ini
        case 'Random seeds'               % by default
             [seeds]=RandomStartingSeeds(handles.DataSet.DataSet, ...
                                         handles.clustering.k);
             handles.clustering.seeds = seeds;
             
        case 'Refining starting seeds'    % based both bootstrap technique and kmeans clustering
             [seeds]=RefiningStartingSeeds(handles.DataSet.DataSet, ...
                                           handles.clustering.k);
             handles.clustering.seeds = seeds;
             
        case 'Fuzzy k-means stable seeds' % Recommended by fmle clustering

            [Uo_fmle]=fkm_stable_seeds(handles.DataSet.DataSet, ...
                                  handles.clustering.k,100,...
                                  handles.clustering.q,...
                                  handles.clustering.tol);
            handles.clustering.Uo = Uo_fmle;

    end
    
    switch algorithm
        case 'k-means algorithm'
            [result]=k__means(handles.DataSet.DataSet, ...
                              handles.clustering.seeds);
             handles.clustering.result = result;

        case 'fuzzy k-means algorithm'
            [result]=fuzzy_kmeans(handles.DataSet.DataSet, ...
                                  handles.clustering.seeds, ...
                                  handles.clustering.q,...
                                  handles.clustering.tol);
             handles.clustering.result = result;
        case 'fuzzy maximum likelyhood estimation algorithm'
            [result]=FMLE_clustering(handles.DataSet.DataSet, ...
                                  handles.clustering.Uo, ...
                                  handles.clustering.q,...
                                  handles.clustering.tol);
            handles.clustering.result = result;
    end
    
    if isfield(handles.DataSet,'TitleLabels')
        features_names = handles.DataSet.TitleLabels; % labels & title
    else
        features_names = {'x_{1}','x_{2}','x_{3}','Dataset'};
    end
    
    % Visualizacion
    market_symbol={'.b', '.g', '.r','.c','.m','.y','.k' ...
                   'ob', 'og', 'or','oc','om','oy','ok',...
                   'xb', 'xg', 'xr','xc','xm','xy','xk',...
                   '+b', '+g', '+r','+c','+m','+y','+k',...
                   '*b', '*g', '*r','*c','*m','*y','*k',...
                   'sb', 'sg', 'sr','sc','sm','sy','sk',...
                   'db', 'dg', 'dr','dc','dm','dy','dk',...
                   'vb', 'vg', 'vr','vc','vm','vy','vk',...
                   'pb', 'pg', 'pr','pc','pm','py','pk',...
                   'hb', 'hg', 'hr','hc','hm','hy','hk'};
    set(handles.axes_c1,'NextPlot','add')
    for j=1:handles.clustering.k
        plot(handles.axes_c1,result.X(result.labels==j,1), ...
             result.X(result.labels==j,2),...
             market_symbol{mod(j-1,70)+1})
    end
    plot(handles.axes_c1,result.C(:,1),result.C(:,2),'+k')
    xlabel(handles.axes_c1,features_names{1}); ylabel(handles.axes_c1,features_names{2})
    set(handles.axes_c1,'XGrid','On'); set(handles.axes_c1,'YGrid','On');
    

    
else
    errordlg('First, you must load a dataset','Error 1')
end
guidata(hObject,handles);

% --- Executes on button press in pushbutton_c2.
function pushbutton_c2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_c2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%stores savepath for the phase plot
[filename, pathname,fileindex] = uiputfile( '*.csv', 'Save data labels as','default');

%if user cancels save command, nothing happens
if isequal(filename,0) || isequal(pathname,0)
    return
end
old_path = cd;
cd(pathname)
% if(fileindex==1)
    csvwrite(filename, handles.clustering.result.labels);
    cd(old_path)
% else % .mat
% %     fid = fopen(filename);
% %         fprintf(fid,'%f', handles.clustering.result.labels);    
% %     fclose(fid); 
%     saveas(handles.clustering.result.labels, fullfile(pathname, filename))
%     cd(old_path)
% end


msgbox('The clustering data labels has been saved')

% --- Executes on button press in pushbutton_c3.
function pushbutton_c3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_c3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%stores savepath for the phase plot
[filename, pathname] = uiputfile({'*.jpg';'*.pdf';'*.png';'*.eps'}, ...
                                  'Save picture as','default');

%if user cancels save command, nothing happens
if isequal(filename,0) || isequal(pathname,0)
    return
end
%create a new figure
newFig = figure;
%get the units and position of the axes object
axes_units = get(handles.axes_c1,'Units');
axes_pos   = get(handles.axes_c1,'Position');

%copies axesObject onto new figure
axesObject2 = copyobj(handles.axes_c1,newFig);


%realign the axes object on the new figure
set(axesObject2,'Units',axes_units);
set(axesObject2,'Position',[0.1 0.06832298136645962 axes_pos(3) axes_pos(4)]);
set(axesObject2,'OuterPosition',get(axesObject2,'Position'));
% get(newFig,'OuterPosition')
%if a legendObject was passed to this function . . .
% if (exist('legendObject'))
% 
%     %get the units and position of the legend object
%     legend_units = get(legendObject,'Units');
%     legend_pos = get(legendObject,'Position');
% 
%     %copies the legend onto the the new figure
%     legendObject2 = copyobj(legendObject,newFig);
% 
%     %realign the legend object on the new figure
%     set(legendObject2,'Units',legend_units);
%     set(legendObject2,'Position',[15-axes_pos(1)+legend_pos(1) 5-axes_pos(2)+legend_pos(2) legend_pos(3) legend_pos(4)] );
% 
% end

%adjusts the new figure accordingly
set(newFig,'Units',axes_units);
set(newFig,'Position',[0.13 0.11 0.775 0.815]);
% set(newFig,'Position',[0.3883299798792763 0.06832298136645962 axes_pos(3)+30 axes_pos(4)+10]);
set(newFig,'OuterPosition',get(axesObject2,'Position'))
%saves the plot
saveas(newFig,fullfile(pathname, filename)) 

%closes the figure
close(newFig)

% --- Executes on button press in pushbutton_c4.
function pushbutton_c4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_c4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 cla(handles.axes_c1,'reset')

 
% --- Cluster Validity ----------------------------------------------------

% --- Executes on selection change in popupmenu_cv1.
function popupmenu_cv1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_cv1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_cv1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_cv1
contents = cellstr(get(hObject,'String'));
index = get(hObject,'Value'); % selected criteria
handles.validity.type = contents{index};
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function popupmenu_cv1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_cv1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.validity.type = 'Relative criteria';
guidata(hObject,handles);

% --- Executes on selection change in popupmenu_cv2.
function popupmenu_cv2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_cv2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_cv2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_cv2
contents = cellstr(get(hObject,'String'));
index = get(hObject,'Value'); % selected criteria
handles.validity.algorithm = contents{index};
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function popupmenu_cv2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_cv2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.validity.algorithm = 'k__means';
guidata(hObject,handles);

% --- Executes on selection change in popupmenu_cv3.
function popupmenu_cv3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_cv3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_cv3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_cv3
contents = cellstr(get(hObject,'String'));
index = get(hObject,'Value'); % selected criteria


switch contents{index}
    case 'Random seeds'
        handles.validity.ini = 'RandomStartingSeeds';
    case 'Refining starting seeds'        
        handles.validity.ini = 'RefiningStartingSeeds';
    case 'Fuzzy k-means stable seeds'        
        handles.validity.ini = 'fkm_stable_seeds';
end
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function popupmenu_cv3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_cv3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.validity.ini = 'RandomStartingSeeds';
guidata(hObject,handles);


function edit_cv1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_cv1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_cv1 as text
%        str2double(get(hObject,'String')) returns contents of edit_cv1 as a double
handles.validity.LowerLimit = round(str2double(get(hObject,'String')));
if isnan(handles.validity.LowerLimit)
    set(hObject,'String',2);
else
    set(hObject,'String',handles.validity.LowerLimit);
end
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit_cv1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_cv1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.validity.LowerLimit = str2double(get(hObject,'String')) ;
guidata(hObject,handles);


function edit_cv4_Callback(hObject, eventdata, handles)
% hObject    handle to edit_cv4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_cv4 as text
%        str2double(get(hObject,'String')) returns contents of edit_cv4 as a double
handles.validity.tol = str2double(get(hObject,'String')) ;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit_cv4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_cv4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.validity.tol = 1e-5;
guidata(hObject,handles);



function edit_cv5_Callback(hObject, eventdata, handles)
% hObject    handle to edit_cv5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_cv5 as text
%        str2double(get(hObject,'String')) returns contents of edit_cv5 as a double

if str2double(get(hObject,'String')) >= 2 && str2double(get(hObject,'String')) <= 2.3
    handles.validity.q = str2double(get(hObject,'String')) ;
else
    handles.validity.q = 2;
    set(hObject,'String',handles.validity.q);
end
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit_cv5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_cv5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.validity.q = 2;
guidata(hObject,handles);


function edit_cv2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_cv2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_cv2 as text
%        str2double(get(hObject,'String')) returns contents of edit_cv2 as a double
handles.validity.UpperLimit = round(str2double(get(hObject,'String'))) ;
set(hObject,'String',handles.validity.UpperLimit);
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit_cv2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_cv2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.validity.UpperLimit = str2double(get(hObject,'String')) ;
guidata(hObject,handles);



function edit_cv6_Callback(hObject, eventdata, handles)
% hObject    handle to edit_cv6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_cv6 as text
%        str2double(get(hObject,'String')) returns contents of edit_cv6 as a double
handles.validity.nruns = round(str2double(get(hObject,'String')));
set(hObject,'String',handles.validity.nruns)
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit_cv6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_cv6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.validity.nruns = 1;
guidata(hObject,handles);


% --- Executes on button press in pushbutton_cv1.
function pushbutton_cv1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_cv1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

cla(handles.axes_cv1,'reset')
if ~isfield(handles,'DataSet')
    errordlg('First, you must load a dataset','Error 1');
    return;
end

% input parameters

X = handles.DataSet.DataSet;
k_min = handles.validity.LowerLimit; k_max = handles.validity.UpperLimit;
q=handles.validity.q;
tol=handles.validity.tol;
N=size(X,1);

if(isnan(k_min)  || isnan(k_max))
    k_min=2;
    k_max=2;
end

switch handles.validity.type
    case 'Relative criteria'
        if (~strcmp(handles.validity.algorithm,'fuzzy mle') && ...
            strcmp(handles.validity.ini,'fkm_stable_seeds'))
            errordlg('This option is not available for k-means and fuzzy k-means');
            handles.popupmenu_cv3='Random seeds';
            guidata(hObject,handles);
            return; 
        elseif strcmp(handles.validity.algorithm,'fuzzy mle') && ...
            ~strcmp(handles.validity.ini,'fkm_stable_seeds')
            errordlg('This option is not available for fuzzy mle');
            return; 
        elseif strcmp(handles.validity.algorithm,'fuzzy mle') && ...
            strcmp(handles.validity.ini,'fkm_stable_seeds')
            
            FHV=zeros(handles.validity.nruns,k_max-k_min+1); PD=zeros(handles.validity.nruns,k_max-k_min+1);
            nruns=100; % number of initial seeds to be assessed
            for iter=1:handles.validity.nruns
                for k=k_min:k_max
                    [Uo_fmle]=fkm_stable_seeds(X, ...
                                           k, nruns, q, tol);
                    [fmleresult]=FMLE_clustering(X, Uo_fmle, q, tol);                
                    U=fmleresult.U; C=fmleresult.C; F=fmleresult.F;    
                    % Fuzzy Hypervolume and Partition Index Index proposed by Gath and Geva
                    % F(:,:,j) matriz de covarianza que representa al j-esimo cluster
                    detF=zeros(k,1);
                    for j=1:k % j-esimo cluster
                        detF(j)=det(F(:,:,j));    
                    end
                    FHV(iter,k-1)=sum(detF.^0.5);        
                    Xj=zeros(N,k);
                    for j=1:k
                            Xj(:,j)= sum((X-ones(N,1)*C(j,:))*pinv(F(:,:,j)).* (X-ones(N,1)*C(j,:)),2)< 1;
                    end
                    S=sum(sum(U.*Xj));
                    PD(iter,k-1)= S/FHV(iter,k-1); 
                end
            end
                        % Visualización curvas de validación
                m=k_min:k_max;        
                set(handles.axes_cv1,'NextPlot','replace')
                colors=['r','b','g','k','c'];    
                handles.validity.PD = PD;
                handles.validity.FHV = FHV;
                if handles.validity.nruns == 1                    
                    promFHV=FHV; eFHV=zeros(size(FHV));
                else
                    promFHV=mean(FHV); eFHV=std(FHV);
                end
                errorbar(handles.axes_cv1, m , promFHV,eFHV,'-ob','LineWidth',1.2);
                xlabel(handles.axes_cv1,'Number of classes k'); ylabel(handles.axes_cv1,'F_{HV}')
                set(handles.axes_cv1,'XGrid','On'); set(handles.axes_cv1,'YGrid','On');
                set(handles.pushbutton_cv4,'Visible','on')
                set(handles.pushbutton_cv5,'Visible','on')
                guidata(hObject,handles);
            
        else % 

            % sel ->1, 2, 3, 4
            % 0-> V31
            % 1-> V41
            % 2-> V51
            % 3-> V33
            % 4-> V53 
            cla(handles.axes_cv1,'reset')
            VGD=zeros(handles.validity.nruns,abs(k_max-k_min)+1,5); % generalized dumm
            for iter=1:handles.validity.nruns
                for k = k_min:k_max
                    %--------------------------------------
                    [c0]=feval(handles.validity.ini,X,k);
                    %--------------------------------------
                    [result]=feval(handles.validity.algorithm,X,c0,q,tol);
                    for sel=0:4
                        [VGD(iter,k-1,sel+1)]=G_DunnIndex(X,k,result.labels,sel);  
                        fprintf('Iteración %i \n',k-1);
                    end
                end
                fprintf('iteracion %i \n', iter)    
            end
            % Visualización curvas de validación
            m=k_min:k_max;        
            set(handles.axes_cv1,'NextPlot','add')
            colors=['r','b','g','k','c'];    

            if handles.validity.nruns == 1
                for k=1:5
                plot(handles.axes_cv1, m, VGD(:,:,k) ,strcat('-o',colors(k)),'LineWidth',1.2);
                legend(handles.axes_cv1,'V_{31}','V_{41}','V_{51}','V_{33}','V_{53}')
    %                 datacursormode(handles.axes_cv1,'on');
                end
                xlabel(handles.axes_cv1,'Number of classes k'); ylabel(handles.axes_cv1,'V\delta_{i} \Delta_{j}')
    %                 title(handles.axes_cv1,'Generalized Dunns Indexes')
                set(handles.axes_cv1,'XGrid','On'); set(handles.axes_cv1,'YGrid','On');
            else
                promGD=zeros(5,abs(k_max-k_min)+1); eGD=zeros(5,abs(k_max-k_min)+1);
                for i=1:5
                    promGD(i,:) = mean(VGD(:,:,i)); 
                    eGD(i,:)=std(VGD(:,:,i));
                end
                for k=1:5
                errorbar(handles.axes_cv1, m , promGD(k,:),eGD(k,:),strcat('-o',colors(k)),'LineWidth',1.2);
                legend(handles.axes_cv1,'V_{31}','V_{41}','V_{51}','V_{33}','V_{53}')
                end
                xlabel(handles.axes_cv1,'Number of classes k'); ylabel(handles.axes_cv1,'V\delta_{i} \Delta_{j}')
    %                 title(handles.axes_cv1,'Generalized Dunns Indexes')
                set(handles.axes_cv1,'XGrid','On'); set(handles.axes_cv1,'YGrid','On');
            end
        end

    case 'Internal criteria'
end


% --- Executes on button press in pushbutton_cv2.
function pushbutton_cv2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_cv2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton_cv3.
function pushbutton_cv3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_cv3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes_cv1,'reset')
set(handles.pushbutton_cv4,'Visible','off')
set(handles.pushbutton_cv5,'Visible','off')

% --- Executes on button press in pushbutton_cv4.
function pushbutton_cv4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_cv4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
k_min=handles.validity.LowerLimit;
k_max=handles.validity.UpperLimit;

m=k_min:k_max;        
if handles.validity.nruns == 1                    
    promFHV=handles.validity.FHV ; eFHV=zeros(size(handles.validity.FHV ));
else
    promFHV=mean(handles.validity.FHV ); eFHV=std(handles.validity.FHV );
end
errorbar(handles.axes_cv1, m , promFHV,eFHV,'-ob','LineWidth',1.2);
xlabel(handles.axes_cv1,'Number of classes k'); ylabel(handles.axes_cv1,'F_{HV}')
set(handles.axes_cv1,'XGrid','On'); set(handles.axes_cv1,'YGrid','On');
guidata(hObject,handles);


% --- Executes on button press in pushbutton_cv5.
function pushbutton_cv5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_cv5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
k_min=handles.validity.LowerLimit;
k_max=handles.validity.UpperLimit;

m=k_min:k_max;        
if handles.validity.nruns == 1                    
    promPD=handles.validity.PD ; ePD=zeros(size(handles.validity.PD ));
else
    promPD=mean(handles.validity.PD ); ePD=std(handles.validity.PD );
end
errorbar(handles.axes_cv1, m , promPD,ePD,'-or','LineWidth',1.2);
xlabel(handles.axes_cv1,'Number of classes k'); ylabel(handles.axes_cv1,'P_{D}')
set(handles.axes_cv1,'XGrid','On'); set(handles.axes_cv1,'YGrid','On');
guidata(hObject,handles);


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
