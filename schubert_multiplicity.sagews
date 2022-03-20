k = 2
n = 4

partition = [2, 0]
co_partition = []

for i in range(0, k):
    co_partition.append(n - k + i + 1 - partition[i])

print("partition:", partition)
print("co-partition:", co_partition)

small_partition = []

for i in range(0, len(co_partition)):
    small_partition.append(i + 1)

print("small partition:", small_partition)

co_sm_partition = []

co_dim_sing = 0

for i in range(0, k):
    co_sm_partition.append(n - k + i + 1 - small_partition[i])
    co_dim_sing = co_dim_sing + n - k + i + 1 - small_partition[i]

dim_sing = k * (n - k) - co_dim_sing

print("singular locus partition:", co_sm_partition, "dim =", dim_sing)

s = []
for i in range(0, len(co_partition)):
    s.append(0)

for i in range(0, k):
    for j in range(0, k):
        if small_partition[j] > co_partition[i]:
            s[i] = s[i] + 1

print("s:", s)

v = []

for i in range(0, k):
    for j in range(0, k):
        if j - s[i] >= 0:
            v.append(binomial(co_partition[i], j - s[i]))
        else:
            v.append(0)

m = matrix(k, k, v)
print(m)
print(m.det())
