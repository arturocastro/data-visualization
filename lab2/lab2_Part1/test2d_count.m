data = nicering;

grid_width = [10 20 30 50];
grid_height = [10 20 30 50];

steps = 5000;

learning_rate = 0.15;

%radius = 20;

for i = 1 : 4
    [som, grid] = lab_som2d(data, grid_width(i), grid_height(i), steps, learning_rate);
    
    subplot(1, 4, i);
    lab_vis2d(som, grid, data);
    title(strcat('Grid axis length=', num2str(grid_width(i))));
end
