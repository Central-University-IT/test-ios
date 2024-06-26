#  Задача 5 | Список спецпредложений – логика, обработка данных и подготовка отображения

[⬅️ назад](../README.md)

## ТЗ

Необходмио реализовать логику подготовки `[SpecialOfferViewModel]` для списка спецпредложений.

### Вью модель

Для начала нужно получить список рекомендаций офферов (для этого использовать соответсвующий метод)

Дальше нужно получить полную информацию о текущей подписке пользователя. То есть нужно получить список всех подписок, информацию о пользователе и взять полную инфорацию о подписке с конкретным кодом. Если подписка не нашлась – все хорошо, так как подписка необязательна.

Имея список спецпредложений (офферов) и подписку пользователя необходимо отфильтровать спецпредложения. Для этого нужно использовать IOffersManager

Для получившегося списка спецпредложений нужно создать вью модели

Если у спецпредложения есть ограничения по подписке (поле `restrictions`), то неоходимо указать, что оффер доступен только подписчику. Для этого нужно для текущей подписки пользователя оределить доступен ли оффер только подписчику (то есть в `restrictions`/`for_bundles` в массиве есть код подписки пользователя). Если подписка пользователя и ограничения оффера по подпискам совпали, то нужно использовать данные о текущей подписке

!Важно: При отображении подписки в оффере необходимо учитывать значение newValue – это то число бонусов, которое доступно только подписчикам. Например, если в bonus.value лежит 5, а в `restrictions`/`for_bundles.newValue` 7, то необходимо отображать именно значение 7 для `discountValue`

`discountValue` получается следующем образом: значение бонуса__тип (% для cashback и бал. для special_points). Особых требований к форматированию самих чисел нет (достаточно использовать `String(_: Double)`). То есть строчки вида "1000.0 бал."

Заголовок: `supplier.name`
Описание: `shortDescription`
Изображение: `imageFactory.offerImage(id: offer.image)`
isFavorite: брать из избранного. Если оффер с указанным id есть в избранном, то устанавливается true 

Информация о подписке передается в ViewModel только при ее наличии и при том условии, что спецпредложение доступна только пользователям с конкретной подпиской (поле `restrictions`)

Для получения цвета можно исползовать `UIColor(hexString: _)`

### Фильтраци офферов (`IOffersManager`)

Нужно отфильтровать офферы по следующему правилу;
1. Если массив restrictions содержит for_bundles, то оффер оставляем в том случае, когда код подписки пользователя содержится в массиве bundles_ids
2. Офферы со статусом "HIDDEN" не показываем
3. Офферы с типом "CREDIT" показываем только в статусах "NEW","OLD"
4. Офферы с типом "PERSONAL" показываем только, если массив `restrictions` пустой

### Переход

При вызове замыкания нажатия (onTap) необходимо перейти на экран деталей офферов для переданного идентификатора

### Лайк

При смене флага нахождения оффера в избранном необходимо обновлять данные в хранилище. То есть для оффера, в котором нажали на сердце, должна произойти запись в хранилище о том, что данный оффер теперь в избранном

При получении оповещения об изменении избранного необходимо передавать новые ViewModel в `output`

## Ожидаемое решение

- Необходимо реализовать `ISpecialOffersListInteractor`, который управляет отображением списка спецпредложений.

- Фильтрация офферов ожидается в `IOffersManager`
