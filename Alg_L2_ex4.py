''' Найти сумму n элементов следующего ряда чисел: 1, -0.5, 0.25, -0.125,
… Количество элементов (n) вводится с клавиатуры '''

n = int(input('Введите количество элементов: '))

el = 1
summ = 0
for i in range(n):
    summ += el
    el /= (-2)
print(f'Сумма элементов = {summ}')

