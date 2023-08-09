clc
clear
close all
tic
%% Part 1 Selecting '.set' dataset
hs = (msgbox(['Please Select ''.set'' dataset by this format:  "Channel x Sample" !  '],...
    'Selecting'));
set(hs, 'position', [100 440 1000 100]);
ht = findobj(hs, 'Type', 'text');
set(ht, 'FontSize', 30, 'Unit', 'normal');
uiwait(hs)
[filename,pathname]= uigetfile({'*.set','All Files'},...
    'Select Data File 1');
EEG = pop_loadset([pathname,filename]);
load([pathname filesep 'ICA_Parameters'])
%% Part2 Remove ICs of Artifact
prompt = {'ICs Index of Artifact '};
dlg_title = 'Please Check the ICs Index of artifact';
width = 100;
height = 2; % lines in the edit field.
num_lines = [height, width];
def = {num2str(Recommended_Artifact_Comp)};
answer_ICs = inputdlg(prompt,dlg_title,num_lines,def);
Index_Artifact_Comp = str2num(cell2mat(answer_ICs)) ;
Remove_IC(EEG,Index_Artifact_Comp,pathname)
%%
toc