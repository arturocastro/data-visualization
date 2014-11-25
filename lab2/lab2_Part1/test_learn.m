data = nicering;

num_neurons = 100;

steps = 50000;

learning_rate = [0.001 0.01 0.1 0.25 0.5 0.9];

radius = 60;

for i = 1 : 6
    lr = learning_rate(i);
    
    som = lab_som(data, num_neurons, steps, lr, radius);
    
    subplot(1, 6, i);
    lab_vis(som, data);
    title(strcat('Learning rate = ', num2str(lr)));
end