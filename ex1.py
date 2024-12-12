# Создать программный файл в текстовом формате, записать в него построчно данные, вводимые пользователем.
# Об окончании ввода данных будет свидетельствовать пустая строка.

try:
    file1 = open('my_text1.txt', 'x', encoding='utf-8')
    file1.close()
    content = open('my_text1.txt', 'w', encoding='utf-8')
    a = input("Хотите ввести данные в my_text1.txt? y/n: ")
    while a.lower() == 'y':
        b = (input("Введите новые данные в файл:"))
        print(f'{b}', file=content)
        a = input("Хотите ввести данные в my_text1.txt? y/n: ")
    else:
        print('Ввод данных окончен.')
        content.close()

except IOError:
    print('Произошла ошибка')

