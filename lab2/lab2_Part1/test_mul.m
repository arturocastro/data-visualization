data = nicering;

num_neurons = 5000;

steps = 120000;

learning_rate = 0.1;

radius = 3000;

num_snaps = 4;

[som, snaps_t] = lab_som_mul(data, num_neurons, steps, learning_rate, radius, num_snaps);

for n = 1 : num_snaps
    subplot(1, 4, n);
    lab_vis(som{n}, data);
    title(strcat('t = ', num2str(snaps_t(n))));
end
