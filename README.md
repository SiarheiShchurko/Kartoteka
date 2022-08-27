# Kartoteka

Приложение "Картотека" - это сервис который предоставляет полную информацию по юридическим лицам которые зарегистрированы в Беларуси, России, Казахстане, Украине.
Поиск осуществляется по индивидуальному номеру юридического лица. 

Приложение имеет четыре основных экрана:
1) Экран новости
2) Экран на котором выполняется поиск информации
3) Экран с контактной информацией, формой обратной связи, а также картой.
4) Экран настройки профиля. 

Переходы между основными экранами выполняются с помощью TabBar для удобства пользователя.

Стартовая страница приложения - это экран новостей выглядит вот так:
![Simulator Screen Shot - iPhone 11 - 2022-08-26 at 11 21 00](https://user-images.githubusercontent.com/101253596/187038104-5c36b962-facf-4240-9aa7-faf18d363a88.png)

Когда пользователь кликает по одной из новостей, открывается сайт "Картотеки" где пользователь изучает заинтересовавшую его информацию.

Второй экран приложения - это экран поиска информации. Есть специальное окно куда вводится номер юридического лица которое нужно проверить. Если формат номера верный, кнопка "Найти" становится активной. 

![Simulator Screen Shot - iPhone 11 - 2022-08-26 at 11 21 11](https://user-images.githubusercontent.com/101253596/187038429-552bfbdf-c8f9-46ed-9c20-0075e4eda527.png)

Если по данному запросу ответ с сервера не получен, приложение попросит пользователя проверить интернет соединение, актуальность запрашиваемого УНП/ИНН клиента, либо же проверить настройки в личном кабинете:

*FIXME (Add img)

Если ответ получен, пользователю сначала отображается базовая информация о клиенте:
![Simulator Screen Shot - iPhone 11 - 2022-08-26 at 11 23 32](https://user-images.githubusercontent.com/101253596/187038713-5f391b64-9c1d-4d7f-a043-e3f1adecf1fb.png)

В случае когда пользователю нужно больше информации (Он хочет посмотреть инфо о штрафах, банкротве, информацию о тендерах) он тапает по ячейке с отображаемой информацией (в ячейке отражен disclosure indicator который подсказывает о возможности дальнейшего перехода) и получает полный отчет по данному контрагенту:
![Simulator Screen Shot - iPhone 11 - 2022-08-26 at 11 25 06](https://user-images.githubusercontent.com/101253596/187038886-5452b661-626f-4676-ba62-d760601fd8db.png)
![Simulator Screen Shot - iPhone 11 - 2022-08-26 at 11 25 00](https://user-images.githubusercontent.com/101253596/187038887-b249da03-e677-4b8c-8116-e580c0326a4e.png)
![Simulator Screen Shot - iPhone 11 - 2022-08-26 at 11 24 53](https://user-images.githubusercontent.com/101253596/187038888-318847f9-2b22-4764-943a-287e3abcf935.png)
![Simulator Screen Shot - iPhone 11 - 2022-08-26 at 11 24 45](https://user-images.githubusercontent.com/101253596/187038889-3a791899-18ab-4988-9a92-8840d218725b.png)
![Simulator Screen Shot - iPhone 11 - 2022-08-26 at 11 24 39](https://user-images.githubusercontent.com/101253596/187038891-27c20df5-b225-409f-ac29-ddd4b648a2f6.png)
![Simulator Screen Shot - iPhone 11 - 2022-08-26 at 11 24 30](https://user-images.githubusercontent.com/101253596/187038893-80e2fefc-c608-418f-9297-b2610e720726.png)
![Simulator Screen Shot - iPhone 11 - 2022-08-26 at 11 24 15](https://user-images.githubusercontent.com/101253596/187038895-14e2d485-05eb-4e85-8f61-c5ab38a92ac2.png)
![Simulator Screen Shot - iPhone 11 - 2022-08-26 at 11 24 08](https://user-images.githubusercontent.com/101253596/187038896-0f8cecd2-1bb6-4ea3-9cc0-bffdb324254f.png)
![Simulator Screen Shot - iPhone 11 - 2022-08-26 at 11 24 01](https://user-images.githubusercontent.com/101253596/187038898-23acc2cf-f227-450f-8aaa-d3517a53effd.png)
![Simulator Screen Shot - iPhone 11 - 2022-08-26 at 11 23 52](https://user-images.githubusercontent.com/101253596/187038899-234c1a6b-7514-4e21-abc9-8f92c089a703.png)
![Simulator Screen Shot - iPhone 11 - 2022-08-26 at 11 23 41](https://user-images.githubusercontent.com/101253596/187038900-686708c8-4917-4866-8ed5-512e3c172929.png)

