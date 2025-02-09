from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime, timedelta

default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

with DAG(
    'dbt_daily_build',
    default_args=default_args,
    description='A DAG to run dbt build daily',
    schedule_interval='0 * * * *',  # Запуск каждый час
    start_date=datetime(2023, 1, 1),
    catchup=False,
) as dag:

    dbt_build = BashOperator(
        task_id='dbt_build',
        bash_command='docker exec dwh_dbt dbt build --target container',
        dag=dag,
    )

    dbt_build