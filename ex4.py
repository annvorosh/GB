# Реализуйте базовый класс Car. У данного класса должны быть следующие атрибуты: speed, color, name, is_police (булево).
# А также методы: go, stop, turn(direction), которые должны сообщать, что машина поехала, остановилась, повернула (куда).
# Опишите несколько дочерних классов: TownCar, SportCar, WorkCar, PoliceCar.
# Добавьте в базовый класс метод show_speed, который должен показывать текущую скорость автомобиля.
# Для классов TownCar и WorkCar переопределите метод show_speed. При значении скорости свыше 60 (TownCar) и 40 (WorkCar)
# должно выводиться сообщение о превышении скорости.
# Создайте экземпляры классов, передайте значения атрибутов. Выполните доступ к атрибутам, выведите результат.
# Выполните вызов методов и также покажите результат.
#-----------------------------------------------------------------------------------------------------------

class Car:
    def __init__(self, s, c, n, ip):
        self.speed = s
        self.color = c
        self.name = n
        self.is_police = ip

    def go(self):
        print(f'Car {self.name} is moving')

    def stop(self):
        print(f'Car {self.name} was stopped')

    def turn(self, direction):
        print(f'Car {self.name} turn {direction}')

    def show_speed(self):
        print(f'Car {self.name} is moving at the speed of {int(self.speed)}km/h')


class TownCar(Car):
    def show_speed(self):
        if int(self.speed) > 60:
            print(f'Автомобиль {self.name} превысил скорость')
        else:
            print(f'Car {self.name} is moving at the speed of {int(self.speed)}km/h')


class SportCar(Car):
    def show_speed(self):
        if int(self.speed) > 60:
            print(f'Автомобиль {self.name} превысил скорость')
        else:
            print(f'Car {self.name} is moving at the speed of {int(self.speed)}km/h')


class WorkCar(Car):
    def show_speed(self):
        if int(self.speed) > 40:
            print(f'Автомобиль {self.name} превысил скорость')
        else:
            print(f'Car {self.name} is moving at the speed of {self.speed}km/h')


class PoliceCar(Car):
    def show_speed(self):
        print(f'PoliceCar {self.name} is moving at the speed of {self.speed}km/h')


car_1 = PoliceCar('100', 'blue', 'Mazda', False)
car_1.go()
car_1.stop()
car_1.turn(direction='right')
car_1.show_speed()