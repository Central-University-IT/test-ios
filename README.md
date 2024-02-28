# PROD | 2 этап | Mobile (iOS)

> [!WARNING]
> Работайте только в implementation папке. Нельзя менять название типов, переменных, методов. Можно расширять типы и реализовывать логику в пустых методах. Новые сущности можно добавлять в implementation 


## 🚀 Введение

### Контекст разработки


Вы пришли в команду, которая работает над запуском нового сервиса СуперВыгода, с помощью которого можно экономить на покупках. Основа сервиса – спецпредложения (кэшбэк с покупок или бонусы программы лоаяльности) у партнеров.

Команда новая и над проектом до вас работал спецаилист, который по непредвиденным обстоятельсвам покинул компанию. Теперь вы на страже запуска проекта 🦸‍♂️ Вам предстоит доделать недостоющий функционал и исправить имеющийся.

Первая версия приложения состоит из:

1. Главный экран – тот что встречает при старте приложения. Он состоит из:
    1. Рекламного баннера
    2. Виджет пользователя, где отображаются его имя и текущий баланс бонусного счета
    3. Виджет избранного, где отображается счетчик понравившехся предложений
    4. Список рекомендуемых спецпредложений. Здесь показывается краткая информация о доступных бонусных программах, которые можно лайкнуть и сохранить в избранное
2. Экран деталей спецпредложений. Данный экран открывается при нажатии на элемент списка на главном экране и отображает детальные данные о выбранном спецпредложении.

### Устройство проекта

Проект представляет из семя многомодульное приложение. предыдущий разработчик оставил свой код в папке App модуля Solution. Ваша задача испольуя данный код реализовать недостающие сущности.

Так же в проекте добавлен базовый модуль ProdMobileCore. Изучите его и используйте при решении задач.

## 📚 Задачи

* [Задача 1 ➡️](Task/Task1.md) ~6%
* [Задача 2 ➡️](Task/Task2.md) ~7%
* [Задача 3 ➡️](Task/Task3.md) ~4%
* [Задача 4 ➡️](Task/Task4.md) ~14%
* [Задача 5 ➡️](Task/Task5.md) ~27%
* [Задача 6 ➡️](Task/Task6.md) ~9%
* [Задача 7 ➡️](Task/Task7.md) ~14%
* [Задача 8 ➡️](Task/Task8.md) ~5%
* [Задача 9 ➡️](Task/Task9.md) ~6%
* [Задача 10 ➡️](Task/Task10.md) ~8%

Решать все не обязательно. Чем больше баллов вы наберете, тем больше ваш шанс

## 📝 Оформление

Решение задания – реализация отдельного класса. Поэтому ваше решение ожидается в соответсвующих методах класса SolutionAssemlby.

Требования к оформелнию отедльных задач указаны в их описании.

### Работа с изображениями

Для всех изображений необходимо проставлять `scaleAspectFit`.

### Сетевые запросы

Для всех методов базовый url – `https://prodcontest-ios.ru`

## ❗️ Ограничения

* Язык – Swift
* Пользовательский интерфейс – UIKit
* [Рекомендуется] Xcode 14.1

## 🔄 Проверка UI

Все эталонные снимки даны для Xcode 14.1, iOS 16.1, iPhone 11
