data = nicering;

num_neurons = 5000;

steps = 100000;

learning_rate = 0.1;

radius = 3000;

som = lab_som(data, num_neurons, steps, learning_rate, radius);

lab_vis(som, data);
