function MDP = run_mdp_simulation(varargin)
%% usage: run_mdp_simulation(simulation_params)
% runs the MDP visceral inference simulation with any combination 
% of optional parameters. Simulation parameters are a structure with the
% following optional fields:
% --------------------- OPTIONAL ARGUMENTS ----------------------
% wI = Interoceptive (inverse) volatility
% wE =  Exteroceptive (inverse) volatility
% xi =  Preferences
% zI =  Interoceptive sensory precision
% zE = Exteroceptive sensory precision
%  T =timesteps to run
% ---------------------------- OUTPUT ----------------------------
% MDP - structure with all simulated data

%% check all the inputs and if they do not exist then revert to default settings
% input parsing settings
p = inputParser;
p.CaseSensitive = true;
p.Parameters;
p.Results;
p.KeepUnmatched = true;

% set the desired and optional input arguments
addOptional(p, 'wI', .1, @isnumeric)
addOptional(p, 'wE', .1, @isnumeric)
addOptional(p, 'zI', 1, @isnumeric)
addOptional(p, 'zE', 1, @isnumeric)
addOptional(p, 'xi', 3, @isnumeric)
addOptional(p, 'T', 20, @isnumeric)
addOptional(p, 'E', 1, @isnumeric); % parasympathetic policy  1 = default, 2 = para, 3 = symp
addOptional(p, 'so', 0, @isnumeric); % binary flag to control outcomes
addOptional(p, 'o', [], @isnumeric); % if outcomes are controlled, feed in a vector here
addOptional(p, 'r', 1, @isnumeric); % randomization 1 = default (reset RNG), 2 = no rng reset
addOptional(p, 'ss', 0, @isnumeric); % flag for states
addOptional(p, 's', [], @isnumeric);

% parse the input
parse(p,varargin{:});
% then set/get all the inputs out of this structure
params.wI = p.Results.wI; params.wE = p.Results.wE; 
params.xi = p.Results.xi;
params.zI = p.Results.zI; params.zE = p.Results.zE;
params.T = p.Results.T;
params.E = p.Results.E;
params.so = p.Results.so;
params.o = p.Results.o;
params.r = p.Results.r;
params.ss = p.Results.ss;
params.s = p.Results.s;



MDP = MDP_interoception_run(params);

end

