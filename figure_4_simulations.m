%%  script to run many simulations in parallel,
% for figure 4A and 4C. 


if ~isdir(fullfile(datpath, '/MDP_files'))
    mkdir(fullfile(datpath, '/MDP_files'))
    addpath(fullfile(datpath, '/MDP_files'))
end

%% this will run *many* simulations in parallel and
% save them. Will take at least a day to run! 
eparam =[0.5:0.1:1];
iparam =[0.5:0.1:1];

for ev = 1:numel(eparam)
    
    
    parfor iv = 1:numel(iparam)
        % run sim
        MDP = sim_save(iparam(iv), eparam(ev),datpath);
        
        
    end
    
end