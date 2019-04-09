function H = calc_he(MDP)
%Calculate Shannon Entropy of a MDP input.
%
pE = MDP.xn{2}; % exteroceptive confidences
pE = pE(end, :, MDP.T, MDP.T); % final confidence at last trial
H = - dot(pE,log(pE));

end

