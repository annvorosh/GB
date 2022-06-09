# В массиве случайных целых чисел поменять местами минимальный и максимальный
# элементы.
import random

array = [random.randint(-100, 100) for i in range(20)]
print(array)
min = 1000
max = -1000
for i, item in enumerate(array):
    if item < min:
        min = item
        place_min = i
    if item > max:
        max = item
        place_max = i

array[place_min] = max
array[place_max] = min

print(min, max)
print(array)