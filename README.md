# Info

Тестовое задание **Конвертер валют**. Подробное условие в файле files/**task.pdf**.  
Проект состоит из репозиториев:
- [Backend](https://github.com/aleksey-nsk/currency_converter_backend)
- Frontend (данный репозиторий)
- [Deployment](https://github.com/aleksey-nsk/currency_converter_deployment)

# Frontend

1. Фронтенд реализован в виде **SPA**: имеется единственный HTML-файл с вёрсткой, и JS-скрипт
   для динамической подгрузки данных с бэкенда. Использован **AngularJS**. Структура файлов такая:  
   ![](https://github.com/aleksey-nsk/currency_converter_frontend/blob/master/screenshots/01_1_structure.png)  
   
2. Для локального запуска используем контейнер с **NGINX**. Настройки прописываем  
   в файле **docker-compose.yaml**:  
   ![](https://github.com/aleksey-nsk/currency_converter_frontend/blob/master/screenshots/02_1_docker.png)  

   _Установка Веб-сервера предполагает, что мы хотим с его помощью получать и просматривать  
   html-страницы сайта. Появляется вопрос: каким образом можно передать в контейнер какие-либо  
   html-файлы? В этом нам помогут volumes. **Директива volumes** говорит, что происходит монтирование локальной
   папки **./html** в контейнер по адресу **/usr/share/nginx/html**. При монтировании папка по указанному адресу
   внутри контейнера заменяется папкой с локального компьютера_.  
      
   _Важно заметить, что монтированная папка доступна для изменений **в реальном времени**. Т.е. если мы изменим
   текст в файле index.html или добавим новый файл в папку, то все эти изменения сразу же будут доступны внутри
   контейнера. Это важная функция и она позволяет вести разработку через докер. Мы вносим изменения на своём
   компьютере в примонтированные файлы и папки, и они сразу же отображаются в контейнере_.
   
3. Сначала необходимо запустить локально [проект с бэкендом](https://github.com/aleksey-nsk/currency_converter_backend).
   Далее в проекте с фронтендом стартуем контейнер с nginx и открываем в браузере адрес http://localhost:8099/    
   Получаем блокировку, связанную с **CORS**:    
   ![](https://github.com/aleksey-nsk/currency_converter_frontend/blob/master/screenshots/03_1_cors_error.png)    
   
   Чтобы решить эту проблему **настраиваем CORS** на
   бэкенде (см. [репозиторий backend, пункт 10](https://github.com/aleksey-nsk/currency_converter_backend)).
   
4. В итоге запущенное приложение выглядит так:    
   ![](https://github.com/aleksey-nsk/currency_converter_frontend/blob/master/screenshots/04_1_app_run.png)  
   
# Создать образ

- Команды для создания образа пропишем в файле build/**Dockerfile**

- Чтобы не билдить каждый раз в консоли руками, создаём в корне скрипт **build_and_push.sh**

- Далее надо через консоль залогиниться на **Docker Hub**

- Запустим файл **build_and_push.sh**. Создастся образ для фронтенда и загрузится на **Docker Hub**
