%% wrapper script to run many simulations in parallel,
% for figure 4A and 4C. 

close all
clear all

% path to code repository - must be run from inside code repo dir
addpath(genpath(pwd))
% path to SPM 12 - change this
addpath('C:\Users\Micah Allen\Dropbox\toolboxes\MatlabToolboxes\SPM12_latest')

% intialize and close spm - need MDP functions on path
spm fmri -nogui
spm quit

% parameters to loop over - here the full range from 
% lesioned precision to hyper-precision in steps of 10%

eparam =[0.5:0.1:1];
iparam =[0.5:0.1:1];

if ~isdir('MDP_files')
    mkdir('MDP_files')
end

%% this will run *many* simulations in parallel and
% save them. Will take at least a day to run! 

for ev = 1:numel(eparam)
    
    
    parfor iv = 1:numel(iparam)
        % run sim
        MDP = sim_save(iparam(iv), eparam(ev));
        
        
    end
    
end