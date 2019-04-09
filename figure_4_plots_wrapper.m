%% wrapper script to generate the plots in figure 4

%% first, run the simulations for panels A & C
% note this will take a *long* time

figure_4_simulations_wrapper;

%% Subpanel A & C

fig4_get_params; % gets all the parameters
figure_4_plot_params; % plots them and saves plots

%% subpanel B & D

figure_4_cardiac_cycle_plots; % runs simulations and makes plots

