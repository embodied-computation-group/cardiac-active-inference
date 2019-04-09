function [h1 h2 h3] = split_h_cardiac_intero(MDP)

h = calc_h_intero(MDP);
heart_states = MDP.s(1,:);
s1 = heart_states ==1;
s2 = heart_states ==2;
s3 = heart_states ==3;

h1 = sum(h(s1));
h2 = sum(h(s2));
h3 = sum(h(s3));

end