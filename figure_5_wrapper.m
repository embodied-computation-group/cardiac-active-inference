%% high level wrapper to create the simulations and plots
% in figure 5 (HRV simulation)

%% initialize
close all
clear all

% path to code repository - must be run from inside code repo dir
addpath(genpath(pwd))
% path to SPM 12 - change this
addpath('C:\Users\Micah Allen\Dropbox\toolboxes\MatlabToolboxes\SPM12_latest')

% intialize and close spm - need MDP functions on path
spm fmri -nogui
spm quit


figdir = [pwd '\figures\'];

if ~exist(figdir)
    mkdir(figdir)
end


%% run the simulation

hrv_simulation; % runs the full HRV simulation - will take hours

%% load data, analyze HRV, and produce plots

figure_5_hrv_plots;
