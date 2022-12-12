# Info

Тестовое задание **Конвертер валют**. Подробное условие в файле files/**task.pdf**.  
Проект состоит из репозиториев:
- Backend
- Frontend (данный репозиторий)
- Deployment

# Frontend

1. Фронтенд реализован в виде **SPA**: имеется единственный HTML-файл с вёрсткой, и JS-скрипт
   для динамической подгрузки данных с бэкенда. Использован **AngularJS**:  
   ![](https://github.com/aleksey-nsk/currency_converter_frontend/blob/master/screenshots/01_1_structure.png)  
   
2. Для локального запуска используем контейнер с **NGINX**. Настройки прописываем в файле **docker-compose.yaml**:  
   ![](https://github.com/aleksey-nsk/currency_converter_frontend/blob/master/screenshots/02_1_docker.png)  

3. Сначала необходимо запустить локально [проект с бэкендом](https://github.com/aleksey-nsk/currency_converter_backend).
   Далее в проекте с фронтендом стартуем контейнер с nginx и открываем в браузере адрес http://localhost:8099/    
   Получаем блокировку, связанную с **CORS**:    
   ![](https://github.com/aleksey-nsk/currency_converter_frontend/blob/master/screenshots/03_1_cors_error.png)    
   
   Чтобы решить эту проблему **настраиваем CORS** на
   бэкенде (см. [репозиторий backend, пункт 10](https://github.com/aleksey-nsk/currency_converter_backend)).
   
4. В итоге запущенное приложение выглядит так:    
   ![](https://github.com/aleksey-nsk/currency_converter_frontend/blob/master/screenshots/04_1_app_run.png)  
   
# Создать образ

- Создадим образ
