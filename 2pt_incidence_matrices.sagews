k = 3
n = 2 * k

W = [[3, 1], [2, 1], [1, 3]]

# Construct the 'general' space
S = [[0, 0]] * k
for i in range(k):
    S[i] = [k - i, i + 1]

# Take a space W and return the corresponding incidence matrix
# The space W is written as a k-by-2 vector, where W[i][j] = f_i + g_j
def buildMatrix(W):
    M = [[0 for x in range(k + 1)] for y in range(k + 1)]  # Initialize the matrix
    for i in range(k + 1):
        for j in range(k + 1):
            for l in range(len(W)):
                # Add one to the correct entry if a vector lies in the corresponding space
                if W[l][0] <= i and W[l][1] <= j:
                    M[i][j] += 1
    return M


# Take a matrix and return the first nonzero entry
def firstNonzero(M):
    c = [0, 0]
    for i in range(k + 1):
        for j in range(k + 1):
            if c == [0, 0] and M[j][i] > 0:
                c = [j, i]
                break
        if c != [0, 0]:
            break
    return c


# Take an incidence matrix and compute the special element of the corresponding orbit
def computeBasis(M):
    W = [[0, 0]] * k
    I = M
    for i in range(k):
        W[i] = firstNonzero(I)
        J = buildMatrix([W[i]])
        for j in range(k + 1):
            for l in range(k + 1):
                I[j][l] = I[j][l] - J[j][l]
    return W


def codimension(W):
    M = buildMatrix(W)
    V = computeBasis(M)
    codim = 0
    for i in range(k):
        codim += S[i][0] - V[i][0] + S[i][1] - V[i][1]
    return codim


M = buildMatrix(W)
for i in range(k + 1):
    print(M[i])
