
function MDP = sim_save(ivparam, evparam, datpath)


                % setup parameters
                input.wI = 0.9;   % Interoceptive (inverse) volatility
                input.wE = 0.9;   % Exteroceptive (inverse) volatility
                input.xi = 3; % Preferences
                input.zI = ivparam; % Interoceptive sensory precision
                input.zE = evparam;% Exteroceptive sensory precision
                input.T = 40; % 40 trials
                % run simulation
                tic
                fprintf('||Starting Simulation||\n')
                MDP = run_mdp_simulation(input);
                fprintf('||Simulation Finished||\n')
                toc
                % calculate Q, H, HR, and RT
                MDP.Hi = calc_hi(MDP);
                MDP.He = calc_he(MDP);
                MDP.Q = calc_q(MDP);
                MDP.hr = calc_hr(MDP);
                MDP.medianRT = [median(MDP.rt)];
       
                filestr = sprintf(['MDP_files/MDP_90vol_%dip_%dep.mat'],ivparam*100, evparam*100);
                filename = [datpath filestr];
                save(filename, 'MDP')
                %param_mat(intero_precision, extero_precision) = Q;
   
end