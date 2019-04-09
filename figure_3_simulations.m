%% script to run the simulations in figure 3
% runs MDP simulation with the first 15 trials as fixed inputs. 

%% get canonical variables for each cardiac phase
close all
clear all

% path to code repository - change this
addpath('C:\Users\Micah Allen\Google Drive\FEP_Heartbeat\code\cbrewer')

% path to SPM 12 - change this
addpath('C:\Users\Micah Allen\Dropbox\toolboxes\MatlabToolboxes\SPM12_latest')

% intialize and close spm - need MDP functions on path
spm fmri -nogui
spm quit

%% run model 1 - healthy control 
% healthy interoception
clear MDP_30n_100t_healthy
clear input
clear mdp1

input.wI = 0.9;   % Interoceptive (inverse) volatility
input.wE = 0.9;   % Exteroceptive (inverse) volatility
input.xi = 3;   % Prior preferences
input.zI = 0.9; % Interoceptive sensory precision
input.zE = 0.9; % Exteroceptive sensory precision
input.E = 1;    % parasympathetic policy  1 = default, 2 = para, 3 = symp
input.r = 0;    % randomization flag, = 0 new seed, 1 = same seed
input.ss =1;    % flag for fixed or generated states, if 1 must specifiy states below

% the next two lines specify the exteroceptive and interoceptive states for
% the first 15 trials

input.s = [repmat([1 1 1 1 1], 1, 2) repmat([1 1 1 1 2], 1, 1)];
input.s = [repmat([1 2 3], 1, length(input.s)./3); input.s];

input.T = 100; % specify number of total trials to simulate

%% simulate 30 healthy subjects in a parfor loop
nsubjects = 30;

parfor n = 1:nsubjects



tic
fprintf('\nSubject %d/%d Started\n', n, nsubjects)
mdp1(n)= run_mdp_simulation(input);
t=toc;
fprintf('\nSubject %d/%d Simulated in %02f seconds \n'...
    , n,nsubjects, t)



end

save MDP_30n_100t_healthy mdp1

%% optional plotting
spm_figure('GetWin','Figure 1');
spm_MDP_VB_trial(mdp1(end))

%% simulation #2 - lesioned interoceptive precision

clear MDP_30n_100t_lesion
clear input
clear mdp2

input.wI = 0.9;   
input.wE = 0.9;  
input.xi = 3; 
input.zI = 0.5; % lesioned intero precision
input.zE = 0.9;
input.E = 1; 
input.r = 0;
input.ss =1;
input.s = [repmat([1 1 1 1 1], 1, 2) repmat([1 1 1 1 2], 1, 1)];
input.s = [repmat([1 2 3], 1, length(input.s)./3); input.s];
input.T = 100;

    
nsubjects = 30;

parfor n = 1:nsubjects



tic
fprintf('\nSubject %d/%d Started\n', n, nsubjects)
mdp2(n)= run_mdp_simulation(input);
t=toc;
fprintf('\nSubject %d/%d Simulated in %02f seconds \n'...
    , n,nsubjects, t)



end



save MDP_30n_100t_lesion mdp2

%% optional plotting
spm_figure('GetWin','Figure 1');
spm_MDP_VB_trial(mdp2(end))




