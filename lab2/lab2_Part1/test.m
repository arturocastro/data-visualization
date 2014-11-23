data = nicering;

num_neurons = 500;

steps = 10000;

learning_rate = 0.1;

radius = 10;

som = lab_som(data, num_neurons, steps, learning_rate, radius);

lab_vis(som, data);
