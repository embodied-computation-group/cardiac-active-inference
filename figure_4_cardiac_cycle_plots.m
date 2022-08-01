%% wrapper script to run simulations and
%% get canonical variables for each cardiac phase
%% reproduces Figure 4B and 4D


%% run model 1 - healthy extero 


input.wI = .9;   % Interoceptive (inverse) volatility
input.wE = .9;   % Exteroceptive (inverse) volatility
input.xi = 3; % Preferences
input.zI = 0.9; % Interoceptive sensory precision
input.zE = 0.9;% Exteroceptive sensory precision
input.E = 1;% 1 = default, 2 = 
input.T = 40;

MDP1 = run_mdp_simulation(input);


%% model 2 - lesioned intero
tic
input.wI = .9;   % Interoceptive (inverse) volatility
input.wE = .9;   % Exteroceptive (inverse) volatility
input.xi = 3; % Preferences
input.zI = 0.5; % Interoceptive sensory precision
input.zE = 0.9;% Exteroceptive sensory precision
input.E = 1;
input.T = 40;

MDP2 = run_mdp_simulation(input);

toc


%% model 3 - lesioned extero
tic
input.wI = .9;   % Interoceptive (inverse) volatility
input.wE = .9;   % Exteroceptive (inverse) volatility
input.xi = 3; % Preferences
input.zI = 0.9; % Interoceptive sensory precision
input.zE = 0.5;% Exteroceptive sensory precision
input.E = 1;
input.T = 40;

MDP3 = run_mdp_simulation(input);

toc




%% figure 3B
[h1_1, h2_1, h3_1] = split_h_cardiac_extero(MDP1);
[h1_2, h2_2, h3_2] = split_h_cardiac_extero(MDP2);
[h1_3, h2_3, h3_3] = split_h_cardiac_extero(MDP3);

figure; 
cmap = cbrewer2('seq', 'PuRd', 3);
y = [h1_1 h2_1 h3_1; h1_2 h2_2 h3_2; h1_3 h2_3 h3_3];%; h1_4 h2_4 h3_4];
b = bar(y,'FaceColor','flat');

for k = 1:size(y,2)
    b(k).CData = cmap(k,:);
end
ylim([0 14])
legend({'Early Systole', 'Late Systole', 'Diastole'}, 'Location', 'NorthWest')
set(gca, 'XTickLabel', {'Normal \beta_I',...
    'Lesioned \beta_I', 'Lesioned \alpha_E'})
ylabel('Entropy (H)');
box off;
title('Cardiac Cycle and Exteroceptive Uncertainty')

fname = [figdir 'fig4b_barplot_cardiac_cycle_extero.pdf'];
%print(fname, '-dpdf', '-r600')

%%  figure 3D
[h1_1, h2_1, h3_1] = split_h_cardiac_intero(MDP1);
[h1_2, h2_2, h3_2] = split_h_cardiac_intero(MDP2);
[h1_3, h2_3, h3_3] = split_h_cardiac_intero(MDP3);

figure; 
cmap = cbrewer2('seq', 'PuRd', 3);
y = [h1_1 h2_1 h3_1; h1_2 h2_2 h3_2; h1_3 h2_3 h3_3];%; h1_4 h2_4 h3_4];
b = bar(y,'FaceColor','flat');

for k = 1:size(y,2)
    b(k).CData = cmap(k,:);
end
ylim([0 14])
legend({'Early Systole', 'Late Systole', 'Diastole'}, 'Location', 'NorthWest')
set(gca, 'XTickLabel', {'Normal \beta_I',...
    'Lesioned \beta_I', 'Lesioned \alpha_E'})
ylabel('Entropy (H)');
box off;
title('Cardiac Cycle and Interoceptive Uncertainty')

fname = [figdir 'fig4D_barplot_cardiac_cycle_intero.pdf'];
%print(fname, '-dpdf', '-r600')
