# На улице встретились N друзей. Каждый пожал руку всем остальным друзьям (по одному разу). Сколько рукопожатий было?
# Примечание. Решите задачу при помощи построения графа.

import numpy as np

n = int(input("Enter number of friends: "))

friends = np.vstack([np.zeros(n), np.tri(n - 1, n)]) #первый пожимает руку всем, кроме себя; последний никому,
# так как все остальные уже пожали ему руку
print(friends)

hands = 0
for i in friends:
    for j in i:
        hands += j

print(f'Number of handshakes among {n} friends: {int(hands)}')



