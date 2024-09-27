# Написать два алгоритма нахождения i-го по счёту простого числа. Функция
# нахождения простого числа должна принимать на вход натуральное  и
# возвращать соответствующее простое число. Проанализировать скорость и сложность алгоритмов.
# Первый — с помощью алгоритма «Решето Эратосфена».
# Примечание. Алгоритм «Решето Эратосфена» разбирался на одном из прошлых
# уроков.  Используйте этот код и попробуйте его улучшить/оптимизировать под задачу.
# Второй — без использования «Решета Эратосфена».
# Примечание. Вспомните классический способ проверки числа на простоту.
# Пример работы программ:
# >>> sieve(2)
# 3
# >>> prime(4)
# 7
# >>> sieve(5)
# 11
# >>> prime(1)
# 2

import cProfile

def sieve_without_eratosthenes(n):

    sieve = []
    for i in range(2, n + 1):
        for j in range(2, i):
            if i % j == 0: # если делитель нашли, то число непростое
                break
        else:
            sieve.append(i)
    return sieve[100]

print(cProfile.run('sieve_without_eratosthenes(10000)'))

#            1233 function calls in 0.357 seconds
#
#    Ordered by: standard name
#
#    ncalls  tottime  percall  cumtime  percall filename:lineno(function)
#         1    0.000    0.000    0.357    0.357 <string>:1(<module>)
#         1    0.357    0.357    0.357    0.357 Alg_L4_ex2.py:21(sieve_without_eratosthenes)
#         1    0.000    0.000    0.357    0.357 {built-in method builtins.exec}
#      1229    0.000    0.000    0.000    0.000 {method 'append' of 'list' objects}
#         1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}

def sieve_eratosthenes(n):

    sieve = [i for i in range(n)]
    sieve[1] = 0

    for i in range(2, n):
        if sieve[i] != 0:
            j = i * 2
            while j < n:
                sieve[j] = 0
                j += i
    sieve_f = []
    for i in sieve:
        if i != 0:
            sieve_f.append(i)
    sieve = sieve_f

    return sieve[100]

# sieve_eratosthenes(1000)

print(cProfile.run('sieve_eratosthenes(10000)'))

#          1234 function calls in 0.003 seconds
#
#    Ordered by: standard name
#
#    ncalls  tottime  percall  cumtime  percall filename:lineno(function)
#         1    0.000    0.000    0.003    0.003 <string>:1(<module>)
#         1    0.002    0.002    0.003    0.003 Alg_L4_ex2.py:48(sieve_eratosthenes)
#         1    0.000    0.000    0.000    0.000 Alg_L4_ex2.py:53(<listcomp>)
#         1    0.000    0.000    0.003    0.003 {built-in method builtins.exec}
#      1229    0.000    0.000    0.000    0.000 {method 'append' of 'list' objects}
#         1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}

#     '''Функция поиска i-го простого числа
#     с использованием алгоритма «Решето Эратосфена» показала себя
#     значительно лучше по времени
#     '''