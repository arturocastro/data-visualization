data = nicering;

grid_width = 30;
grid_height = 30;

steps = 10000;

learning_rate = 0.1;

radius = 20;
tic;
[som, grid] = lab_som2d(data, grid_width, grid_height, steps, learning_rate, radius);
toc

lab_vis2d(som, grid, data);
