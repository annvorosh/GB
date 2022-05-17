# Реализовать класс Stationery (канцелярская принадлежность).
# Определить в нем атрибут title (название) и метод draw (отрисовка). Метод выводит сообщение “Запуск отрисовки.”
# Создать три дочерних класса Pen (ручка), Pencil (карандаш), Handle (маркер).
# В каждом из классов реализовать переопределение метода draw.
# Для каждого из классов методы должен выводить уникальное сообщение.
# Создать экземпляры классов и проверить, что выведет описанный метод для каждого экземпляра.

class Stationery:
    def __init__(self, t):
        self.title = t

    def draw(self):
        print('Запуск отрисовки')


class Pen(Stationery):
    def draw(self):
        print(f'{self.title} is writing')


class Pencil(Stationery):
    def draw(self):
        print(f'{self.title} is drawing')


class Handle(Stationery):
    def draw(self):
        print(f'{self.title} is highlighting')


stat = Stationery('Stick')
stat.draw()

stat_1 = Pen('Blue pen')
stat_1.draw()

stat_2 = Pencil('Red pencil')
stat_2.draw()

stat_3 = Handle('Green Handle')
stat_3.draw()
