function trace = generate_ecg_trace(MDP)
%% function to generate a synthetic ECG trace

x = [];
for j = 1:size(MDP.xn{2},4)
    x(1,end+1:end+size(MDP.xn{2},1)) = MDP.xn{2}(:,1,j,j);
end

ecg = [0.3*sin(0:0.5:pi) zeros(1,10) -0.5 0:3:5 7:-3:-3 zeros(1,10)];
trace = [];
H = MDP.s(1,:)==3;


for i = 1:length(H)
    if H(i)
        trace(end+1:end+length(ecg)) = ecg;
    elseif i>1
        if H(i-1)
            trace(end+1:end+length(ecg)) = [0.8*sin(0:0.1:pi) zeros(1,length(ecg)-32)];
        else
            trace(end+1:end+length(ecg)) = zeros(1,length(ecg));
        end
    else
        trace(end+1:end+length(ecg)) = zeros(1,length(ecg));
    end
end


end