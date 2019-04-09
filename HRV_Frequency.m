function HRV = HRV_Frequency(MDP) 
% Designated time interval of MDP
TR          = 350; %(ms)

%  
Fs          = 1/TR;
nSamples    = length(MDP.s(1,:));
T           = 0:TR:(nSamples-1)*TR;
R_idx       = MDP.s(1,:)== 3; 
R_time      = T(R_idx);

bpm(1) = find(abs(R_time - 60000) ==  min(abs(R_time - 60000)));
bpm(2) = find(abs(R_time - 120000) ==  min(abs(R_time - 120000)));
bpm(3) = find(abs(R_time - 180000) ==  min(abs(R_time - 180000)));
bpm(4) = find(abs(R_time - 240000) ==  min(abs(R_time - 240000)));
BPM        = mean([bpm(1) diff(bpm)]);

RR     = diff(R_time) /1000;
RR_T   = ((R_time(2:end) + R_time(1:end-1)) ./ 2) ./ 1000; 
ibi    = [RR_T;RR];

VLF  = [0 .04];
LF   = [.04 .15];
HF   = [.15 .4];

% % t=ibi(:,1); %time (s)
% % y=ibi(:,2); %ibi (s)
% % y=y.*1000; %convert ibi to ms
% % %assumes ibi units are seconds
% % fs = 1;
% % maxF=fs/2;
% % y = detrend(y,'linear');
% % y = y-mean(y);
% % t2 = t(1):1/fs:t(length(t));%time values for interp.
% % y2=interp1(t,y,t2','linear')'; %cubic spline interpolation
% % y2=y2-mean(y2);
% % N = length(y2);
% % ydft = fft(y2);
% % ydft = ydft(1:N/2+1);
% % psdy = (1/(fs*N)) * abs(ydft).^2;
% % psdy(2:end-1) = 2*psdy(2:end-1);
% % freq = 0:fs/length(y2):fs/2;
% % figure;plot(freq,(psdy))

window = 256;
freq = freqHRV(ibi',VLF,LF,HF,[],window,window/2,1056,10); 

HRV.freq   = freq;
HRV.VLF    = VLF;
HRV.LF     = LF;
HRV.HF     = HF; 
HRV.TR     = TR;
HRV.Fs       = Fs;
HRV.nSamples = nSamples;
HRV.T      = T;
HRV.R_idx  = R_idx;
HRV.R_time = R_time;
HRV.BPM    = BPM;
HRV.RR     = RR;
HRV.RR_T   = RR_T;


%psd_plot_hrv


end
