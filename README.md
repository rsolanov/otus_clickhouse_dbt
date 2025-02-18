# Проектная работа на тему "Использование dbt для трансформации данных в ClickHouse"
# Развертывание проекта
- docker-compose build
- docker-compose up -d
- В браузере перейти на страницу Airflow http://localhost:8090/home
- Запустить даг dbt_daily_build
- Подключиться к ClickHouse и удостовериться что все необходимые таблицы созданы и содержат данные

# Модели витринного слоя (dm)
## dm_category_sales
Агрегирует информацию о продажах по категориям товаров, предоставляя аналитическую информацию о том, 
сколько выручки приносит каждая категория товаров.
  
  Витрина содержит следующие данные:
  - category_id: идентификатор категории
  - category_name: название категории
  - total_sales: суммарные продажи по категории (сумма произведений цены товара (unit_price), 
  количества (quantity) и скидки (discount) для всех товаров в данной категории)

  Источники данных:
  - stg_order_details: таблица из слоя "staging", содержащая детали заказов
  - stg_products: таблица из слоя "staging", содержащая информацию о товарах
  - stg_categories: таблица из слоя "staging", содержащая информацию о категориях товаров

## dm_customer_sales
Агрегирует информацию о продажах по клиентам, предоставляя аналитическую информацию о том, 
сколько выручки приносит каждый клиент.
  
  Витрина содержит следующие данные:
  - customer_id: идентификатор клиента
  - company_name: компания, в которой работает клиент
  - contact_name: имя контактного лица в компании
  - total_sales: суммарные продажи по клиенту
  
  Источники данных:
  - stg_orders: таблица из слоя "staging", содержащая информацию о заказах
  - stg_order_details: таблица из слоя "staging", содержащая детали заказов
  - stg_customers: таблица из слоя "staging", содержащая информацию о клиентах

# Команды для поддержки инфраструктуры
## Docker Containers
- Остановка и удаление контейнера dbt: docker-compose rm -sf dbt
- Пересоздание и запуск контейнера dbt: docker-compose up -d dbt
- Пересоздание образа dbt: docker-compose build dbt
- Обновление контейнера и его запуск:
  - PowerShell: docker-compose rm -sf dbt; docker-compose build dbt; docker-compose up -d dbt
  - Bash: docker-compose rm -sf dbt && docker-compose build dbt && docker-compose up -d dbt
- Перейти в контейнер и запустить bash команды: 
> - docker-compose exec dbt bash
> - docker exec -it dwh_dbt bash
- Пересборка всех образов: docker-compose up -d --build
- Сборка всех образов: docker-compose build
- Удаление всех образов: ```docker rmi $(docker-compose config | grep "image:" | awk '{print $2}' | sort | uniq)```
- Остановка и удаление всех контейнеров: docker-compose down
- Запуск всех контейнеров: docker-compose up -d

## Локальный проект
- Установка библиотек Python: cd dbt; pip install -r requirements.txt

## Команды dbt
- Запуск build: 
> - для локального проекта: dbt build --target local
> - для контейнера docker: exec -it dwh_dbt dbt build --target container
- Обновление документации: 
> - для локального проекта: dbt docs generate --target local 
> - для контейнера docker: exec -it dwh_dbt dbt docs generate --target container
- Запуск сервера документации:
> - для локального проекта: dbt docs serve --port 8091 --target local
> - для контейнера docker: exec -it dwh_dbt dbt docs serve --port 8091 --host 0.0.0.0 --target container
