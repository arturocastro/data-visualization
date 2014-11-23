data = nicering;

grid_width = 30;
grid_height = 20;

steps = 1000;

learning_rate = 0.1;

num_snaps = 8;

radius = 10;
tic;
[som, grid, snaps_t] = lab_som2d_mul(data, grid_width, grid_height, steps, learning_rate, radius, 8);
toc

for n = 1 : num_snaps
    subplot(2, 4, n);
    lab_vis2d(som{n}, grid, data);
    title(strcat('t = ', num2str(snaps_t(n))));
end