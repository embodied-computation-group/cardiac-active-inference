function [est_hr] = calc_hr(MDP)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
est_hr = sum(MDP.s(1,:)==3);%/length(MDP.s(1,:));
end

