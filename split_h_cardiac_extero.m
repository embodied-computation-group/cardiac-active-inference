function [h1 h2 h3] = split_h_cardiac_extero(MDP)

h_extero = calc_h_extero(MDP);
heart_states = MDP.s(1,:);
s1 = heart_states ==1;
s2 = heart_states ==2;
s3 = heart_states ==3;

h1 = sum(h_extero(s1));
h2 = sum(h_extero(s2));
h3 = sum(h_extero(s3));

end