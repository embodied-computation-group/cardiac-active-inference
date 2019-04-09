
load MDP_hrv_models.mat


%% healthy model

MDP = MDP_hrv_1;
HRV = HRV_Frequency(MDP);
%hrv_plot_1; % plot summary data
summary_data = HRV.freq.welch.hrv;

plot_data(1).data = [summary_data.pLF summary_data.pHF]; % output data for final barplot

hrv_rr_plot % rr 
print([figdir 'rr_plot_healthy.pdf'], '-dpdf', '-r600')

hrv_trace_plot % trace

print([figdir 'hrv_traceplot_healthy.pdf'], '-dpdf', '-r600')

psd_plot_hrv % spectral frequency

print([figdir 'hrv_spectral_healthy.pdf'], '-dpdf', '-r600')


%% visceral hyper precision model

MDP = MDP_hrv_2;
HRV = HRV_Frequency(MDP);
summary_data = HRV.freq.welch.hrv;

plot_data(1).data = [summary_data.pLF summary_data.pHF]; % output data for final barplot


psd_plot_hrv % spectral frequency

print([figdir 'hrv_spectral_hyper.pdf'], '-dpdf', '-r600')

%% visceral hyper arousal prior model


MDP = MDP_hrv_3;
HRV = HRV_Frequency(MDP);
summary_data = HRV.freq.welch.hrv;

plot_data(1).data = [summary_data.pLF summary_data.pHF]; % output data for final barplot

psd_plot_hrv % spectral frequency

print([figdir 'hrv_spectral_arousalprior.pdf'], '-dpdf', '-r600')