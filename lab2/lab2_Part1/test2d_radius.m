data = nicering;

grid_width = 50;
grid_height = 50;

steps = 10000;

learning_rate = 0.15;

radius = [1 10 20 30];

for i = 1 : 4
    r = radius(i);
    
    [som, grid] = lab_som2d(data, grid_width, grid_height, steps, learning_rate, r);
    
    subplot(1, 4, i);
    lab_vis2d(som, grid, data);
    title(strcat('Radius=', num2str(r)));
end
