import numpy as np
from pomegranate import distributions
from pomegranate.bayesian_network import BayesianNetwork
from itertools import product

# building on https://github.com/jmschrei/pomegranate/blob/f0b966e8fb0d6cf27b0d83a6f826d739751d91d4/examples/Bayesian_Network_Monty_Hall.ipynb

num_doors = 3

door_rate = 1./num_doors
uniform_dist = np.ones([1, num_doors]) * door_rate

guess = distributions.Categorical(uniform_dist)
hide = distributions.Categorical(uniform_dist)

# generate transition matrix
probs_matrix = np.ones((1, num_doors, num_doors, num_doors)) * (1/(num_doors-2))

for g in range(num_doors):
    # [0,table,row,column]
    np.fill_diagonal(probs_matrix[0,g], 0)
    probs_matrix[0,g,g,:] = 1/(num_doors-1)
    probs_matrix[0,g,:,g] = 0

open_door = distributions.ConditionalCategorical(probs_matrix)

model = BayesianNetwork([guess, hide, open_door], [(guess, open_door), (hide, open_door)])


# making inferences
X1 = torch.tensor([[2, 1, -1]])

X1_masked = torch.masked.MaskedTensor(X1, mask=X1 >= 0)

model.predict(X1_masked)