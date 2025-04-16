clc; clear;
w = [0.01, 0.02, 0.1, 0.2, 0.5, 1, 2, 5, 10, 20, 50, 100];
K = [6.984, 6.935, 5.773, 3.917, 1.288, 0.351, 0.06818, 0.005483, ...
     0.0007825, 0.00008311, 0.0000001117, 0.0000000007497];

phi = [-0.0939, -0.1873,-0.8713, -1.5012, -2.516 ,-3.275, -3.9778, -4.8038, -5.5101, -6.6129, ...
       -9.7069, -27.1853];

K_dB = 20 * log10(K);
phi_deg = rad2deg(phi);

figure;
subplot(2,1,1);
semilogx(w, K_dB, '-o', 'LineWidth', 1.5);
grid on;
xlabel('Frequency (rad/sec)');
ylabel('Magnitude (dB)');
title('Bode Plot - Magnitude Response');

subplot(2,1,2);
semilogx(w, phi_deg, '-o', 'LineWidth', 1.5);
grid on;
xlabel('Frequency (rad/sec)');
ylabel('Phase (degrees)');
title('Bode Plot - Phase Response');
