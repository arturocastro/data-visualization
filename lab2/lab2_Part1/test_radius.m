data = nicering;

num_neurons = 5000;

steps = 5000;

learning_rate = 0.1;

radius = [1 10 100 1000 3000];

for i = 1 : 5
    r = radius(i);
    
    som = lab_som(data, num_neurons, steps, learning_rate, r);
    
    subplot(1, 5, i);
    lab_vis(som, data);
    title(strcat('Radius=', num2str(r)));
end