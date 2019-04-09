function [Q] = calc_q(MDP)
%Calculate Q 

%%
prob = MDP.X{2}; %% is a vector of the probabilities at each time step for spider (row 1) or flower (row 2)
truestate = MDP.s(2,:); %% is the true state

%%
Q = 1;
for t = 1:length(MDP.s(2,:))
                Q = Q*MDP.X{2}(MDP.s(2,t),t);
end

end

