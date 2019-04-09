function MDP = MDP_interoception_run(params)
% This simulation uses a Markov Decision process formulation of active
% inference to demonstrate the interaction between interoceptive and
% exteroceptive perception. This relies upon the fact that the function of
% exteroceptive sense organs depends upon oscillatory cycles in
% interoceptive states. The example used here is the change in retinal
% blood flow, and its influence on vision, during a cardiac cycle.

if params.r 

    rng default

end

% Precisions
%--------------------------------------------------------------------------

wI = params.wI; % Interoceptive (inverse) volatility
wE = params.wE; % Exteroceptive (inverse) volatility
xi = params.xi; % Preferences
zI = params.zI; % Interoceptive sensory precision
zE = params.zE; % Exteroceptive sensory precision

% Prior beliefs about initial states
%--------------------------------------------------------------------------
D{1} = [1 1 1]';     % Interoceptive states (diastole, diastole, systole)
D{2} = [1/3 2/3]';   % Exteroceptive states (arousing, non-arousing visual object)
 
% Likelihood
%--------------------------------------------------------------------------
A{1}(:,:,1) = [zE*zI         zE*zI         0  ; % Diastole + arousing visual stimulus
               zE*(1-zI)     zE*(1-zI)     1/2; % Systole  + arousing visual stimulus
               zI*(1-zE)     zI*(1-zE)     0  ; % Diastole + non-arousing visual stimulus
               (1-zE)*(1-zI) (1-zE)*(1-zI) 1/2];% Systole  + non-arousing visual stimulus
               
A{1}(:,:,2) = [zI*(1-zE)     zI*(1-zE)     0   ;% Diastole + arousing visual stimulus
               (1-zE)*(1-zI) (1-zE)*(1-zI) 1/2 ;% Systole  + arousing visual stimulus
               zE*zI         zE*zI         0   ;% Diastole + non-arousing visual stimulus
               zE*(1-zI)     zE*(1-zI)     1/2];% Systole  + non-arousing visual stimulus

% Transition probabilities
%--------------------------------------------------------------------------
% Autonomic control states
B{1}(:,:,1) = [(1-wI)/2 (1-wI)/2 wI      ;  % Parasympathetic
               wI       (1-wI)/2 (1-wI)/2;
               (1-wI)/2  wI      (1-wI)/2];
B{1}(:,:,2) = [(1-wI)/2 (1-wI)/2 wI      ;
               (1-wI)/2 (1-wI)/2 (1-wI)/2;
               wI       wI       (1-wI)/2]; % Sympathetic
% Visual object
B{2} = eye(2)*wE+(ones(2)-eye(2))*(1-wE);
           
% Prior preferences
%--------------------------------------------------------------------------
C{1} = [0 xi xi 0]';
%C{1} = [xi 0 0 xi]';

% MDP
%--------------------------------------------------------------------------
MDP.A = A;
MDP.B = B;
MDP.C = C;
MDP.D = D;
MDP.T = params.T;

if params.so 
    MDP.o = params.o;
end

if params.ss
    MDP.s = params.s;
end

switch params.E

    case 1
        
    case 2
    
       MDP.E = [13/20 7/20]'; % prior belief that parasympathetic policy more probable 
    
    case 3
       
       MDP.E = [5/20 15/20 ]'; % prior belief that sympathetic policy more probable
    
    otherwise
end


mdp = spm_MDP_check(MDP);
MDP = spm_MDP_VB_X(mdp);




 
