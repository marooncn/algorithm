import numpy as np
import matplotlib.pyplot as plt
num = input("Please input K, you'd better input an odd number: ")

# Feature set containing (x,y) values of 25 known/training data
trainData = np.random.randint(0, 100, (25, 2)).astype(np.float32)
# Labels each one either Red or Blue with numbers 0 and 1
responses = np.random.randint(0, 2, (25, 1)).astype(np.float32)

# Take Red families and plot them
red = trainData[responses.ravel() == 0]
plt.scatter(red[:, 0], red[:, 1], 80, 'r', '^')

# Take Blue families and plot them
blue = trainData[responses.ravel() == 1]
plt.scatter(blue[:, 0], blue[:, 1], 80, 'b', 's')

# new comers
newcomer = np.random.randint(0, 100, (1,2)).astype(np.float32)
plt.scatter(newcomer[:, 0], newcomer[:, 1], 80, 'g', 'o')

# classify
diff = np.tile(newcomer, (25, 1)) - trainData
squaredDiff = diff**2
squaredDist = np.sum(squaredDiff, axis=1)
# argsort() returns the indices that would sort an array in a ascending order
sortedDistIndices = np.argsort(squaredDist)

# Nearest Neighbour
if responses[sortedDistIndices[0]] == 0:
    print("Nearest Neighbour:    red")
else:
    print("Nearest Neighbour:   blue")

# k-Nearest Neighbour
num = int(num)
rnum = np.count_nonzero(responses[sortedDistIndices[0:num]].ravel() == 0)
if rnum > num/2:
    print("k-Nearest Neighbour:  red")
else:
    print("k-Nearest Neighbour: blue")

# modified kNN
weight = []
dist = squaredDist**0.5
for i in range(num):
    weight.append(dist[sortedDistIndices[num-i-1]])

rindex = responses[sortedDistIndices[0:num]].ravel() == 0
rsum = np.sum(rindex*weight)

bindex = responses[sortedDistIndices[0:num]].ravel() == 1
bsum = np.sum(bindex*weight)

if rsum > bsum:
    print("modified kNN:         red")
else:
    print("modified kNN:        blue")

# show the plot
plt.show()
