%% Plant

% System parameters
m = 10;
k = 0.5;

% System transfer function
G = 1/((m*s+k));

% Controller parameters
kp = 20;
ki = 2;
kd = 2;
kbc = 0.05;
tau = 0.1;
F_max = 50;
F_min = -50;


