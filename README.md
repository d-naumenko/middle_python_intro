# Пробное задание

Завершите разработку: дополните метод greetings в app/main.py


## Первый запуск

1) Сформируй виртуальное Python-окружение
2) Установи зависимости `pip install -r requirements.txt`
3) Установи pre-commit hook `pre-commit install`

## Линтер

Используется `wemake-python-styleguide`.

Для тестов отключена проверка наличия документации модуля и описания аргументов в Docstring. 

Конфигурация находится в `setup.cfg`

Запуск: `flake8`

## Тестирование

Запуск: `pytest .`

## CI-CD

В GitHub actions настроен запуск линтера и тестов при событии push.

