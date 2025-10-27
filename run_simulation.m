%% Run simulations

% Define configurations
configs = {
    struct('name', 'PID', 'ctrl_type', 0, 'color', '#0072BD');
    struct('name', 'PID - back-calculation', 'ctrl_type', 1, 'color', '#EDB120');
    struct('name', 'PID - Goodwin', 'ctrl_type', 2, 'color', '#77AC30')
};
results = struct([]);

% Loop through configurations
for i = 1:length(configs)
    ctrl_type = configs{i}.ctrl_type;

    % Run the model with the ith configuration
    simOut = sim("position_control");

    % Access the signals from out.logsout
    results(i).r = simOut.logsout.get('r').Values;
    results(i).F = simOut.logsout.get('F').Values;
    results(i).z = simOut.logsout.get('z').Values;
    results(i).v = simOut.logsout.get('v').Values;

end