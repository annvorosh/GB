# Реализовать программу работы с органическими клетками. Необходимо создать класс Клетка.
# В его конструкторе инициализировать параметр, соответствующий количеству клеток (целое число).
# В классе должны быть реализованы методы перегрузки арифметических операторов:
# сложение (__add__()), вычитание (__sub__()), умножение (__mul__()), деление (__truediv__()).

class Cell:
    def __init__(self, n):
        self.nums = n

    def __add__(self, other):
        return self.nums + other.nums

    def __sub__(self, other):
        return self.nums - other.nums

    def __mul__(self, other):
        return self.nums * other.nums

    def __truediv__(self, other):
        return self.nums // other.nums

    @property
    def make_order(self, nums_in_row=4):
        i = self.nums
        while i >= nums_in_row:
            i -= nums_in_row
            print('*' * nums_in_row)
        else:
            return '*' * (i % nums_in_row)


cell_1 = Cell(17)
cell_2 = Cell(5)

print(f'Результат деления клеток: {cell_1.__truediv__(cell_2)}')
print(f'Результат сложения клеток: {cell_1.__add__(cell_2)}')
print(f'Результат вычитания клеток: {cell_1.__sub__(cell_2)}')
print(f'Результат перемножения клеток: {cell_1.__mul__(cell_2)}')
print(cell_1.make_order)
