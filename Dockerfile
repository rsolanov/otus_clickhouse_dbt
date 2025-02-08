# Используем официальный образ PostgreSQL
FROM postgres:13

# Устанавливаем переменные окружения
ENV POSTGRES_USER=default
ENV POSTGRES_PASSWORD=default
ENV POSTGRES_DB=NorthWind

# Копируем скрипты инициализации
COPY northwind.sql /docker-entrypoint-initdb.d/01-northwind.sql
COPY init_airflow_db.sql /docker-entrypoint-initdb.d/02-init_airflow_db.sql

# Устанавливаем права на выполнение скриптов
RUN chmod a+r /docker-entrypoint-initdb.d/*