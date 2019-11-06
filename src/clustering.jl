using Clustering

x = rand(100, 10000)
k = 50

result = kmeans(x, k, maxiter=50, display=:iter)

result.assignments
