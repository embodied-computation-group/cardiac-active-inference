f1 = figure;
sp = subplot(1,1,1);

[a1, a2, a3, a4] = plotPSD2(sp,HRV.freq.welch.f,HRV.freq.welch.psd,HRV.VLF,HRV.LF,HRV.HF,[0 0.6],[]);
ylabel('Density')
xlabel('Spectral Frequency')
legend([a2, a3, a4, a1], {'ULF', 'LF', 'HF', 'VHF'}, 'Location', 'EastOutside')
set(gca, 'FontSize', 16, 'LineWidth', 1.5)
box off
title('Spectral Density')
pbaspect([2 1 1])
%daspect([2 1 1])