#  Реализовать проект «Операции с комплексными числами». Создайте класс «Комплексное число», реализуйте перегрузку методов сложения и умножения комплексных чисел. Проверьте работу проекта, создав экземпляры класса (комплексные числа) и выполнив сложение и умножение созданных экземпляров. Проверьте корректность полученного результата.

class ComplexNumber:
    def __init__(self, x, y):
        self.x = x
        self.y = y

    def __add__(self, other):
        return f' сумма: {self.x + other.x} + {self.y + other.y}i'

    def __mul__(self, other):
        return f' произведение: {self.x * other.x - self.y * other.y} + {self.y * other.x + other.y *self.x}i'


num_1 = ComplexNumber(1, -2)
num_2 = ComplexNumber(-3, 4)
print(num_1 + num_2)
print(num_1 * num_2)

