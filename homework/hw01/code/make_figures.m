% Generate every figure of this homework. Run from this folder.
% Record MATLAB version and toolboxes in the homework README or here.
rng(0);                                  % fixed seed
t = linspace(0, 5, 200);
figure; plot(t, 1 - exp(-t)); grid on; xlabel('t [s]'); ylabel('y(t)');
exportgraphics(gcf, '../figures/generated/step-response-matlab.pdf');
