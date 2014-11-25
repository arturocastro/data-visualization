function [som, snap_t] = lab_som_mul (trainingData, neuronCount, trainingSteps, startLearningRate, startRadius, num_snaps)
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

% Metadata, number of examples and number of dimensions
N = length(trainingData);
d = length(trainingData(1, :));

% If startRadius is not an param, default is half of the network's length.
if nargin < 5
    startRadius = neuronCount / 2;
end

% Initialization #1 - Random sub sample
w = datasample(trainingData, neuronCount);

% Initialization #1 - Completely random from [0, 1]
%som = rand(neuronCount, d);

% Nice line TODO

t = 1;

% t1 is current iterations, t2 is total iterations over log(startRadius)
tau1 = trainingSteps;
tau2 = trainingSteps / log(startRadius);

som = cell(num_snaps, 1);
snap_t = zeros(num_snaps, 1);

curr_snap = 1;
snap_step = floor(floor(trainingSteps / num_snaps))
cell_n = 1;

while t <= trainingSteps
    x_n = trainingData(randi(N) , :);
    
    diffs = bsxfun(@minus, x_n, w);
    distances = mag(diffs);
    
    [min_distane, min_ix] = min(distances);
    
    % Learning rate decay.
    n_t = startLearningRate * exp(t / tau1);
    %n_t = 1 / (20 + t);

    % Get radius for this iteration.
    sigma_t = startRadius * exp(-t / tau2);
    
    % Update neurons in selected neighborhood.
    l = max(1, ceil(min_ix - sigma_t));
    r = min(neuronCount, floor(min_ix + sigma_t));
    
    for k = l : r
        distance = abs(k - min_ix);
        
        sigma_sqr = sigma_t ^ 2;
        
        % Kernel function.
        h = exp( -(distance ^ 2) / (2 * sigma_sqr) );
        
        % Update weights.
        w(k, :) = w(k, :) + n_t * h * (x_n - w(k, :));
    end
    
    if t == curr_snap
	    som{cell_n} = w;
		curr_snap = curr_snap + snap_step;
        snap_t(cell_n) = t;
        cell_n = cell_n + 1;
        t
	end
    
    t = t + 1;
end

end
