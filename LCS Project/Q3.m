clc; clear; close all;


s = tf('s');
G1 = 7/(9.802 *s + 1);
G2 = 0.2624/(s^2 + 0.3872*s + 0.0375);
G3 = 0.7103/((s + 1.56)*(s + 0.3995)*(s + 0.1627));


[y1, t1] = step(G1, 0:0.01:50); 
[y2, t2] = step(G2, 0:0.01:50);
[y3, t3] = step(G3, 0:0.01:50);


final_value = 6.3;
tolerance = 0.01;


idx1 = find(abs(y1 - final_value) < tolerance, 1); 
idx2 = find(abs(y2 - final_value) < tolerance, 1);
idx3 = find(abs(y3 - final_value) < tolerance, 1);


if ~isempty(idx1)
    t1_close = t1(idx1);
else
    t1_close = NaN;
end

if ~isempty(idx2)
    t2_close = t2(idx2);
else
    t2_close = NaN;
end

if ~isempty(idx3)
    t3_close = t3(idx3);
else
    t3_close = NaN;
end

% نمایش مقدار زمان‌ها در Command Window
disp(['زمان برای G1: ', num2str(t1_close)]);
disp(['زمان برای G2: ', num2str(t2_close)]);
disp(['زمان برای G3: ', num2str(t3_close)]);


figure;
hold on;
grid on;


plot(t1, y1, 'b', 'LineWidth', 1.5);
plot(t2, y2, 'r', 'LineWidth', 1.5);
plot(t3, y3, 'g', 'LineWidth', 1.5);


if ~isnan(t1_close)
    plot(t1_close, final_value, 'bo', 'MarkerFaceColor', 'r', 'MarkerSize', 8);
end
if ~isnan(t2_close)
    plot(t2_close, final_value, 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 8);
end
if ~isnan(t3_close)
    plot(t3_close, final_value, 'go', 'MarkerFaceColor', 'r', 'MarkerSize', 8);
end


yline(final_value, '--', 'Color', [0.5 0.5 0.5]);



legend('G1', 'G2', 'G3', 'Point at 6.3 (G1)', 'Point at 6.3 (G2)', 'Point at 6.3 (G3)', 'Location', 'Best');
xlabel('Time (seconds)');
ylabel('Response');
title('Step Response with Marked Points at 6.3');

hold off;
