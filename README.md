# Развертывание проекта
- docker-compose build postgres
- docker-compose build dbt
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
- Пересборка всех образов: docker-compose up -d --build
- Сборка всех образов: docker-compose build
- Удаление всех образов: ```docker rmi $(docker-compose config | grep "image:" | awk '{print $2}' | sort | uniq)```
- Остановка и удаление всех контейнеров: docker-compose down
- Запуск всех контейнеров: docker-compose up -d

## Локальный проект
- Установка библиотек Python: cd dbt; pip install -r requirements.txt

## Команды dbt
- Запуск build для локального проекта: dbt build --target local
- запуск build для контейнера: dbt build --target container