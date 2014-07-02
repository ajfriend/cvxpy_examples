# Constants:
# mu is the vector of expected returns.
# sigma is the covariance matrix.
# gamma is a Parameter that trades off risk and return.

# Variables:
# x is a vector of stock holdings as fractions of total assets.

import cvxpy as cp
import numpy as np
import math

# Problem data.
m = 100
n = 3*m
nnz = math.ceil(math.log(m))
A = np.random.randn(m,n)
x = np.zeros(n)

for i in np.random.random_integers(0,n-1,nnz):
	x[i] = 1 + np.random.rand(1)

b = A.dot(x)
xstar = x
gamma = 0.1

# Construct the problem.
x = cp.Variable(n)
objective = cp.Minimize(cp.norm(A*x - b) + gamma*cp.norm(x, 1))
p = cp.Problem(objective)

# Assign a value to gamma and find the optimal x.
result = p.solve()

print x.value