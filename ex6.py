# Реализовать структуру данных "Товары".

names = []
prices = []
counts = []
mess = []
shop = ()
x = input("Хотите добавить товар? Y/N: ")
x.lower()
i = 0

while x == "y":
    n = input("Введите название товара:")
    names.append(n)
    p = input("Введите цену товара:")
    prices.append(p)
    c = input("Введите количество товара:")
    counts.append(c)
    m = input("Введите единицу измерения товара:")
    mess.append(m)
    my_dict = dict(name=n, price=p, count=c, mes=m)
    shop = []
    shop.append(my_dict)
    i += 1
    x = input("Хотите добавить товар? Y/N: ")
    x.lower()
    print(i, my_dict)
print(f'название {names}, стоимость {prices}, количество {counts}, единица измерения {mess}')





