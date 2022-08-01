%% global params

% input.T = 1000; %% warning, will take  a long time with this many trials!
% set to = 100 for testing. t = 1000 to reproduce figures in the paper.

input.T = 100; %% warning, will take  a long time with this many trials! set to = 100 for testing. 


%% run model 1 - healthy

input.wI = 0.9;   % Interoceptive (inverse) volatility
input.wE = 0.9;   % Exteroceptive (inverse) volatility
input.xi = 3; % Preferences
input.zI = 0.8; % Interoceptive sensory precision
input.zE = 0.8;% Exteroceptive sensory precision
input.E = 1; % 1 = default, 2 = parasymp, 3 = symp
%input.T = 40;

MDP_hrv_1 = run_mdp_simulation(input);

%% run model 2 - hyper visceral precision


input.wI = 0.9;   % Interoceptive (inverse) volatility
input.wE = 0.9;   % Exteroceptive (inverse) volatility
input.xi = 3; % Preferences
input.zI = 1; % Interoceptive sensory precision
input.zE = 0.8;% Exteroceptive sensory precision
input.E = 1; % 1 = default, 2 = parasymp, 3 = symp
%input.T = 40;

MDP_hrv_2 = run_mdp_simulation(input);

%% run model 3 - hyperprior arousal policy 


input.wI = 0.9;   % Interoceptive (inverse) volatility
input.wE = 0.9;   % Exteroceptive (inverse) volatility
input.xi = 3; % Preferences
input.zI = 0.8; % Interoceptive sensory precision
input.zE = 0.8;% Exteroceptive sensory precision
input.E = 3; % 1 = default, 2 = parasymp, 3 = symp
%input.T = 40;

MDP_hrv_3 = run_mdp_simulation(input);


%%

save([datpath 'MDP_files/MDP_hrv_models.mat'], 'MDP_hrv_1', 'MDP_hrv_2', 'MDP_hrv_3')

