"""Массив размером 2m + 1, где m — натуральное число, заполнен случайным образом.
Найдите в массиве медиану. Медианой называется элемент ряда, делящий его на две равные части:
в одной находятся элементы, которые не меньше медианы, в другой — не больше медианы.
Примечание: задачу можно решить без сортировки исходного массива. Но если это слишком сложно, используйте метод
сортировки, который не рассматривался на уроках (сортировка слиянием также недопустима)."""

import random
import statistics

m = int(input('ENTER NUMBER: '))
array = [i for i in range(2 * m + 1)]
random.shuffle(array)
print(f'ARRAY: \n{array}')

def median_find(array):
    while len(array) > 1:
        for i in array:
            if i == max(array):
                array.remove(i)
            if i == min(array):
                array.remove(i)
    return array[0]


print(f'ARRAY MEDIAN: \n{median_find(array)}')

print(f'VERIFIED ARRAY MEDIAN: \n{statistics.median(array)}')

# ENTER NUMBER: 10
# ARRAY:
# [20, 10, 8, 17, 7, 4, 1, 2, 14, 18, 0, 19, 11, 6, 15, 13, 12, 16, 9, 5, 3]
# ARRAY MEDIAN:
# 13
# VERIFIED ARRAY MEDIAN:
# 13