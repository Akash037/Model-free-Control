clc
clear all
% data=readmatrix("Model_free_data_external_temp.csv");
data=readmatrix("14feb.csv");
data=data(:, 6);
% plot(data(:, 5));
% hold on;
% plot(data(:, 6));

% Parameters
alpha=1;
ch=1:1:1924; ch=ch';
Kp=1;
delta=1;

Ti=data;
Ti_ref=23;

e_Ti=Ti-Ti_ref;

% q=-alpha*ch-Kp*e_Ti;

for i=1:size(data)
    F_est(i)=(-alpha*ch(i)-Kp*e_Ti(i))/delta;
    u(i)=-(F_est(i)+Kp*e_Ti(i))/alpha;
    ch(i)=u(i);

end

% F_est=(-alpha*ch-Kp*e_Ti)/delta;
% 
% u=-(F_est+Kp*e_Ti)/alpha;

plot(F_est)
hold on
plot(data)

% fun = @(x) -alpha*ch-Kp*e_Ti;

% q=trapz(-alpha*ch-Kp*e_Ti);
% q = integral(fun,0,1924);