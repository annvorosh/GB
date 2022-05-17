# Создать текстовый файл (не программно). Построчно записать фамилии сотрудников и величину их окладов (не менее 10 строк).
# Определить, кто из сотрудников имеет оклад менее 20 тысяч, вывести фамилии этих сотрудников.
# Выполнить подсчёт средней величины дохода сотрудников.

content = open('text_ex3.txt', encoding='utf-8')

print('Имеет оклад менее 20 тысяч:')
for line in content:
    line = line.split()
    if float(line[-1]) < 20000.0:
        print(line[0])
content.close()

cont = open('text_ex3.txt', encoding='utf-8')

salary = []
i = 0
for line in cont:
    i += 1
    line = line.split()
    salary.append(float(line[-1]))

av_salary = sum(salary)/i
print(f'Средняя величина дохода сотрудников: {av_salary}руб.')

content.close()