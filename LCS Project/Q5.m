clc; clear; close all;

% Define transfer function variable
s = tf('s');

% Define systems
G1 = 7/(9.802 *s + 1 );
G2 = 0.2624/(s^2 + 0.3872*s + 0.0375);
G3 = 0.7103/((s+1.56)*(s+0.3995)*(s+0.1627));

% Bode plots
figure;
margin(G1); hold on;
margin(G2);
margin(G3);
legend('G1','G2','G3');
title('Bode Diagram with Gain and Phase Margins');
grid on;

% Nyquist plots
figure;
nyquist(G1); hold on;
nyquist(G2);
nyquist(G3);
legend('G1','G2','G3');
title('Nyquist Diagram');
grid on;

% Compute and display gain and phase margins
[GM1, PM1, ~, ~] = margin(G1);
[GM2, PM2, ~, ~] = margin(G2);
[GM3, PM3, ~, ~] = margin(G3);

% Display results
fprintf('System G1: Gain Margin = %.2f dB, Phase Margin = %.2f degrees\n', 20*log10(GM1), PM1);
fprintf('System G2: Gain Margin = %.2f dB, Phase Margin = %.2f degrees\n', 20*log10(GM2), PM2);
fprintf('System G3: Gain Margin = %.2f dB, Phase Margin = %.2f degrees\n', 20*log10(GM3), PM3);
