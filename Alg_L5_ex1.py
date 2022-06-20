""" Пользователь вводит данные о количестве предприятий, их наименования и
прибыль за четыре квартала для каждого предприятия. Программа должна
определить среднюю прибыль (за год для всех предприятий) и отдельно вывести
наименования предприятий, чья прибыль выше среднего и ниже среднего.   """

from collections import namedtuple
from statistics import mean

fitches = ['name', 'first_quartal_profit', 'second_quartal_profit',
            'third_quartal_profit', 'fourth_quartal_profit']
New_Company = namedtuple("New_Company", fitches, rename=True)

count = (int(input("Enter the number of companies: ")))

companies = []

for i in range(count):
    if i == 0:
        name = (input(f"Enter the name of the 1st company: "))
    else:
        name = (input(f"Enter the name of the next company: "))
    first_quarter_profit = (float(input(f"Enter first quarterly profit of "
                                        f"{name}: ")))
    second_quarter_profit = (float(input(f"Enter second quarterly profit of "
                                        f"{name}: ")))
    third_quarter_profit = (float(input(f"Enter third quarterly profit of "
                                        f"{name}: ")))
    fourth_quarter_profit = (float(input(f"Enter fourth quarterly profit of "
                                        f"{name}: ")))

    company = New_Company(name, first_quarter_profit, second_quarter_profit,
                           third_quarter_profit, fourth_quarter_profit)

    companies.append(company)

all_comp_year_mean = []

for i in companies:
    year_mean = sum(i[1:5])
    all_comp_year_mean.append(year_mean)

print('_' * 70)
print(f'Mean profit for all companies per year: {mean(all_comp_year_mean)}')

bellow_mean = []
above_mean = []

for i in companies:
    if sum(i[1:5]) > mean(all_comp_year_mean):
        above_mean.append(i[0])
    elif sum(i[1:5]) < mean(all_comp_year_mean):
        bellow_mean.append(i[0])

print(f'Companies with below mean profit: \n{bellow_mean}')
print(f'Companies with above mean profit: \n{above_mean}')

