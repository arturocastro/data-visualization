data = nicering;

grid_width = 50;
grid_height = 50;

steps = 25000;

learning_rate = 0.15;

num_snaps = 4;

radius = 30;

[som, grid, snaps_t] = lab_som2d_mul(data, grid_width, grid_height, steps, learning_rate, radius, num_snaps);

for n = 1 : num_snaps
    subplot(1, 4, n);
    lab_vis2d(som{n}, grid, data);
    title(strcat('t=', num2str(snaps_t(n))));
end