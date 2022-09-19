%% Reading the Damage cases and plotting the figures:

% Clearing:
close all; clear; clc

% Reading the file:
DS = load('hammer datafiles.mat');

% Extracting field names 
DSNames = fieldnames(DS);

% Setting the variables for sampling frequnecy and time period:
dt = 0.001;
Fs = 1/dt;

% Setting up the variables to acquire the signals of the impulse response: 
y_s_fld = extractfield(DS, DSNames{1});
y_s_val = getfield(DS, DSNames{1});

for ci = 1:15
    % Setting up the variables to extracting field names and acquire the 
    % signals of the impulse response:  
    y_s_Names = fieldnames(y_s_val);
    y_s = getfield(y_s_val, y_s_Names{ci});

    % Setting up the time duration of the signal:
    N = length(y_s);
    time = [0:N-1]*dt;
    sample_time = time(:,end);

    % Display the signal:
    figure(ci),
    plot(time,y_s);
    xlabel('Time (s)');
    ylabel('Amplitude');
    title('Impulse response');

    % Setting up the signal to start at the point of origin to eliminate
    % the ambient vibration (possible reason):
    y_tn = y_s - mean(y_s,1);

    % Display the signal:
    figure(ci+1),
    plot(time,y_tn);
    xlabel('Time (s)');
    ylabel('Amplitude');
    title('Impulse response');
end
clf

% % Writing the files as xlsx files:
% xlswrite('DC8.xlsx', DC8)