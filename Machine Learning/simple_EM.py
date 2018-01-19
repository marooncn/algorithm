# simple Expectation Maximum example
# reference: https://stackoverflow.com/questions/11808074/what-is-an-intuitive-explanation-of-the-expectation-maximization-technique#
import numpy as np
from scipy import stats

np.random.seed(np.random.randint(1000)) # for reproducible random results
num = input("Please input the iteration number ") # iteration number for EM

# set parameters
red_mean = 3
red_std = 0.8

blue_mean = 7
blue_std = 2

print("Real, red_mean  = %f, red_std  = %f" % (red_mean, red_std))
print("     blue_mean = %f, blue_std = %f" % (blue_mean, blue_std))

# draw 20 samples from normal distributions with red/blue parameters
red = np.random.normal(red_mean, red_std, size=20)
blue = np.random.normal(blue_mean, blue_std, size=20)

data = np.sort(np.concatenate((red, blue)))

# When we can see the colour of each point
# it's very easy to estimate the mean and standard deviation for each each group (by maximum likelihood estimation).
red_mean = np.mean(red)
red_std = np.std(red)
blue_mean = np.mean(blue)
blue_std = np.std(blue)
print("MLE, red_mean  = %f, red_std  = %f" % (red_mean, red_std))
print("     blue_mean = %f, blue_std = %f" % (blue_mean, blue_std))

# But what if we can't see the colours of the points? eg, every point just looks purple to us.
# To recover the mean and standard deviation parameters for each groups, we can use Expectation Maximisation.

# Step 1, guess at the parameter values for each group's mean and standard deviation
# estimates for the mean
red_mean_guess = 1.1
blue_mean_guess = 9
# estimates for the standard deviation
red_std_guess = 2
blue_std_guess = 1.7

# Step 2, compute the likelihood of each data point appearing under the current parameter guesses:
likelihood_of_red = stats.norm(red_mean_guess, red_std_guess).pdf(data)
likelihood_of_blue = stats.norm(blue_mean_guess, blue_std_guess).pdf(data)
likelihood_total = likelihood_of_red + likelihood_of_blue  # normalize
red_weight = likelihood_of_red / likelihood_total
blue_weight = likelihood_of_blue / likelihood_total

# Step 3, compute new estimates for the mean and standard deviation of the red and blue groups
# new estimates for mean
red_mean_guess = np.sum(data * red_weight) / np.sum(red_weight)
blue_mean_guess = np.sum(data * blue_weight) / np.sum(blue_weight)
# new estimates for standard deviation
blue_std_guess = np.sqrt(np.sum(red_weight * (data - red_mean_guess)**2) / np.sum(red_weight))
red_std_guess = np.sqrt(np.sum(blue_weight * (data - blue_mean_guess)**2) / np.sum(blue_weight))


# Step 4, Repeat steps 2,3 until the parameter estimate converges. Here we use iteration number to stop.
def estimate_mean(data, weight):
    return np.sum(data * weight) / np.sum(weight)


def estimate_std(data, weight, mean):
    variance = np.sum(weight * (data - mean)**2) / np.sum(weight)
    return np.sqrt(variance)


for _ in range(num-1):
    likelihood_of_red = stats.norm(red_mean_guess, red_std_guess).pdf(data)  # Step 2
    likelihood_of_blue = stats.norm(blue_mean_guess, blue_std_guess).pdf(data)
    likelihood_total = likelihood_of_red + likelihood_of_blue  # normalize
    red_weight = likelihood_of_red / likelihood_total
    blue_weight = likelihood_of_blue / likelihood_total

    red_mean_guess = estimate_mean(data, red_weight)                         # Step 3
    blue_mean_guess = estimate_mean(data, blue_weight)
    blue_std_guess = estimate_std(data, blue_weight, blue_mean_guess)
    red_std_guess = estimate_std(data, red_weight, red_mean_guess)

print("EM,  red_mean  = %f, red_std  = %f" % (red_mean_guess, red_std_guess))
print("     blue_mean = %f, blue_std = %f" % (blue_mean_guess, blue_std_guess))
