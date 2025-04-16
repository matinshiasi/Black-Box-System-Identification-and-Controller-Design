clc; clear; close all;

s = tf('s');

G1 = (7 / (9.802 * s + 1));
G2 = 0.2624 / (s^2 + 0.3872 * s + 0.0375);
G3 = 0.7103 / ((s + 1.56) * (s + 0.3995)*(s + 0.1627));

Gc1 = (s + 0.558)/s;
Gc2 = (s + 0.983);
%%Gc3 = ((s + 0.3995) / (s + 0.467)) * ((s + 0.06) / s);
Gc3 = (s + 1.058) * ((s + 0.06) / s);

figure;
rlocus(Gc1 * G1);
title('Root Locus of G1');

figure;
rlocus(Gc2 * G2);
title('Root Locus of G2');

figure;
rlocus(Gc3 * G3);
title('Root Locus of G3');
