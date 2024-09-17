'''  Отсортируйте по возрастанию методом слияния одномерный вещественный массив, заданный случайными числами на
промежутке [0; 50). Выведите на экран исходный и отсортированный массивы. '''

import random

array = [round(random.uniform(0, 50), 1) for i in range(10)]

print(f'ARRAY: \n{array}')


def merge_sorting(array):
    if len(array) <= 1:
        return array

    left_side = merge_sorting(array[:len(array) // 2])
    right_side = merge_sorting(array[len(array) // 2:])
    i = j = 0
    sorted_array = []

    while i < len(left_side) or j < len(right_side):
        if i >= len(left_side):
            sorted_array.append(right_side[j])
            j += 1
        elif j >= len(right_side):
            sorted_array.append(left_side[i])
            i += 1
        elif left_side[i] < right_side[j]:
            sorted_array.append(left_side[i])
            i += 1
        else:
            sorted_array.append(right_side[j])
            j += 1

    return sorted_array


print(f'SORTED ARRAY:\n{merge_sorting(array)}')

# ARRAY:
# [21.8, 22.2, 41.8, 34.4, 45.9, 31.3, 29.6, 28.2, 21.9, 2.8]
# SORTED ARRAY:
# [2.8, 21.8, 21.9, 22.2, 28.2, 29.6, 31.3, 34.4, 41.8, 45.9]
