


def int_func():

    text = str(input("Введите текст маленьких латинский букв:")).title()
    if text.isalpha():
        print(text)
    else:
        print("ошибка")


int_func()
