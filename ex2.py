# Создать текстовый файл (не программно), сохранить в нём несколько строк,
# выполнить подсчёт строк и слов в каждой строке.

content = open('text_ex4.txt', encoding='utf-8')


l = 0
for line in content:
    l += 1
    w = 0
    for word in line.split():
        w += 1
    print(f'In line {l} - {w} words')

content.close()



