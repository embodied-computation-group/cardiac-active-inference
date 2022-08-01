%% this script loads the appropriate parameters
%% from the figure 4A and C simulations. 
%% must have already ran the simulation script to 
%% generate the MDP files. 


%% get parameters for intero and extero

evparam =[0.5:.1:1];
ivparam =[0.5:.1:1];

for iv = 1:numel(ivparam)
    

    for ev = 1:numel(evparam)
 
                
                filestr = sprintf(['/MDP_files/MDP_90vol_%dip_%dep.mat'],ivparam(iv)*100, evparam(ev)*100);
                filename = [datpath filestr];
                load(filename, 'MDP')
               
                param_mat_extero(iv, ev) = sum(calc_h_extero(MDP)); % exteroceptive confidence/entropy
                param_mat_intero(iv, ev) = sum(calc_h_intero(MDP)); % exteroceptive confidence/entropy
                    
              
             
    end
    
    
end





