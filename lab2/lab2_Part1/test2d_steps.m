data = nicering;

grid_width = 50;
grid_height = 50;

steps = [1 10 100 1000 10000];

learning_rate = 0.15;

radius = 30;

for i = 1 : 5
    s = steps(i);
    
    [som, grid] = lab_som2d(data, grid_width, grid_height, s, learning_rate, radius);
    
    subplot(1, 5, i);
    lab_vis2d(som, grid, data);
    title(strcat('Steps=', num2str(s)));
end
