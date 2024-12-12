# В одномерном массиве целых чисел определить два наименьших элемента. Они
# могут быть как равны между собой (оба минимальны), так и различаться.
import random

array = [random.randint(0, 50) for _ in range(20)]
print(array)

min_1 = sum(array)
min_2 = sum(array)

for item in array:
    if item < min_1:
        min_1 = item
    elif item == min_1:
        min_2 = item

# print(min_1)
array.remove(min_1)
# print(array)

if min_2 != min_1:
    for item in array:
        if item < min_2:
            min_2 = item

print(min_1, min_2)
