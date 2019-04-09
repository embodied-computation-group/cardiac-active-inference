function [H, prob_spider] = calc_h_predict_spider(MDP)
%Calculate Shannon Entropy of a MDP input over entire time.
%
probs = MDP.xn{2}; %  probabilities, 2 = extero, 1 = intero


%   xn{m}(i,s,tau,t) where m is modality, i is iterations (so choose max number for this),
%s is state, tau is time about which the belief is, t is time at which belief was held.

for n = 1:MDP.T-1

    prob_trial = probs(end, 2, n+1, n); % confidence at each trial, for that trial
    H(n) = - dot(prob_trial,log(prob_trial));
    prob_spider(n) = prob_trial;
    
end

end