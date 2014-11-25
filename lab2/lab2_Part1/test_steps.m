data = nicering;

num_neurons = 5000;

steps = [1 10 100 1000 10000 50000];

learning_rate = 0.1;

radius = 3000;

for i = 1 : 6
    s = steps(i);
    
    som = lab_som(data, num_neurons, s, learning_rate, radius);
    
    subplot(1, 6, i);
    lab_vis(som, data);
    title(strcat('Steps=', num2str(s)));
end