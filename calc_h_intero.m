function H = calc_h_intero(MDP)
%Calculate Shannon Entropy overall current exteroceptive states for all trials.
%
probs = MDP.xn{1}; %  probabilities, 1 = intero, 2 = extero


%   xn{m}(i,s,tau,t) where m is modality, i is iterations (so choose max number for this),
%s is state, tau is time about which the belief is, t is time at which belief was held.

for n = 1:MDP.T

    prob_trial = probs(end, :, n, n); % confidence at each trial, for that trial
    H(n) = - dot(prob_trial,log(prob_trial));
    
end

end