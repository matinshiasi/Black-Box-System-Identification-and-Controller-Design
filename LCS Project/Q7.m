clc; clear; close all;

s = tf('s');

G1 = (7 / (9.802 * s + 1));
G2 = 0.2624 / (s^2 + 0.3872 * s + 0.0375);
G3 = 0.7103 / ((s + 1.56) * (s + 0.3995)*(s + 0.1627));

Gc1 = (s + 0.558)/s;
Gc2 = (s + 0.983)*((s+0.057)/s);
Gc3 = (s + 1.058) * ((s + 0.06) / s);

T1 = feedback(Gc1 * G1, 1);
T2 = feedback(Gc2 * G2, 1);
T3 = feedback(Gc3 * G3, 1);

info1 = stepinfo(T1);
info2 = stepinfo(T2);
info3 = stepinfo(T3);

ess1 = abs(1 - dcgain(T1));  
ess2 = abs(1 - dcgain(T2));  
ess3 = abs(1 - dcgain(T3));  

[y1, t1] = step(T1); 
[y2, t2] = step(T2);
[y3, t3] = step(T3);

Td1 = t1(find(y1 >= 0.5 * y1(end), 1));
Td2 = t2(find(y2 >= 0.5 * y2(end), 1));
Td3 = t3(find(y3 >= 0.5 * y3(end), 1));

fprintf('System 1: Rise Time = %.4f, Delay Time = %.4f, Settling Time = %.4f, Steady-State Error = %.4f\n', ...
        info1.RiseTime, Td1, info1.SettlingTime, ess1);
fprintf('System 2: Rise Time = %.4f, Delay Time = %.4f, Settling Time = %.4f, Steady-State Error = %.4f\n', ...
        info2.RiseTime, Td2, info2.SettlingTime, ess2);
fprintf('System 3: Rise Time = %.4f, Delay Time = %.4f, Settling Time = %.4f, Steady-State Error = %.4f\n', ...
        info3.RiseTime, Td3, info3.SettlingTime, ess3);

figure;
step(T1, 'r', T2, 'b', T3, 'g');
legend('G1', 'G2', 'G3');
title('Step Response');
grid on;
