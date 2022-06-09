# В одномерном массиве найти сумму элементов, находящихся между минимальным и
# максимальным элементами. Сами минимальный и максимальный элементы в сумму не включать.
import random

array = [random.randint(-100, 100) for _ in range(20)]
print(array)

min = 10000
max = -10000
for i, item in enumerate(array):
    if item > max:
        max = item
        place_max = i
    elif item < min:
        min = item
        place_min = i
    else:
        pass

print(max, place_max)
print(min, place_min)

if place_min < place_max:
    print(array[place_min + 1 : place_max])
    summa = sum(array[place_min + 1: place_max])
else:
    print(array[place_max + 1: place_min])
    summa = sum(array[place_max + 1: place_min])

print(summa)


