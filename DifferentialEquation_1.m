clear all
sistem1 = tf([1],[1 1]);
sistem2 = tf([1],[0.5 1]);
sistem3 = tf([1],[0.2 1]);
figure();
pzmap(sistem1, sistem2, sistem3);
legend('sistem1', 'sistem2', 'sistem3');
figure();
impulse(sistem1, sistem2, sistem3);
legend('sistem1', 'sistem2', 'sistem3');
figure();
step(sistem1, sistem2, sistem3);
legend('sistem1', 'sistem2', 'sistem3');
