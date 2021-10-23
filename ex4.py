#

#pip install translate


from translate import Translator

f_obj = open("text_ex4.txt", encoding='utf-8')
final_obj = open('new_text4.txt', 'x', encoding='utf-8')
final_obj.close()

content = f_obj.read().split("\n")

translator = Translator(to_lang="Russian")
result = translator.translate((" ".join(content)))
print(result)

with open('new_text4.txt', 'w', encoding='utf-8') as final_obj:
    final_obj.write(result)


f_obj.close()
