## Развертывание проекта
- docker-compose build postgres
- docker-compose up -d


## Комманды для поддержки инфраструктуры
- Остановка и удаление контейнера dbt: docker-compose rm -sf dbt
- Пересоздание и запуск контейнера dbt: docker-compose up -d dbt
