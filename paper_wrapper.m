%% high level wrapper to reproduce the simulations and figures in
% In the body's eye: the computational anatomy of interoceptive Inference. PLOS Computational Biology, 2022.
% Allen, Levy, Parr, and Friston, 2022. 
%
%
%% SETUP
% To run the routines you will first need to install SPM12 and the cbrewer2
% function, and have both on your path. 
% SPM 12 can be downloaded here:
% https://www.fil.ion.ucl.ac.uk/spm/software/download/
% 
% cbrewer 2 can be downloaded from the mathworks repository, here:
% https://se.mathworks.com/matlabcentral/fileexchange/58350-cbrewer2
%
% Should run on any SPM 12 compatible matlab version, but requires the
% parallel computing toolbox to be installed to run! 

clear all
close all

% path to cbrewer2 - you will need to change this! 
addpath('C:\Users\Micah\Documents\MATLAB\cbrewer2')

% path to SPM 12 - you will need to change this! 
addpath('C:\Users\Micah\Documents\MATLAB\spm12\spm12')

% path to save the very large simulation files - set as desired. These are
% set outside the github project because they are too large for hosting
% there. 

datpath = 'C:\Users\Micah\Documents\'; % set this to wherever you want the simulated data to be stored. Warning, some files may be very large. 

addpath(datpath)

addpath(genpath(pwd)) % this assumes you are running this from inside the local parent directory of the cloned github repo - will not work otherwise! 

%% intialize and close spm - need MDP functions on path
spm fmri -nogui
spm quit

%% Figure 3 - run this chunk to reproduce figure 3

% run simulations - requires parallel computing toolbox
figure_3_simulations

% produce figures
figure_3_plots

%% Figure 4 - can take a while depending on compute power
figure_4_simulations
fig4_get_params; % gets all the parameters
figure_4_plot_params; % 3D heatmap plots
figure_4_cardiac_cycle_plots  % cardiac cycle plots

%% figure 5 - note this will take an hour or more to run

if exist(fullfile(datpath, 'MDP_files/MDP_hrv_models.mat'), 'file') == 2 
    
    load(fullfile(datpath, 'MDP_files/MDP_hrv_models.mat'))

else
    
    hrv_simulation

end

figure_5_hrv_plots
