trace = generate_ecg_trace(MDP);

f = figure;
plot(1:1000, trace(1:1000), 'r', 'LineWidth', 1)
ylim([-5 10])
title('Synthetic ECG Trace')
ylabel('Amplitude (mV)')
xlabel('Time (s)')
set(gca, 'FontSize', 16, 'LineWidth', 1.5)
set(gca, 'XTick', 0:100:1100, 'XTickLabel', 0:10, 'YTick', -5:5:10, 'YTickLabel', -1:1:2)
pbaspect([3 1 1])
box off
