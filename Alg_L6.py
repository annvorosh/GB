# 1. Подсчитать, сколько было выделено памяти под переменные в ранее разработанных программах в рамках первых трех
# уроков. Проанализировать результат и определить программы с наиболее эффективным использованием памяти.
# Примечание: По аналогии с эмпирической оценкой алгоритмов идеальным решением будет:
# a. выбрать хорошую задачу, которую имеет смысл оценивать по памяти;
# b. написать 3 варианта кода (один у вас уже есть); проанализировать 3 варианта и выбрать оптимальный;
# c. результаты анализа (количество занятой памяти в вашей среде разработки) вставить в виде комментариев в файл с
# кодом. Не забудьте указать версию и разрядность вашей ОС и интерпретатора Python;
# d. написать общий вывод: какой из трёх вариантов лучше и почему.
# Надеемся, что вы не испортили программы, добавив в них множество sys.getsizeof после каждой переменной, а проявили
# творчество, фантазию и создали универсальный код для замера памяти.

import sys
print(sys.version, sys.platform)
# 3.9.7 (tags/v3.9.7:1016ef3, Aug 30 2021, 20:19:38) [MSC v.1929 64 bit (AMD64)] win32

'''Для примера возбмем задачу 3 из третьего урока:
В массиве случайных целых чисел поменять местами минимальный и максимальный элементы.'''

'''ВАРИАНТ 1'''
import random
array = [random.randint(-100, 100) for i in range(20)]
# print(array)
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
# print(min, max)
# print(array)

# Считаем память:
vars = (min, max, array, place_min, place_max, i, item)
count = 0
for i in vars:
    count += sys.getsizeof(i)
print(f'\nКоличество занятой памяти "ВАРИАНТА 1" в среде разработки: {count} байт')

# Количество занятой памяти "ВАРИАНТА 1" в среде разработки: 416 байт

'''ВАРИАНТ 2'''
from random import randint

num_list = [randint(-50, 50) for _ in range(10)]
# print(f'Первичный массив: {num_list}')
max_el = min_el = num_list[0]
i_min = i_max = 0
for i, el in enumerate(num_list):
    if el > max_el:
        max_el = el
        i_max = i
    elif el < min_el:
        min_el = el
        i_min = i
num_list[i_max], num_list[i_min] = num_list[i_min], num_list[i_max]
# print(f'Новый массив: {num_list}')

vars = (num_list, max_el, min_el, i_max, i_min, i, el)
count = 0
for i in vars:
    count += sys.getsizeof(i)
print(f'\nКоличество занятой памяти "ВАРИАНТА 2" в среде разработки: {count} байт')

# Количество занятой памяти "ВАРИАНТА 2" в среде разработки: 352 байт

'''ВАРИАНТ 3'''
from random import randint as rand

mas = list({rand(0, 100) for i in range(0, 11)})
# print(mas)
my_max = 0
ind_max = 0
for i, e in enumerate(mas):
    if e > my_max:
        my_max = e
        ind_max = i
my_min = my_max
ind_min = 0
for i, e in enumerate(mas):
    if e < my_min:
        my_min = e
        ind_min = i
mas[ind_max], mas[ind_min] = mas[ind_min], mas[ind_max]
# print(mas)

vars = (mas, my_max, my_min, ind_max, ind_min, i, e)
count = 0
for i in vars:
    count += sys.getsizeof(i)
print(f'\nКоличество занятой памяти "ВАРИАНТА 3" в среде разработки: {count} байт')

# Количество занятой памяти "ВАРИАНТА 3" в среде разработки: 312 байт


'''Количество занятой памяти "ВАРИАНТА 1" в среде разработки: 416 байт

Количество занятой памяти "ВАРИАНТА 2" в среде разработки: 348 байт

Количество занятой памяти "ВАРИАНТА 3" в среде разработки: 312 байт

ВЫВОД: По количеству занятой памяти третий вариант оптимальнее, так как занимает меньший объем'''