% Define constants
R = 8.314; % Gas constant [J/(mol*K)]
P = 101325; % Atmospheric pressure [Pa]
V = 200; % Greenhouse volume [m^3]
Cp = 1005; % Heat capacity of air [J/(kg*K)]
rho = 1.2; % Density of air [kg/m^3]
A = 100; % Greenhouse surface area [m^2]
alpha = 0.8; % Solar absorptivity of greenhouse cover
epsilon = 0.9; % Infrared emissivity of greenhouse cover
sigma = 5.67e-8; % Stefan-Boltzmann constant [W/(m^2*K^4)]

% Define initial conditions
T_out = 23; % Outside temperature [K]
T_in = 23; % Inside temperature [K]

% Define simulation parameters
dt = 60; % Time step [s]
t_end = 86400; % End time [s]
t = 0:dt:t_end; % Time vector

% Define solar radiation input
I = 500 + 500*sin(2*pi*t/86400); % Solar radiation [W/m^2]

% Simulate temperature evolution
for i = 1:length(t)
    % Compute greenhouse heat exchange
    Q_in = alpha*I(i)*A - epsilon*sigma*A*T_in^4; % Heat flux into greenhouse [W]
    Q_out = (T_in - T_out)*rho*Cp*V/3600; % Heat flux out of greenhouse [W]
    Q = Q_in - Q_out; % Net heat flux [W]
    
    % Compute temperature change
    dT = Q*dt/(rho*Cp*V);
    T_in = T_in + dT;
end

% Plot results
figure
plot(t/3600, T_in, 'LineWidth', 1.5)
xlabel('Time [h]')
ylabel('Temperature [\circC]')
title('Greenhouse Temperature Simulation')
grid on
