#  Продолжить работу над первым заданием. Разработать методы, отвечающие за приём оргтехники на склад и передачу в
#  определенное подразделение компании. Для хранения данных о наименовании и количестве единиц оргтехники,
#  а также других данных, можно использовать любую подходящую структуру, например словарь.


class OfficeEquipment():
    def __init__(self, model, year, price, location, num):
        self.model = model
        self.year = year
        self.price = price
        self.location = location
        self.num = num
        self.list_storage = []
        self.item = {"Наименование": model, "Год выпуска": year, "Цена за ед.": price, "Место нахождения": location, "Количество": num}

    def new_eq(self):
        a = input("Хотите добавить новое оборудование на склад? y/n: ")
        list_storage = []
        while a.lower() == 'y':
            self.model = input("Введите наименование оборудования: ")
            self.year = int(input("Введите год покупки оборудования: "))
            self.price = float(input("Введите стоимость единицы оборудования: "))
            self.location = input("Введите расположение оборудования: ")
            self.num = int(input("Введите количество оборудования: "))
            self.item = {"Наименование": self.model, "Год выпуска": self.year, "Цена за ед.": self.price, "Место нахождения": self.location,
                         "Количество": self.num}
            print(self.item)
            list_storage.append(self.item)
            a = input("Хотите добавить новое оборудование на склад? y/n: ")
        else:
            f'Вы завершили ввод данных, на складе {list_storage}'


class Printer(OfficeEquipment):
    def __init__(self, model, year, price, location, num, type):
        super().__init__(model, year, price, location, num)
        self.type = type    # laser or inkjet
        self.list_printer = []

    def print(self):
        if self.type == 'laser':
            return f'We can take {self.model} to print faster from {self.location}'
        else:
            return f'We can take {self.model} to print'


class Scanner(OfficeEquipment):
    def scan(self):
        return f'We can take {self.model} to scan'


class Xerox(OfficeEquipment):
    def make_copy(self):
        return f'We can take  {self.model} to make a copy'


item_1 = Printer('Xerox Phaser_3020BI', 2020, 20000, 'Warehouse', 1, 'laser')
print(item_1.print())

#item_2 = Printer(input("Введите наименование оборудования: "), input("Введите год покупки оборудования: "), input("Введите стоимость единицы оборудования: "), input("Введите расположение оборудования: "), input("Введите количество оборудования: "), input("Введите тип оборудования: "))
print(item_1.new_eq())
