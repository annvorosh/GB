# Узнайте у пользователя число n. Найдите сумму чисел n + nn + nnn.
# Например, пользователь ввёл число 3. Считаем 3 + 33 + 333 = 369

n = str(input("Введите число n: "))

sum1 = int(n)
sum2 = int(n+n)
sum3 = int(n+n+n)

sum = sum1 + sum2 + sum3
print(f"n+nn+nnn={sum1}+{sum2}+{sum3}=",sum)

#--------------------------------------------------3-----------

n = str(input("Введите число n: "))
while n < "0":
    print("I've asked ")






