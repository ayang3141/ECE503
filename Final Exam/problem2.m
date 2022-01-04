% ECE 503 Final Exam Problem 2

clear all;
close all;
clc;

load first_trial1.txt;
load first_trial2.txt;
load second_trial1.txt;
load second_trial2.txt;

fts1 = first_trial1;
fts2 = first_trial2;
sts1 = second_trial1;
sts2 = second_trial2;



% figure(1)
% subplot(211);
% plot(fts1);
% subplot(212);
% plot(fts2);
% 
% figure(2)
% subplot(211);
% plot(sts1);
% subplot(212);
% plot(sts2);


%% HILBERT TRANSFORM


% Phase Information for first trial system 1
analytic_signals_1 = hilbert(fts1); % Obtain the analytic signals
AS1_phase = angle(analytic_signals_1);  % Obtain the phase information

% Phase Information for first trial system 2
analytic_signals_2 = hilbert(fts2); % Obtain the analytic signals
AS2_phase = angle(analytic_signals_2);  % Obtain the phase information

trial1_phase_diff = AS1_phase - AS2_phase; % Difference in phases

figure(1);
subplot(3,1,1);
plot((1:length(AS1_phase)), AS1_phase);
title('Phase of First Trial First System');
subplot(3,1,2);
plot((1:length(AS2_phase)), AS2_phase);
title('Phase of First Trial Second System');
subplot(3,1,3);
plot((1:length(trial1_phase_diff)), trial1_phase_diff);
title('Phase Difference of First Trial Systems');




% Phase Information for second trial system 1
analytic_signals_3 = hilbert(sts1); % Obtain the analytic signals
AS3_phase = angle(analytic_signals_3);  % Obtain the phase information

% Phase Information for second trial system 2
analytic_signals_4 = hilbert(sts2); % Obtain the analytic signals
AS4_phase = angle(analytic_signals_4);  % Obtain the phase information

trial2_phase_diff = AS3_phase - AS4_phase; % Difference in phases

figure(2);
subplot(3,1,1);
plot((1:length(AS3_phase)), AS3_phase);
title('Phase of Second Trial First System');
subplot(3,1,2);
plot((1:length(AS4_phase)), AS4_phase);
title('Phase of Second Trial Second System');
subplot(3,1,3);
plot((1:length(trial2_phase_diff)), trial2_phase_diff);
title('Phase Difference of Second Trial Systems');


% Calculate the degree of phase locking for the first experiment
degreeLock = mean(abs(trial1_phase_diff));






%% Hilbert Huang Transform

% % Phase Information for first trial system 1
% imf_fts1 = emd(fts1);   % IMF's from first trial system 1
% analytic_signals_1 = hilbert(imf_fts1); % Obtain the analytic signals
% AS1_phase = angle(analytic_signals_1);  % Obtain the phase information
% 
% % Phase Information for first trial system 2
% imf_fts2 = emd(fts2);   % IMF's from first trial system 2
% analytic_signals_2 = hilbert(imf_fts2); % Obtain the analytic signals
% AS2_phase = angle(analytic_signals_2);  % Obtain the phase information
% 
% trial1_phase_diff = AS1_phase - AS2_phase;
% 
% figure(1)
% for i = 1:10
%     subplot(10, 1, i);
%     plot(trial1_phase_diff(:,i));
% end
% 
% 
% 
% % Phase Information for second trial system 1
% imf_sts1 = emd(sts1);   % IMF's from first trial system 1
% analytic_signals_3 = hilbert(imf_sts1); % Obtain the analytic signals
% AS3_phase = angle(analytic_signals_3);  % Obtain the phase information
% 
% % Phase Information for first trial system 2
% imf_sts2 = emd(sts2);   % IMF's from first trial system 2
% analytic_signals_4 = hilbert(imf_sts2); % Obtain the analytic signals
% AS4_phase = angle(analytic_signals_4);  % Obtain the phase information
% 
% 
% trial2_phase_diff = AS3_phase - AS4_phase;
% 
% figure(2)
% for i = 1:10
%     subplot(10, 1, i);
%     plot(trial2_phase_diff(:,i));
% end






