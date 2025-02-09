# Развертывание проекта
- docker-compose build postgres
- docker-compose up -d

# Комманды для поддержки инфраструктуры
## Docker Containers
- Остановка и удаление контейнера dbt: docker-compose rm -sf dbt
- Пересоздание и запуск контейнера dbt: docker-compose up -d dbt
- Пересоздание образа dbt: docker-compose build dbt
- Обновление контейнера и его запуск:
  - PowerShell: docker-compose rm -sf dbt; docker-compose build dbt; docker-compose up -d dbt
  - Bash: docker-compose rm -sf dbt && docker-compose build dbt && docker-compose up -d dbt
- Перейти в контейнер и запустить bash команды: docker-compose exec dbt bash

## Локальный проект
- Установка библиотек Python: cd dbt; pip install -r requirements.txt