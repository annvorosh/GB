# Выполнить функцию, которая принимает несколько параметров, описывающих данные пользователя: имя, фамилия, год рождения, город проживания, email, телефон. Функция должна принимать параметры как именованные аргументы. Осуществить вывод данных о пользователе одной строкой.

def user(f_name, l_name, b_year, town, mail, phone):
    """Выводим информацию о пользователе."""
    print(
        f'\nПользовател {f_name.title()} {l_name.title()} {b_year} года рождения, город {town.title()}, email: {mail}, тел.: {phone}')


user(f_name='Anna', l_name='Vorosh', b_year='1983', town='Vyborg', mail='anna@mail.ru', phone='214-60')


# -------------------2й вариант----------------------------

def person():
    firstname = input("Введите имя: ")
    lastname = input("Введите фамилию: ")
    b_day = input("Введите год рождения: ")
    city = input("Введите город проживания: ")
    email = input("Введите email: ")
    phone = input("Введите номер телефона: ")
    return firstname.title() + "   " + lastname.title() + "   " + b_day + "   " + city.title() + "   " + email + "   " + phone


print(person())

