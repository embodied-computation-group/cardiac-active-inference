function H = calc_hi(MDP)
%Calculate Shannon Entropy of a MDP input.
%
pE = MDP.xn{1}; % interoceptive confidences
pE = pE(end, :, MDP.T, MDP.T); % final confidence at last trial
H = - dot(pE,log(pE));

end

