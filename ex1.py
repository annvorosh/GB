# Реализовать класс «Дата», функция-конструктор которого должна принимать дату в виде строки формата «день-месяц-год». В рамках класса реализовать два метода. Первый, с декоратором @classmethod, должен извлекать число, месяц, год и преобразовывать их тип к типу «Число». Второй, с декоратором @staticmethod, должен проводить валидацию числа, месяца и года (например, месяц — от 1 до 12). Проверить работу полученной структуры на реальных данных.

class Data:
    def __init__(self, dd_mm_yyyy):
        self.dd_mm_yyyy = str(dd_mm_yyyy)

    @classmethod
    def transform(cls, my_date):
        return [int(n) for n in my_date.split('-')]

    @staticmethod
    def validate(dd, mm, yyyy):
        if 1 <= int(dd) <= 31:
            if 1 <= int(mm) <= 12:
                if 1900 <= int(yyyy) <= 2100:
                    return f"Дата введена верно"
                else:
                    return f"Неверный формат даты"
            else:
                return f"Неверный формат даты"
        else:
            return f"Неверный формат даты"


my_date = Data(input("Введите дату в формате dd-mm-yyyy: "))
print(my_date.transform(my_date.dd_mm_yyyy))
print(Data.validate('01', '11', '2020'))
print(Data.validate('99', '11', '2020'))

