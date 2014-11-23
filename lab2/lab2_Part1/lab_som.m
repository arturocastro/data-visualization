function som = lab_som (trainingData, neuronCount, trainingSteps, startLearningRate, startRadius)
% som = lab_som (trainingData, neuronCount, trainingSteps, startLearningRate, startRadius)
% -- Purpose: Trains a 1D SOM i.e. A SOM where the neurons are arranged
%             in a single line. 
%             
% -- <trainingData> data to train the SOM with
% -- <som> returns the neuron weights after training
% -- <neuronCount> number of neurons 
% -- <trainingSteps> number of training steps 
% -- <startLearningRate> initial learning rate
% -- <startRadius> initial radius used to specify the initial neighbourhood size

% TODO:
% The student will need to complete this function so that it returns
% a matrix 'som' containing the weights of the trained SOM.
% The weight matrix should be arranged as follows, where
% N is the number of features and M is the number of neurons:
%
% Neuron1_Weight1 Neuron1_Weight2 ... Neuron1_WeightN
% Neuron2_Weight1 Neuron2_Weight2 ... Neuron2_WeightN
% ...
% NeuronM_Weight1 NeuronM_Weight2 ... NeuronM_WeightN
%
% It is important that this format is maintained as it is what
% lab_vis(...) expects.
%
% Some points that you need to consider are:
%   - How should you randomise the weight matrix at the start?
%   - How do you decay both the learning rate and radius over time?
%   - How does updating the weights of a neuron effect those nearby?
%   - How do you calculate the distance of two neurons when they are
%     arranged on a single line?

%net_axis_size = sqrt(neuronCount);

N = length(trainingData);
d = length(trainingData(1, :));

if nargin < 5
    startRadius = neuronCount / 2;
end

% random sub sample TODO
som = rand(neuronCount, d);

t = 1;

tau1 = trainingSteps;
tau2 = trainingSteps / log(startRadius);

while t <= trainingSteps
    x_n = trainingData(randi(N) , :);
    
    diffs = bsxfun(@minus, x_n, som);
    distances = mag(diffs);
    
    [min_distane, min_ix] = min(distances);
    
    n_t = startLearningRate * exp(t / tau1);

    sigma_t = startRadius * exp(-t / tau2);
    
    l = max(1, ceil(min_ix - sigma_t));
    r = min(neuronCount, floor(min_ix + sigma_t));
    
    for k = l : r
        distance = abs(k - min_ix);
        
        h = exp((distance ^ 2) / ( 2 * (sigma_t ^ 2)));
        
        som(k, :) = som(k, :) + n_t * h * (x_n - som(k, :));
    end
    
    t = t + 1;
end

end
