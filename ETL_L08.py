
from datetime import datetime
from airflow import DAG
from airflow.operators.python_operator import PythonOperator
import pandas as pd
from sqlalchemy import create_engine

# Функция для чтения данных из CSV файлов
def extract_data(file_path):
    return pd.read_csv(file_path)


# Функция для трансформации данных
def transform_data(**kwargs):
    # Получение датафреймов из контекста
    boking_df = kwargs['task_instance'].xcom_pull(task_ids='extract_boking')
    client_df = kwargs['task_instance'].xcom_pull(task_ids='extract_client')
    hotel_df = kwargs['task_instance'].xcom_pull(task_ids='extract_hotel')

    # Объединение всех таблиц в одну
    merged_df = pd.merge(booking_df, client_df, on='client_id', how='left')
    merged_df = pd.merge(merged_df, hotel_df, on='hotel_id', how='left')

    # Приведение даты к одному виду
    merged_df['booking_date'] = pd.to_datetime(merged_df['booking_date'])

    # Удаление невалидных колонок
    invalid_columns = ['invalid_column']  # Список невалидных колонок для удаления
    merged_df = merged_df.drop(columns=invalid_columns, errors='ignore')

    # Приведение всех валют к одной
    # В этом примере приводим все валюты к USD
    merged_df['currency'] = 'USD'

    return merged_df


def load_data_to_database(**kwargs):
    transformed_df = kwargs['task_instance'].xcom_pull(task_ids='transform_data')

    # Указываем параметры подключения к базе данных MySQL
    db_username = 'annvorosh'
    db_password = '175'
    db_host = 'localhost'
    db_port = '3306'
    db_name = 'my_database'


    # Создаем строку подключения к базе данных MySQL
    engine = create_engine(f'mysql+pymysql://{db_username}:{db_password}@{db_host}:{db_port}/{db_name}')

    # Загружаем данные в базу данных
    transformed_df.to_sql('my_table', engine, if_exists='replace', index=False)

# Определение оператора для загрузки данных в базу данных
load_data_to_database = PythonOperator(
    task_id='load_data_to_database',
    python_callable=load_data_to_database,
    provide_context=True,
    dag=dag,
)


# Определение аргументов DAG
default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime(2024, 1, 1),
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

# Создание DAG
dag = DAG(
    'etl_process',
    default_args=default_args,
    description='A DAG to perform ETL process',
    schedule_interval='* * * * *',
)

# Операторы для извлечения данных из CSV файлов
extract_boking = PythonOperator(
    task_id='extract_boking',
    python_callable=extract_data,
    op_kwargs={'file_path': '/Users/annvorosh/Documents/GB/ETL/ETL_L08/boking.csv'},
    dag=dag,
)

extract_client = PythonOperator(
    task_id='extract_client',
    python_callable=extract_data,
    op_kwargs={'file_path': '/Users/annvorosh/Documents/GB/ETL/ETL_L08/client.csv'},
    dag=dag,
)

extract_hotel = PythonOperator(
    task_id='extract_hotel',
    python_callable=extract_data,
    op_kwargs={'file_path': '/Users/annvorosh/Documents/GB/ETL/ETL_L08/hotel.csv'},
    dag=dag,
)

# Оператор для трансформации данных
transform_data = PythonOperator(
    task_id='transform_data',
    python_callable=transform_data,
    provide_context=True,
    dag=dag,
)

# Оператор для загрузки данных в базу данных
load_data_to_database = PythonOperator(
    task_id='load_data_to_database',
    python_callable=load_data_to_database,
    provide_context=True,
    dag=dag,
)

# Определение порядка выполнения задач
extract_boking >> extract_client >> extract_hotel >> transform_data >> load_data_to_database