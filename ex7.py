import json

my_f = open('text_ex7.txt', 'r', encoding='utf-8')
prof_dict = ({})
content = my_f.readline().split()
while content:
    print(content)
    profit = int(content[2]) - int(content[3])
    print(f'Прибыль компании  {profit}')
    prof_dict.update({content[0]: profit})
    content = my_f.readline().split()
av_profit = sum([int(n) for n in prof_dict.values() if int(n) >= 0])/(
    len([int(n) for n in prof_dict.values() if int(n) >= 0]))
av_dict = ({'av_profit': av_profit})
profits = [prof_dict, av_dict]
print(profits)

with open('my_text7.json', 'w', encoding='utf-8') as f_obj:
    json.dump(profits, f_obj, ensure_ascii=False)

my_f.close()
