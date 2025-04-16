clc; clear; close all;

reshapedOutput = reshape(output, [], 1);

[amplitude1, time1] = findpeaks(input);
[amplitude2, time2] = findpeaks(reshapedOutput);

w = 0.2;

phaseDifference = atan(100 * w) - atan(w / 100);

phaseMatrix = repmat(phaseDifference, 1001, 1);

phi = ((time1(10) - time2(10)) / 1000) * w - phaseMatrix;

disp(phi);
