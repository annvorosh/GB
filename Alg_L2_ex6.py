'''В программе генерируется случайное целое число от 0 до 100. Пользователь
должен его отгадать не более чем за 10 попыток. После каждой неудачной
попытки должно сообщаться, больше или меньше введенное пользователем число,
чем то, что загадано. Если за 10 попыток число не отгадано, вывести ответ.   '''
import random

x = random.randint(0, 100)
print(x)
for i in range(10):
    y = int(input('Угадайте число от 0 до 100: '))
    if y == x:
        print(f'Вы угадали число {x}')
        break
    if y < x:
        print(f'Загаданное число больше {y}')
    else:
        print(f'Загаданное число меньше {y}')

print(f'Загаданное число {x}')