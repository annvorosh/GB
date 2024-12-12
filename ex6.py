# Реализовать функцию int_func(), принимающую слова из маленьких латинских букв и возвращающую их же, но с прописной первой буквой. Например, print(int_func(‘text’)) -> Text.

def int_func():
    text = str(input("Введите текст маленьких латинский букв:")).title()
    print(text)


int_func()


#-------------------------Второй вариант (отсечь лишнее)---------------

def int_func(text):
    latinica = 'qwertyuiopasdfghjklzxcvbnm'
    a = set(text.difference(latinica))
    print(text.difference(a))

text = str(input("Введите текст маленьких латинский букв:")).split()

int_func()



text = str(input("Введите текст маленьких латинский букв:")).split()
for word in text:
    final_text = int_func(word)
    if final_text:
        print(int_func(word))

