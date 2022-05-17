#  Создать (программно) текстовый файл, записать в него программно набор чисел, разделенных пробелами.
#  Программа должна подсчитывать сумму чисел в файле и выводить ее на экран.

file1 = open('my_text5.txt', 'x', encoding='utf-8')
file1.close()

a = input('Введите числа в файл через пробел для суммирования:')
out_f = open('my_text5.txt', 'w')
out_f.write(a)
out_f.close()

my_f = open("my_text5.txt", "r")
content = my_f.read().split()

content = map(int, content)
summ = sum(content)
print(f'Сумма всех чисел в файле my_text5.txt равна: {summ}')
my_f.close()
