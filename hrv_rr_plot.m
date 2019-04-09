f = figure;
%subplot(3,1,1)
%stem(HRV.tT,HRV.H);
%subplot(2,1,1)
stairs(HRV.RR_T,HRV.RR)
ylabel('Seconds')
xlabel('Heatbeat')
title('RR Intervals')
%xlim([0 350])#
xlim([0 300])
ylim([0 2.5])
set(gca, 'FontSize', 16, 'LineWidth', 1.5)
pbaspect([3 1 1])
box off