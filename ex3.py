# Реализовать базовый класс Worker (работник), в котором определить атрибуты:
# name, surname, position (должность), income (доход).
# Последний атрибут должен быть защищенным и ссылаться на словарь, содержащий элементы:
# оклад и премия, например, {"wage": wage, "bonus": bonus}.
# Создать класс Position (должность) на базе класса Worker.
# В классе Position реализовать методы получения полного имени сотрудника (get_full_name)
# и дохода с учетом премии (get_total_income).
# Проверить работу примера на реальных данных (создать экземпляры класса Position,
# передать данные, проверить значения атрибутов, вызвать методы экземпляров).
#------------------------------------------------------------------------------------------------------------------

class Worker:
    def __init__(self, n, s, p, inc):
        self.name = n
        self.surname = s
        self.position = p
        self._income = inc


class Position(Worker):
    def get_full_name(self):
        print(f'{self.name} {self.surname}')

    def get_total_income(self):
        print(f'Employee income: {sum(self._income.values())} rubles')


pos_1 = Position('Anna', 'Vorosh', 'data scientist', {'wage': 100000, 'bonus': 10000})
pos_1.get_full_name()
pos_1.get_total_income()
