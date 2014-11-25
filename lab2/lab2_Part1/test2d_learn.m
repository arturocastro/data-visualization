data = nicering;

grid_width = 30;
grid_height = 30;

steps = 5000;

learning_rate = [0.001 0.01 0.1 0.25 0.5 0.9];

radius = 20;

for i = 1 : 6
    lr = learning_rate(i);
    
    [som, grid] = lab_som2d(data, grid_width, grid_height, steps, lr, radius);
    
    subplot(1, 6, i);
    lab_vis2d(som, grid, data);
    title(strcat('Learning rate = ', num2str(lr)));
end
