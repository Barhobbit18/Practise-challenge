import re

mat = input().split()
n = int(mat[0])
m = int(mat[1])
matrix = []

for i in range(n):
    dump = input()
    matrix.append(dump)

sample = ""

for j in zip(*matrix):
    sample += "".join(j)

print(re.sub(r"(?<=\w)([^\w]+)(?=\w)", " ", sample))