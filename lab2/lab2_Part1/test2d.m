data = nicering;

grid_width = 10;
grid_height = 10;

steps = 1%0000;

learning_rate = 0.1;

radius = 1;
tic;
[som, grid] = lab_som2d(data, grid_width, grid_height, steps, learning_rate, radius);
toc
lab_vis2d(som, grid, data);
