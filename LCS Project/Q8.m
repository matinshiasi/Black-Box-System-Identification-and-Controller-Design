clc; clear; close all;

s = tf('s');

G1 = 7 / (9.802 * s + 1);
G2 = 0.2624 / (s^2 + 0.3872 * s + 0.0375);
G3 = 0.7103 / ((s + 1.56) * (s + 0.3995) * (s + 0.1627));

Gc1 = (s + 0.558)/s;
Gc2 = (s + 0.983) * ((s+0.057)/s);
Gc3 = (s + 1.058) * ((s + 0.06) / s);

T1 = feedback(Gc1 * G1, 1);
T2 = feedback(Gc2 * G2, 1);
T3 = feedback(Gc3 * G3, 1);

systems = {T1, T2, T3};
names = {'G1', 'G2', 'G3'};
colors = {'r', 'g', 'b'};

for i = 1:3
    figure;
    rlocus(systems{i}, -100:0.1:100); % Root locus for positive and negative k
    title(['Root Locus - ' names{i}]);
end

figure;
hold on;
for i = 1:3
    [mag, phase, w] = bode(systems{i});
    [~, mag] = bode(systems{i}, w);
    margin(systems{i});
    set(findall(gca, 'Type', 'line'), 'Color', colors{i});
    % Calculate and print the gain margin and phase margin
    [Gm, Pm, Wcg, Wcp] = margin(systems{i});
    disp([names{i}, ' - Gain Margin: ', num2str(Gm), ' dB, Phase Margin: ', num2str(Pm), ' degrees']);
end
hold off;
title('Bode Plot');
legend(names);

figure;
hold on;
for i = 1:3
    nyquist(systems{i}, colors{i});
end
hold off;
title('Nyquist Plot');
grid on;
legend(names);
