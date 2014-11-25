data = nicering;

num_neurons = [10 100 1000 10000];

steps = 50000;

learning_rate = 0.1;

%radius = 60;

for i = 1 : 4
    nn = num_neurons(i);
    
    som = lab_som(data, nn, steps, learning_rate);
    
    subplot(1, 4, i);
    lab_vis(som, data);
    title(strcat('# neurons=', num2str(nn)));
end