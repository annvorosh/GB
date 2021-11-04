# Создайте собственный класс-исключение, обрабатывающий ситуацию деления на нуль. Проверьте его работу на данных, вводимых пользователем. При вводе пользователем нуля в качестве делителя программа должна корректно обработать эту ситуацию и не завершиться с ошибкой.

class MyException:
    def __init__(self, div, den):
        self.div = div
        self.den = den

    @staticmethod
    def div_by_zero(div, den):
        try:
            return f'Result is {div / den}'
        except:
            return 'Division by zero is not allowed'


a = MyException(30, 2)
print(a.div_by_zero(30, 2))
print(a.div_by_zero(30, 0))