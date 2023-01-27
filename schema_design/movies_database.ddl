CREATE SCHEMA IF NOT EXISTS content;

--Создаем базу film_work
CREATE TABLE IF NOT EXISTS content.film_work (
    id uuid PRIMARY KEY,
    title TEXT NOT NULL,
    description TEXT,
    creation_date DATE,
    rating FLOAT,
    type TEXT NOT NULL,
    created timestamp with time zone,
    modified timestamp with time zone
);

--Привязываем search_path content к роли app
ALTER ROLE app SET search_path TO content.public;

-- Устанавливаем расширения для генерации UUID
CREATE EXTENSION "uuid-ossp";

-- Генерируем данные в интервале с 1900 по 2021 год с шагом в час. В итоге сгенерируется 1060681 записей
INSERT INTO content.film_work (id, title, type, creation_date, rating) SELECT uuid_generate_v4(), 'some name', case when RANDOM() < 0.3 THEN 'movie' ELSE 'tv_show' END , date::DATE, floor(random() * 100)
FROM generate_series(
  '1900-01-01'::DATE,
  '2021-01-01'::DATE,
  '1 hour'::interval
) date;

--Создадим таблицу person, в которой будут содержаться участники фильмов
CREATE TABLE IF NOT EXISTS content.person (
    id uuid PRIMARY KEY,
    full_name TEXT NOT NULL,
    created timestamp with time zone,
    modified timestamp with time zone
);

--Создадим таблицу person_film_work, которая связывает участников с кинофильмами
CREATE TABLE IF NOT EXISTS content.person_film_work (
    id uuid PRIMARY KEY,
    film_work_id uuid NOT NULL,
    person_id uuid NOT NULL,
    role TEXT NOT NULL,
    created timestamp with time zone
);

--Создадим уникальный композитный индекс film_work_person_idx для таблицы person_film_work так, чтобы нельзя было добавить одного актёра несколько раз к одному фильму.
CREATE UNIQUE INDEX film_work_person_idx ON content.person_film_work (film_work_id, person_id);

--Создадим таблицу genre, в которой будут содержаться участники фильмов
CREATE TABLE IF NOT EXISTS content.genre (
    id uuid PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT,
    created timestamp with time zone,
    modified timestamp with time zone
);

--Создадим таблицу genre_film_work, которая связывает участников с кинофильмами
CREATE TABLE IF NOT EXISTS content.genre_film_work (
    id uuid PRIMARY KEY,
    genre_id uuid NOT NULL,
    film_id uuid NOT NULL,
    created timestamp with time zone
);
