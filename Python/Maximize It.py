import itertools

K,M = map(int, input().split())
L = list()
sMax = 0
for i in range(K):
  L.append([x*x for x in list(map(int, input().split()))[1:]])
 

for e in itertools.product(*L):
  t = sum(e)%M
  if t > sMax:
    sMax = t
print(sMax)