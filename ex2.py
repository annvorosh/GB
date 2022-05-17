# Для списка реализовать обмен значений соседних элементов. Значениями обмениваются элементы с индексами 0 и 1, 2 и 3 и т. д. При нечётном количестве элементов последний сохранить на своём месте. Для заполнения списка элементов нужно использовать функцию input().

my_list = list(input("Введите список элементов"))

a = len(my_list)

if a % 2 != 0:
    last_el = my_list[-1]
    my_list.pop(-1)
    a = len(my_list)
    for i in range(0, a, 2):
        my_list[i], my_list[i + 1] = my_list[i + 1], my_list[i]
    my_list.append(last_el)

else:
    for i in range(0, a, 2):
        my_list[i], my_list[i + 1] = my_list[i + 1], my_list[i]

print(my_list)
