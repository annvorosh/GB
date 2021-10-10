# Пользователь вводит время в секундах.
# Переведите время в часы, минуты, секунды и выведите в формате чч:мм:сс.
# Используйте форматирование строк.

sec = int(input("Введите время в секундах: "))

minutes = sec // 60
sec_result = sec % 60

hours = minutes // 60
min_result = minutes % 60

print(f"{hours:02}:{min_result:02}:{sec_result:02}")



