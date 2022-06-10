#  В диапазоне натуральных чисел от 2 до 99 определить, сколько из них кратны
#  каждому из чисел в диапазоне от 2 до 9. Примечание: 8 разных ответов.
import random

a = int(input('Введите число от 2 до 9 для поиска кратных ему: '))

array = []
for i in range(2, 99 + 1):
    array.append(i)
#print(array)

mult = []
for i in array:
    if i % a == 0:
        mult.append(i)
print(mult)
