#  Задача 10 | Детали спецпредложения – UI кнопки избранного

[⬅️ назад](../README.md)

## ТЗ

Необходмио реализовать UI кнопки избранного на экране деталей оффера.

### Макет

![макет](./figma/button.svg)

Изображение сердца: 
* UIImage(systemName: "heart") – не в избранном
* UIImage(systemName: "heart.fill") – в избранном

**Формат текста**

"Добавить в избранное"
* Шрифт: System
* Вес: Regular
* Размер: 14

### Эталон

![](./ref/fav_true.png)

![](./ref/fav_false.png)

## Ожидаемое решение

Необходимо реализовать `FavoriteLargeButton` в соответсвии с макетом