#  Определить, какое число в массиве встречается чаще всего.
import random

array = [random.randint(-10, 10) for _ in range(50)]
print(array)

print(max(array, key = array.count))


