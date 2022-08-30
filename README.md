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

![msg531103559-201950](https://user-images.githubusercontent.com/101253596/187040640-dd1198d1-1fcc-43d8-bbbb-ee843090f8bc.jpg)


Если ответ получен, пользователю сначала отображается базовая информация о клиенте:
![Simulator Screen Shot - iPhone 11 - 2022-08-26 at 11 23 32](https://user-images.githubusercontent.com/101253596/187038713-5f391b64-9c1d-4d7f-a043-e3f1adecf1fb.png)

В случае когда пользователю нужно больше информации (Он хочет посмотреть инфо о штрафах, банкротстве, информацию о тендерах) он тапает по ячейке с отображаемой информацией (в ячейке отражен disclosure indicator который подсказывает о возможности дальнейшего перехода) и получает полный отчет по данному контрагенту:

![Simulator Screen Shot - iPhone 11 - 2022-08-26 at 11 23 41](https://user-images.githubusercontent.com/101253596/187038998-2a2bff1d-0d97-4847-be69-1a661e2b7a60.png)
![Simulator Screen Shot - iPhone 11 - 2022-08-26 at 11 23 52](https://user-images.githubusercontent.com/101253596/187039007-95fb92b3-da48-4aea-8830-80ff2e252f4a.png)
![Simulator Screen Shot - iPhone 11 - 2022-08-26 at 11 24 01](https://user-images.githubusercontent.com/101253596/187039019-5f9f5c48-0ac5-4258-b0e9-b330fc948f6c.png)
![Simulator Screen Shot - iPhone 11 - 2022-08-26 at 11 24 08](https://user-images.githubusercontent.com/101253596/187039025-c9022cc7-c930-45e7-a82e-30b4ca8fcff1.png)
![Simulator Screen Shot - iPhone 11 - 2022-08-26 at 11 24 15](https://user-images.githubusercontent.com/101253596/187039033-ae1f2554-9e5a-4a60-a796-fa0686c11643.png)
![Simulator Screen Shot - iPhone 11 - 2022-08-26 at 11 24 30](https://user-images.githubusercontent.com/101253596/187039036-7276b068-1192-4098-a1aa-bb63f7151f1e.png)
![Simulator Screen Shot - iPhone 11 - 2022-08-26 at 11 24 39](https://user-images.githubusercontent.com/101253596/187039038-bddfc155-8515-4c77-997a-62645014077c.png)
![Simulator Screen Shot - iPhone 11 - 2022-08-26 at 11 24 45](https://user-images.githubusercontent.com/101253596/187039040-004253b1-707a-442f-a639-a9d30c42ebfd.png)
![Simulator Screen Shot - iPhone 11 - 2022-08-26 at 11 24 53](https://user-images.githubusercontent.com/101253596/187039047-cc84edaf-f595-49d9-9154-28e00c53c156.png)
![Simulator Screen Shot - iPhone 11 - 2022-08-26 at 11 25 00](https://user-images.githubusercontent.com/101253596/187039050-88a0e127-8fdf-427c-a984-0ec844fabc76.png)
![Simulator Screen Shot - iPhone 11 - 2022-08-26 at 11 25 06](https://user-images.githubusercontent.com/101253596/187039055-4cc15a33-0bcc-464c-be56-4c7ad9eef5f6.png)

3) Третий экран - это экран "Контакты". Здесь юзер может воспользоваться формой обратной связи отправив электронное сообщение в компанию прямо из приложения. После успешной отправки приложение сообщит пользователю, что сообщение отправлено. Также на этом кэкране отражена вся информация по времени работы компании, указан адрес с отметкой на карте:

![Simulator Screen Shot - iPhone 11 - 2022-08-26 at 11 21 25](https://user-images.githubusercontent.com/101253596/187039225-b6a02e58-1a45-4a3e-a1f7-c57d236a6c1d.png)
![Simulator Screen Shot - iPhone 11 - 2022-08-26 at 11 21 36](https://user-images.githubusercontent.com/101253596/187040011-127eeb83-6c85-496e-b5dd-7a90bebe4d70.png)
![Simulator Screen Shot - iPhone 11 - 2022-08-26 at 11 21 48](https://user-images.githubusercontent.com/101253596/187040123-c0f97fdf-9c5a-440a-aa12-830e435dce7d.png)


4) Четвертый основной экран - это экран настроек профиля. Здесь пользователь вводит свои данные включая актуальный токен без которого приложение не будет выполнять свою основную задачу. Актальный токен пользователь берет личного кабинета веб версии сервиса. 

![Simulator Screen Shot - iPhone 11 - 2022-08-26 at 11 21 57](https://user-images.githubusercontent.com/101253596/187039334-93fcd828-4b5a-472c-b87c-2d8af778e0f3.png)

Пользователь может поменять свои данные в любой удобный для этого момент путем нажатия кнопки "Изменить": 

![Simulator Screen Shot - iPhone 11 - 2022-08-26 at 11 22 08](https://user-images.githubusercontent.com/101253596/187039498-eaead669-9ce4-45f4-aa3d-0df77270840c.png)

Поля станут активными, можно вносить изменения. После внесенных корректировок обязательно сохраняем изменения путем нажатия соответствующей кнопки.

Также на этом экране есть возможность просматривать "Журнал запросов". Важно отметить, что информация в журнале не дублируется и сортируется по дате запроса. То есть если пользователь вчера выполнял проверку ООО "Рога и копыта", после чего сделал другие три запроса, последним из которых вновь были "Рога и Копыта" - в истории просмотров "Рога и копыта" будут находться самые первые и в одном экземпляре.

![Simulator Screen Shot - iPhone 11 - 2022-08-30 at 15 45 32](https://user-images.githubusercontent.com/101253596/187440645-4813171b-f7c2-4c9b-b368-cc8faf48288f.png)

В журнале присутствует searchBar с помощью которого можно искать нужного клиента по его наименованию: 

![Simulator Screen Shot - iPhone 11 - 2022-08-30 at 15 45 41](https://user-images.githubusercontent.com/101253596/187440862-b199195c-3ef7-4c7e-bccf-ba7369ab42bb.png)

Если какая-то информация в истории юзеру не нужна, он может удалить любую запись по своему желанию с помощью свайпа влево:

![Simulator Screen Shot - iPhone 11 - 2022-08-26 at 11 22 19](https://user-images.githubusercontent.com/101253596/187039833-8070858b-6e5c-4e1b-bd40-690b933843bd.png)

* Для удобства, если пользователю нужно получить полную информацию по ранее просмотренному клиенту, он может открыть историю просмотров и тапнуть по нужному ему клиенту. Приложение как и в случае запроса сначала выдаст базовую информацию, а затем и полный отчет (также как в случае стандартного запроса). Удобство заключается в том, что для получения отчета не нужно искать УНП/ИНН или прочую информацию по клиенту.

