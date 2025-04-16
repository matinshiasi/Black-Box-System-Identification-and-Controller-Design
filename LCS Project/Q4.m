s = tf('s');
G1_plus = 7/(9.802 *s + 1);
rlocus(G1_plus);
G1_minus = -7/(9.802 *s + 1);
hold on ;
rlocus(G1_minus , 'r');
legend show ;

hold off ;
figure ;

G2_plus = 0.2624/(s^2+0.3872*s+0.0375) ;
rlocus(G2_plus);
G2_minus = -0.2624/(s^2+0.3872*s+0.0375) ;
hold on ;
rlocus(G2_minus , 'r');
legend show ;

hold off ;
figure ;

G3_plus = 0.7103/((s+1.56 )*(s+0.3995)*(s+0.1627)) ;
rlocus(G3_plus);
G3_minus = -0.7103/((s+1.56 )*(s+0.3995)*(s+0.1627)) ;
hold on ;
%rlocus(G3_minus , 'r');
legend show ;
