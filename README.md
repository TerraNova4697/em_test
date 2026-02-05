# Nginx + Backend Docker Project

## Описание проекта

Простой проект с двумя сервисами:

- **backend** — HTTP-сервер на Python, который возвращает текст `Hello from Effective Mobile!`
- **nginx** — обратный прокси, который принимает HTTP-запросы и перенаправляет их на backend

### Архитектура (текстовая схема)

[Client] ---> [Nginx] ---> [Backend]

- Клиент отправляет HTTP-запрос на Nginx (порт 80)
- Nginx проксирует запрос на backend, добавляя необходимые заголовки
- Backend возвращает текст, Nginx отдаёт его клиенту
- HEALTHCHECK проверяет, что оба сервиса живы и функционикуют (nginx - нужный порт слушает, backend - отдает правильный текст)

---

## Используемые технологии

- Docker, Docker Compose
- Python 3.12 (backend)
- Nginx (обратный прокси)
- Alpine Linux
- Bash для healthcheck
- PowerShell (для Windows healthcheck, при необходимости)

---

## Инструкция по запуску

1. Клонируем репозиторий:

    ```bash
    git clone <URL_REPO> && cd <project_folder>
    ```

2. Подготовка окружения (если .env файла еще нет):

   ```bash
   mv env_example .env
   ```

   Подставить нужные значения (опционально)

3. Запускаем контейнеры через Docker Compose:

    ```bash
    docker compose up --build -d
    ```

4. Проверяем, что контейнеры запущены:

    ```bash
    docker ps
    ```

При последующих запусках просто:

```bash
docker compose up -d 
```

## Проверка работоспособности

1. Сделать скрипт проверки исполняемым

    ```bash
    chmod +x tests/test_service.sh
    ```

2. Запустить

    ```bash
    ./tests/test_service.sh
    ```
