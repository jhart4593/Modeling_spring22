K = .5;
M = 2;
K_m = 5;
B = 2;

num = [K_m 0 0];
den = [1 B/M K/M];

sys = tf(num,den);

bode(sys)