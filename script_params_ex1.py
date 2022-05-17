# Реализовать скрипт, в котором должна быть предусмотрена функция расчёта заработной платы сотрудника.
# Используйте в нём формулу: (выработка в часах*ставка в час) + премия. Во время выполнения расчёта для
# конкретных значений необходимо запускать скрипт с параметр

from sys import argv

scrip_name, employee_name, work_hours, rate, prem = argv

print("Имя скрипта:", scrip_name)
print(employee_name)
print(work_hours)
print(rate)
print(prem)


def salary():
    if type(work_hours) == float and type(rate) and type(prem):
        s = (float(work_hours) * float(rate)) + float(prem)
        print(f'Заработная плата {employee_name} с учетом премии составила: {float(s)}руб.')
    else:
        print('Введите корректные значения')


salary()
print(argv)
