%% script to produces the plots in figure 3



%% initialize 
clear h1 h2 spiderprob1 spiderprob2 mdp1 mdp2 
close all
load MDP_30n_100t_healthy.mat
load MDP_30n_100t_lesion.mat

figdir = [pwd '\figures\'];

if ~exist(figdir)
    mkdir(figdir)
end

%% Figure 3B - expected fear

%% calculate expected probabilities

% calculate expected probabalities for healthy agents
for n = 1:length(mdp1)
   
 
[h1(n,:), spiderprob1(n,:)] = calc_h_predict_spider(mdp1(n))   ;
    
    
end

% calculate expected probabalities for lesioned agents
for n = 1:length(mdp2)
   
 
[h2(n,:), spiderprob2(n,:)] = calc_h_predict_spider(mdp2(n))   ;
    
    
end

%% plot expected fear 

f1 = figure; hold on

% plot median probabilities 
plot(1:size(h1,2), median(spiderprob1), '-r', 'LineWidth', 2)
plot(1:size(h1,2), median(spiderprob2), '-b', 'LineWidth', 2)

% plot spider onset
plot([15 15], [0 1], '--k', 'LineWidth', 2)

% plot first two heartbeats
plot([3 3], [0 1], '--m', 'LineWidth', 2)

plot([6 6], [0 1], '--m', 'LineWidth', 2)


legend({'Healthy Interoception', 'Interoceptive Lesion', 'Spider Presentation', 'Heartbeat'}, 'Location', 'SouthEast')
title('Effect of Interoception on Fear Expectation')
ylabel('Expected Probability of Spider on Next Trial')
xlabel('Trial Number')
set(gca, 'FontSize', 12)
xlim([0 40])
box off
fname = [figdir 'FearExpectation.pdf'];
print(fname, '-dpdf', '-r600')

%% figure 3A - binned beats


% prepare healthy data

clear summary_beats1
clear summary_baseline1

for n = 1:length(mdp1)

MDP_all = mdp1;
   
MDP = MDP_all(n);

spider_states = MDP.s(2,:) == 2;
flower_states = MDP.s(2,:) == 1;
beats = MDP.s(1,:) ==3;

first_spider = find(spider_states==1,1);

pre_spider_beats = beats(1:first_spider);

shift_beats = beats(first_spider:end);

beat_bins = 1:15:numel(shift_beats);
clear binned_beats

for b = 1:numel(beat_bins)

    if b < numel(beat_bins)

        binned_beats(b) = sum(shift_beats(beat_bins(b):beat_bins(b+1)-1));

    elseif b == numel(beat_bins)
     
        binned_beats(b) = sum(shift_beats(beat_bins(b):end)); % take whatever is left in the last bin 
        
    end
    
end

summary_beats1(n,:) = binned_beats;

summary_baseline1(n) = sum(pre_spider_beats);

    
end



%% prepare lesion data

clear summary_beats2
clear summary_baseline2

for n = 1:length(mdp2)

MDP_all = mdp2;
   
MDP = MDP_all(n);

spider_states = MDP.s(2,:) == 2;
flower_states = MDP.s(2,:) == 1;
beats = MDP.s(1,:) ==3;

first_spider = find(spider_states==1,1);
pre_spider_beats = beats(1:first_spider);
shift_beats = beats(first_spider:end);

beat_bins = 1:15:numel(shift_beats);
clear binned_beats

for b = 1:numel(beat_bins)

    if b < numel(beat_bins)

        binned_beats(b) = sum(shift_beats(beat_bins(b):beat_bins(b+1)-1));

    elseif b == numel(beat_bins)
     
        binned_beats(b) = sum(shift_beats(beat_bins(b):end)); % take whatever is left in the last bin 
        
    end
    
end

summary_beats2(n,:) = binned_beats;

summary_baseline2(n) = sum(pre_spider_beats);

    
end



%% summary figure

figure; hold on
clear xticklabel

data1 = [summary_baseline1', summary_beats1];
data2 = [summary_baseline2', summary_beats2];


for n = 1:6

xticklabel{n} = sprintf('+ %d', n) ;    
    
end

xticklabel = [{'Baseline'} xticklabel];


plot(1:size(data1,2), mean(data1), '-r', 'LineWidth', 2);
plot(1:size(data2,2), mean(data2), '-b', 'LineWidth', 2);

set(gca, 'XTickLabel', xticklabel);

yl = ylim;
plot([2 2], yl, '--k', 'LineWidth', 2);
%xlim([0 7])

legend({'Healthy Interoception', 'Interoceptive Lesion', 'Spider Presentation'}, 'Location', 'SouthEast')
title('Cardiac Response to Unexpected Fear Stimulus');
ylabel('Heartbeats')
xlabel('Trial Bin')
set(gca, 'FontSize', 12)
box off
fname = [figdir 'cardiac_response.pdf'];
print(fname, '-dpdf', '-r600')
