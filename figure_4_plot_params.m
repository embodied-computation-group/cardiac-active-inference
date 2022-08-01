%% initialize


figdir = [pwd '\Figures\'];

if ~exist(figdir)
    mkdir(figdir)
end



%% parameters - extero
tickparam = 0.5:0.1:1;
rtickparam = fliplr(tickparam); 
zlab = 'Entropy (H)';
xlab = '\alpha';
ylab = '\beta';

param_mat_in = param_mat_extero;



%% figure

figure
cmap = cbrewer2('div', 'Spectral', 50);

s=surf(tickparam, tickparam, param_mat_in); zlabel(zlab), xlabel(xlab),ylabel(ylab); colormap(cmap)
set(gca, 'XTickLabel', tickparam, 'XTick',tickparam, 'YTickLabel', tickparam, 'YTick', tickparam)
az = 140; el = 20;
zlim([0 35]);

caxis([5 35]);
view(az,el);
pbaspect([1 1 1])

fname = [figdir 'fig4A_extero.pdf'];
title('Exteroceptive Uncertainty')
%print(fname, '-dpdf', '-r600');


%% parameters - intero
tickparam = 0.5:0.1:1;
rtickparam = fliplr(tickparam); 
zlab = 'Entropy (H)';
xlab = '\alpha';
ylab = '\beta';

param_mat_in = param_mat_intero;



%% figure

figure
cmap = cbrewer2('div', 'Spectral', 50);

s=surf(tickparam, tickparam, param_mat_in); zlabel(zlab), xlabel(xlab),ylabel(ylab); colormap(cmap)
set(gca, 'XTickLabel', tickparam, 'XTick',tickparam, 'YTickLabel', tickparam, 'YTick', tickparam)
az = 140; el = 20;
zlim([0 35]);

caxis([5 35]);
view(az,el);
pbaspect([1 1 1])
title('Interoceptive Uncertainty')
fname = [figdir 'fig4C_intero.pdf'];
%print(fname, '-dpdf', '-r600');
