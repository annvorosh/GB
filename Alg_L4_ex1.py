#  Проанализировать скорость и сложность одного любого алгоритма из разработанных в рамках домашнего задания первых трех уроков.
# Примечание. Идеальным решением будет:
# a. выбрать хорошую задачу, которую имеет смысл оценивать,
# b. написать 3 варианта кода (один у вас уже есть),
# c. проанализировать 3 варианта и выбрать оптимальный,
# d. результаты анализа вставить в виде комментариев в файл с кодом (не забудьте указать, для каких N вы проводили замеры),
# e. написать общий вывод: какой из трёх вариантов лучше и почему.

#  Определить, какое число в массиве встречается чаще всего.
'''ВАРИАНТ 1'''

import random
import cProfile

def task():
    array = [random.randint(-10, 10) for _ in range(10000)]
    max(array, key=array.count)

# (venv) C:\Users\annav\Documents\GB\Algorithms\Alg_L4>python -m timeit -n 1000 -s "import Alg_L3_ex4_L3"
# 1000 loops, best of 5: 7.3 nsec per loop

#print(cProfile.run('task()'))

#          55073 function calls in 1.366 seconds
#
#    Ordered by: standard name
#
#    ncalls  tottime  percall  cumtime  percall filename:lineno(function)
#         1    0.000    0.000    1.366    1.366 <string>:1(<module>)
#         1    0.000    0.000    1.366    1.366 Alg_L3_ex4_L3.py:5(task)
#         1    0.002    0.002    0.018    0.018 Alg_L3_ex4_L3.py:6(<listcomp>)
#     10000    0.005    0.000    0.007    0.000 random.py:237(_randbelow_with_getrandbits)
#     10000    0.005    0.000    0.012    0.000 random.py:290(randrange)
#     10000    0.003    0.000    0.015    0.000 random.py:334(randint)
#         1    0.000    0.000    1.366    1.366 {built-in method builtins.exec}
#         1    1.348    1.348    1.348    1.348 {built-in method builtins.max}
#     10000    0.001    0.000    0.001    0.000 {method 'bit_length' of 'int' objects}
#         1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}
#     15067    0.001    0.000    0.001    0.000 {method 'getrandbits' of '_random.Random' objects}

# '''ВАРИАНТ 2'''
def task():
    array = [random.randint(-10, 10) for i in range(10000)]
    rep = {'count_rep': 0, 'e': 0}
    for e in array:
        if array.count(e) > rep['count_rep']:
            rep['count_rep'] = array.count(e)
            rep['e'] = e

# (venv) C:\Users\annav\Documents\GB\Algorithms\Alg_L4>python -m timeit -n 1000 -s "import HW03_4_L3"
# 1000 loops, best of 5: 7.3 nsec per loop


#print(cProfile.run('task()'))

#          65329 function calls in 1.349 seconds
#
#    Ordered by: standard name
#
#    ncalls  tottime  percall  cumtime  percall filename:lineno(function)
#         1    0.000    0.000    1.349    1.349 <string>:1(<module>)
#         1    0.002    0.002    1.349    1.349 HW03_4_L3.py:6(task)
#         1    0.002    0.002    0.016    0.016 HW03_4_L3.py:7(<listcomp>)
#     10000    0.004    0.000    0.006    0.000 random.py:237(_randbelow_with_getrandbits)
#     10000    0.005    0.000    0.011    0.000 random.py:290(randrange)
#     10000    0.003    0.000    0.014    0.000 random.py:334(randint)
#         1    0.000    0.000    1.349    1.349 {built-in method builtins.exec}
#     10000    0.001    0.000    0.001    0.000 {method 'bit_length' of 'int' objects}
#     10004    1.330    0.000    1.330    0.000 {method 'count' of 'list' objects}
#         1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}
#     15320    0.001    0.000    0.001    0.000 {method 'getrandbits' of '_random.Random' objects}

# '''ВАРИАНТ 3'''
def task():
    array = [random.randint(-10, 10) for _ in range(10000)]
    d = {}
    for num in array:
        if num not in d:
            d[num] = 1
        else:
            d[num] += 1

    max_count = sorted(d.values())[-1]
    for key, val in d.items():
        if val == max_count:
            #print(key, val)
            key

print(cProfile.run('task()'))

# (venv) C:\Users\annav\Documents\GB\Algorithms\Alg_L4>python -m timeit -n 1000 -s "import ex_4_L3"
# 1000 loops, best of 5: 7.3 nsec per loop

#          55335 function calls in 0.021 seconds
#
#    Ordered by: standard name
#
#    ncalls  tottime  percall  cumtime  percall filename:lineno(function)
#         1    0.000    0.000    0.021    0.021 <string>:1(<module>)
#         1    0.001    0.001    0.021    0.021 ex_4_L3.py:5(task)
#         1    0.003    0.003    0.020    0.020 ex_4_L3.py:6(<listcomp>)
#     10000    0.006    0.000    0.008    0.000 random.py:237(_randbelow_with_getrandbits)
#     10000    0.006    0.000    0.014    0.000 random.py:290(randrange)
#     10000    0.003    0.000    0.017    0.000 random.py:334(randint)
#         1    0.000    0.000    0.021    0.021 {built-in method builtins.exec}
#         1    0.000    0.000    0.000    0.000 {built-in method builtins.sorted}
#     10000    0.001    0.000    0.001    0.000 {method 'bit_length' of 'int' objects}
#         1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}
#     15327    0.001    0.000    0.001    0.000 {method 'getrandbits' of '_random.Random' objects}
#         1    0.000    0.000    0.000    0.000 {method 'items' of 'dict' objects}
#         1    0.000    0.000    0.000    0.000 {method 'values' of 'dict' objects}


# ОПТИМАЛЬНЫМ РЕШЕНИЕМ ДАННОЙ ЗАДАЧИ СЧИТАЮ ВАРИАНТ 3, ТАК КАК СКОРОСТЬ
# ВЫПОЛНЕНИИЯ ЗНАЧИТЕЛЬНО ВЫШЕ ПРОЧИХ ВАРИАНТОВ. кОЛИЧЕСТВО ВЫЗОВОВ ФУНКЦИИ
# ПРИ ЭТОМ ОТЛИЧАЮТСЯ НЕ СИЛЬНО