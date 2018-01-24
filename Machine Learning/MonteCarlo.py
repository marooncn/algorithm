# Example: estimate P(Y > 3) where Y~N(0,1)
# tutorial: http://astrostatistics.psu.edu/su14/lectures/cisewski_is.pdf
import numpy as np
truth = 0.001349


def h(x):
    if x > 3:
        return 1
    else:
        return 0


vh = np.vectorize(h)
cal = 0
N = 100000
for i in range(N):
    S = np.random.normal(0, 1, 100)  # or S = np.random.randn(100)
    val = vh(S)/100.0
    cal += np.sum(val)

estimation = cal/N
print("the estimated value is %f " % estimation)
print("the truth is %f" % truth)
accuracy = 1-abs(truth-estimation)/truth
print("the accuracy is %f if only considering six decimal places" % accuracy)







