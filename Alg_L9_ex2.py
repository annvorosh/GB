# 2. Закодируйте любую строку по алгоритму Хаффмана.
import heapq
from collections import Counter, namedtuple


s = input('Введите строку: ')

class Node(namedtuple("Node", ['left', 'right'])):
    def walk(self, code, acc):
        self.left.walk(code, acc + "0")
        self.right.walk(code, acc + "1")

class Leaf(namedtuple("Leaf", ['char'])):
    def walk(self, code, acc):
        code[self.char] = acc or "0"

def huffman(s):
    h = []
    for _, freq in Counter(s).items():
        h.append((freq, len(h), Leaf(_)))
    heapq.heapify(h)

    count = len(h)
    while len(h) > 1:
        freq1, _count1, left = heapq.heappop(h)
        freq2, _count2, right = heapq.heappop(h)
        heapq.heappush(h, (freq1 + freq2, count, Node(left, right)))
        count += 1

    [(_freq, count, root)] = h
    code = {}
    root.walk(code, "")
    return code

def main():
    code = huffman(s)
    encoded = ''.join(code[_] for _ in s)
    print(len(code), len(encoded))
    for _ in sorted(code):
        print("{}: {}".format(_, code[_]))
    print(encoded)

if __name__ == "__main__":
    main()

# Введите строку: robot verner
# 8 35
#  : 000
# b: 1110
# e: 110
# n: 100
# o: 101
# r: 01
# t: 1111
# v: 001
# 01101111010111110000011100110011001






