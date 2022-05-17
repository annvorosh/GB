# Реализовать функцию my_func(), которая принимает три позиционных аргумента и возвращает сумму наибольших двух аргументов.

def my_func(a, b, c):
    if a < b and a < c:
        print(b + c)
    elif b < a and  b < c:
        print(a + c)
    elif c < a and c < b:
        print(a + b)
    else:
        print("Нет двух максимальных значений")


my_func(3, 4, 6)