# Определение количества различных подстрок с использованием хеш-функции.
# Пусть на вход функции дана строка.
# Требуется вернуть количество различных подстрок в этой строке.
# Примечания:
# * в сумму не включаем пустую строку и строку целиком;
# * без использования функций для вычисления хэша (hash(), sha1() или любой
# другой из модуля hashlib задача считается не решённой

import hashlib

s = input('Введите строку: ')


def search(s: str) -> int:
    assert len(s) > 0, 'Строки не могут быть пустыми'

    n = len(s)
    subs = []
    hsubs = []
    for i in range(n - 1):
        for j in range(i + 1, n+1):
            sub = s[i:j]
            if sub != s:
                hsub = hashlib.sha1(sub.encode('utf-8')).hexdigest()
                if hsub not in hsubs:
                    hsubs.append(hsub)
                    subs.append(sub)

    return subs, len(set(subs))

print(search(s))



