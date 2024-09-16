# Начните работу над проектом «Склад оргтехники». Создайте класс, описывающий склад. А также класс «Оргтехника»,
# который будет базовым для классов-наследников. Эти классы — конкретные типы оргтехники (принтер, сканер, ксерокс).
# В базовом классе определить параметры, общие для приведенных типов. В классах-наследниках реализовать параметры,
# уникальные для каждого типа оргтехники.

class Warehouse:
    pass


class OfficeEquipment(Warehouse):
    def __init__(self, brand, model, year, format):
        self.brand = brand
        self.model = model
        self.year = year
        self.format = format


class Printer(OfficeEquipment):
    def __init__(self, brand, model, year, format, type):
        super().__init__(brand, model, year, format)
        self.type = type    # laser or inkjet

    def print(self):
        if self.type == 'laser':
            return f'We can take {self.brand} {self.model} to print faster'
        else:
            return f'We can take {self.brand} {self.model} to print'


class Scanner(OfficeEquipment):
    def scan(self):
        return f'We can take {self.name} {self.model} to scan'


class Xerox(OfficeEquipment):
    def make_copy(self):
        return f'We can take {self.name} {self.model} to make a copy'


printer_1 = Printer('Xerox', 'Phaser_3020BI', 2020, 'A4', 'laser')
print(printer_1.print())
