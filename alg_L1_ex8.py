# Вводятся три разных числа. Найти, какое из
# них является средним (больше одного, но меньше другого).

print('Введите три разных числа')

a = int(input('Введите число а:'))
b = int(input('Введите число b:'))
c = int(input('Введите число c:'))

if a > b:
    if a < c:
        print(f'a = {a} среднее число')
    elif b > c:
        print(f'b = {b} среднее число')
    else:
        print(f'c = {c} среднее число')
elif a > c:
    print(f'a = {a} среднее число')
elif b > c:
    print(f'c = {c} среднее число')
else:
    print(f'b = {b} среднее число')
