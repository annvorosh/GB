### Домашнее задание

Нужно реализовать rest api на базе flask (пример https://github.com/fimochka-sudo/GB_docker_flask_example)

По шагам:
0. выбрать себе датасет (который интересен или нравится больше всего), сделать pipeline (преобразования + модель), сохранить его на диск. Если не хочется пайплайн, то можно без него, но так вам же будет удобнее потом вызывать его из кода сервиса.
1. установить удобную для себя среду разработки (pycharm прекрасен - https://www.jetbrains.com/pycharm/)
2. для вашего проекта вам понадобится requirements.txt с пакетами. Можно за основу взять такой файл из проекта выше. Для его установки прям в pycharm можно открыть терминал и сделать pip install -r requirements.txt (находясь в корне проекта конечно же при этом)
3. завести себе аккаунт на github (если его еще нет). У самого github есть такой "hello world" по работе с ним - https://guides.github.com/activities/hello-world/
4. итоговый проект должен содержать: 1) каталог app/models/ (здесь модель-пайплайн предобученная либо код обучения модели-пайплайна) 2) файл app/run_server.py (здесь основной код flask-приложения) 3) requirements.txt (список пакетов, которые у вас используются в проекте - в корне проекта) 4) README.md (здесь какое-то описание, что вы делаете, что за данные, как запускать и т.д) 5) Dockerfile 6) docker-entrypoint.sh
5. (<b>Опционально</b>): front-end сервис какой-то, который умеет принимать от пользователя введеные данные и ходить в ваш api. На самом деле полезно больше вам, т.к если ваш проект будет далее развиваться (новые модели, интересные подходы), то это хороший пунктик к резюме и в принципе - строчка в портфолио)

Полезные ссылки:
1. датасеты (для полета мысли): https://www.kaggle.com/datasets
2. конкурс Сбербанка по недвижимости (можно этот набор данных также взять и обучить модель предсказывать стоимость жилья - неплохой такой сервис может получиться) - https://www.kaggle.com/c/sberbank-russian-housing-market/data Там же и ноутбуки с разными подходами есть.
3. минималистичный пример связки keras/flask https://blog.keras.io/building-a-simple-keras-deep-learning-rest-api.html для определения класса картинки
4. неплохой такой пример (помимо того, что разобрали на занятии) связки docker/flask - https://cloud.croc.ru/blog/byt-v-teme/flask-prilozheniya-v-docker/
5. https://www.digitalocean.com/community/tutorials/how-to-build-and-deploy-a-flask-application-using-docker-on-ubuntu-18-04

p.s. если проблемы с выбором датасета, то пишите пожалуйста - будем вместе думать)

## DATASET
### 200K SHORT TEXTS FOR HUMOR DETECTION
#### Classify if a text sentence is funny or not
Cover image

Data Card

Code (20)

Discussion (1)
About Dataset
Dataset Paper : https://arxiv.org/abs/2004.12765
Title : Colbert: Using bert sentence embedding for humor detection
Author: Annamoradnejad, Issa and Zoghi, Gohar
journal: arXiv preprint arXiv:2004.12765
