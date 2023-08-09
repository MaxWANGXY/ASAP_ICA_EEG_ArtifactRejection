% This code is used for running ICA
clc
clear
close all
tic
%% Part 1 Selecting '.set' dataset
restoredefaultpath;
hs = (msgbox(['Please Select ''.set'' dataset by this format:  "Channel x Sample" !  '],...
    'Selecting'));
set(hs, 'position', [100 440 1000 100]); 
ht = findobj(hs, 'Type', 'text');
set(ht, 'FontSize', 30, 'Unit', 'normal');
uiwait(hs)
[filename,pathname]= uigetfile({'*.set','All Files'},...
    'Select Data File 1');
icassoPath = genpath('Environment') ;
addpath(icassoPath)
EEG = pop_loadset([pathname,filename]);
%% Part2 Input the ICA Running parameters
prompt = {'Number Of Selected Independent Components:','Number of Running Times:',...
    'ICA Algorithms (1.FastICA & 2.InfomaxICA):'};
dlg_title = 'Input Parameters';
width = 100;
height = 2; % lines in the edit field.
num_lines = [height, width];
def = {'15','15','1'};
answer = inputdlg(prompt,dlg_title,num_lines,def);
Comp = str2num(answer{1});
Runs = str2num(answer{2});
Method_Flag = str2num(answer{3});
MethodString = {'FastICA','InfomaxICA'};
Method = MethodString{Method_Flag} ;
[Patameter comp Recommended_Artifact_Comp] = Run_ICA_ICASSO(EEG,Runs,Comp,pathname,Method) ; 
%%
toc