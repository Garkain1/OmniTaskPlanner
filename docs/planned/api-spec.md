| [**English**](#english) | [**Deutsch**](#german) | [**Русский**](#russian) |
|:-----------------------:|:----------------------:|:-----------------------:|

---

# <span id="english">**OmniTaskPlanner – API Specification**</span>

This document contains **all planned endpoints** for **OmniTaskPlanner**, including **CRUD operations, bulk updates, lazy loading, filtering, and authentication**.

---

### **📌 1. Authentication (`/auth/`)**
| Method  | Endpoint          | Description                       | Implementation Status |
|---------|-------------------|-----------------------------------|:---------------------:|
| `POST`  | `/auth/register/` | Registration of a new user        |           ❌           |
| `POST`  | `/auth/login/`    | Login (JWT tokens)                |           ❌           |
| `POST`  | `/auth/refresh/`  | Refresh `access` token            |           ❌           |
| `POST`  | `/auth/logout/`   | Logout (clears `refresh` token)   |           ❌           |
| `GET`   | `/users/me/`      | Retrieve current user information |           ❌           |
| `PATCH` | `/users/me/`      | Update user data                  |           ❌           |

---

### **📌 2. Tasks (`/tasks/`)**
| Method  | Endpoint                                | Description                         | Access         | Implementation Status |
|---------|-----------------------------------------|-------------------------------------|----------------|:---------------------:|
| `GET`   | `/tasks/`                               | **List of user's root tasks**       | Own tasks only |           ❌           |
| `POST`  | `/tasks/`                               | **Create a new task**               | Own tasks only |           ❌           |
| `GET`   | `/tasks/{id}/`                          | **Retrieve task details**           | Own tasks only |           ❌           |
| `PATCH` | `/tasks/{id}/`                          | **Update a task**                   | Own tasks only |           ❌           |
| `GET`   | `/tasks/{id}/?fields=subtasks,progress` | **Retrieve specific task fields**   | Own tasks only |           ❌           |
| `GET`   | `/tasks/{id}/full`                      | **Load the full version of a task** | Own tasks only |           ❌           |

---

### **📌 3. Bulk Operations (`/tasks/bulk/`)**
| Method  | Endpoint              | Description              | Access         | Implementation Status |
|---------|-----------------------|--------------------------|----------------|:---------------------:|
| `PATCH` | `/tasks/bulk-update/` | **Bulk update of tasks** | Own tasks only |           ❌           |

---

### **📌 4. Dynamic Loading (`/tasks/available_ids/`)**
| Method | Endpoint                                              | Description                                           | Access         | Implementation Status |
|--------|-------------------------------------------------------|-------------------------------------------------------|----------------|:---------------------:|
| `GET`  | `/tasks/available_ids/?view=moscow`                   | **List of task IDs related to a view**                | Own tasks only |           ❌           |
| `GET`  | `/tasks/available_ids/?view=to-do&offset=50&limit=50` | **Paginated loading of task IDs in the To-Do List**   | Own tasks only |           ❌           |
| `GET`  | `/tasks/?ids=[...]`                                   | **Request missing tasks by IDs**                      | Own tasks only |           ❌           |
| `GET`  | `/tasks/?ids=[...]?fields=subtasks,progress`          | **Request missing tasks by IDs with specific fields** | Own tasks only |           ❌           |

---

### **📌 5. Subtasks (`/tasks/{id}/subtasks/`)**
| Method | Endpoint                        | Description                            | Access         | Implementation Status |
|--------|---------------------------------|----------------------------------------|----------------|:---------------------:|
| `GET`  | `/tasks/{id}/subtasks/`         | **List of subtasks for a task**        | Own tasks only |           ❌           |
| `GET`  | `/tasks/{id}/subtasks/?depth=1` | **Load subtasks up to `depth` levels** | Own tasks only |           ❌           |

---

### **📌 6. Categories and Tags (`/categories/`, `/tags/`)**
| Method  | Endpoint                         | Description                          | Access         | Implementation Status |
|---------|----------------------------------|--------------------------------------|----------------|:---------------------:|
| `GET`   | `/categories/`                   | **List of categories**               | Own tasks only |           ❌           |
| `POST`  | `/categories/`                   | **Create a category**                | Own tasks only |           ❌           |
| `PATCH` | `/categories/{id}/`              | **Edit a category**                  | Own tasks only |           ❌           |
| `GET`   | `/tags/`                         | **List of tags**                     | Own tasks only |           ❌           |
| `POST`  | `/tags/`                         | **Create a tag**                     | Own tasks only |           ❌           |
| `GET`   | `/tasks/?category_id=3&tag=work` | **Filter tasks by category and tag** | Own tasks only |           ❌           |

---

### **📌 7. Reports and Statistics (`/tasks/stats/`)**
| Method | Endpoint           | Description                                                     | Implementation Status |
|--------|--------------------|-----------------------------------------------------------------|:---------------------:|
| `GET`  | `/tasks/stats/`    | **Task statistics (`done`, `in_progress`)**                     |           ❌           |
| `GET`  | `/tasks/activity/` | **Activity feed (which tasks were changed, by whom, and when)** |           ❌           |

---

### **📌 8. System Endpoints (`/health/`, `/version/`)**
| Method | Endpoint    | Description                          | Implementation Status |
|--------|-------------|--------------------------------------|:---------------------:|
| `GET`  | `/health/`  | **Service health check**             |           ❌           |
| `GET`  | `/version/` | **Retrieve API version (for CI/CD)** |           ❌           |

---

🔥 **📌 Summary: Fully designed API for OmniTaskPlanner!** 🚀  
✅ **Bulk operations** – `bulk-update`, `bulk-delete`.  
✅ **Dynamic loading** – `available_ids`, `ids=[...]`.  
✅ **Flexible representations** – `fields=subtasks,progress`.  
✅ **Security and authentication** – `JWT`, `permissions`.  
✅ **Filtering and categories** – `category_id`, `tag`.

---

# <span id="german">**OmniTaskPlanner – API-Spezifikation**</span>

Dieses Dokument enthält **alle geplanten Endpunkte** für **OmniTaskPlanner**, einschließlich **CRUD-Operationen, Massenaktualisierungen, Lazy Loading, Filterung und Authentifizierung**.

---

### **📌 1. Authentifizierung (`/auth/`)**
| Methode | Endpunkt          | Beschreibung                                    | Implementierungsstatus |
|---------|-------------------|-------------------------------------------------|:----------------------:|
| `POST`  | `/auth/register/` | Registrierung eines neuen Benutzers             |           ❌            |
| `POST`  | `/auth/login/`    | Anmeldung (JWT-Tokens)                          |           ❌            |
| `POST`  | `/auth/refresh/`  | Aktualisierung des `access`-Tokens              |           ❌            |
| `POST`  | `/auth/logout/`   | Abmeldung (löscht das `refresh`-Token)          |           ❌            |
| `GET`   | `/users/me/`      | Abruf der Informationen des aktuellen Benutzers |           ❌            |
| `PATCH` | `/users/me/`      | Aktualisierung der Benutzerdaten                |           ❌            |

---

### **📌 2. Aufgaben (`/tasks/`)**
| Methode | Endpunkt                                | Beschreibung                                    | Zugriff    | Implementierungsstatus |
|---------|-----------------------------------------|-------------------------------------------------|------------|:----------------------:|
| `GET`   | `/tasks/`                               | **Liste der Hauptaufgaben des Benutzers**       | Nur eigene |           ❌            |
| `POST`  | `/tasks/`                               | **Erstellen einer neuen Aufgabe**               | Nur eigene |           ❌            |
| `GET`   | `/tasks/{id}/`                          | **Abruf der Aufgabendetails**                   | Nur eigene |           ❌            |
| `PATCH` | `/tasks/{id}/`                          | **Aktualisierung einer Aufgabe**                | Nur eigene |           ❌            |
| `GET`   | `/tasks/{id}/?fields=subtasks,progress` | **Abruf bestimmter Felder der Aufgabe**         | Nur eigene |           ❌            |
| `GET`   | `/tasks/{id}/full`                      | **Laden der vollständigen Version der Aufgabe** | Nur eigene |           ❌            |

---

### **📌 3. Massenoperationen (`/tasks/bulk/`)**
| Methode | Endpunkt              | Beschreibung                          | Zugriff    | Implementierungsstatus |
|---------|-----------------------|---------------------------------------|------------|:----------------------:|
| `PATCH` | `/tasks/bulk-update/` | **Massenaktualisierung von Aufgaben** | Nur eigene |           ❌            |

---

### **📌 4. Dynamisches Nachladen (`/tasks/available_ids/`)**
| Methode | Endpunkt                                              | Beschreibung                                                           | Zugriff    | Implementierungsstatus |
|---------|-------------------------------------------------------|------------------------------------------------------------------------|------------|:----------------------:|
| `GET`   | `/tasks/available_ids/?view=moscow`                   | **Liste der Aufgaben-IDs, die einer Ansicht zugeordnet sind**          | Nur eigene |           ❌            |
| `GET`   | `/tasks/available_ids/?view=to-do&offset=50&limit=50` | **Seitenweises Laden der Aufgaben-IDs in der To-Do-Liste**             | Nur eigene |           ❌            |
| `GET`   | `/tasks/?ids=[...]`                                   | **Abfrage fehlender Aufgaben anhand von IDs**                          | Nur eigene |           ❌            |
| `GET`   | `/tasks/?ids=[...]?fields=subtasks,progress`          | **Abfrage fehlender Aufgaben anhand von IDs mit spezifischen Feldern** | Nur eigene |           ❌            |

---

### **📌 5. Unteraufgaben (`/tasks/{id}/subtasks/`)**
| Methode | Endpunkt                        | Beschreibung                                          | Zugriff    | Implementierungsstatus |
|---------|---------------------------------|-------------------------------------------------------|------------|:----------------------:|
| `GET`   | `/tasks/{id}/subtasks/`         | **Liste der Unteraufgaben einer Aufgabe**             | Nur eigene |           ❌            |
| `GET`   | `/tasks/{id}/subtasks/?depth=1` | **Nachladen von Unteraufgaben bis zu `depth` Ebenen** | Nur eigene |           ❌            |

---

### **📌 6. Kategorien und Tags (`/categories/`, `/tags/`)**
| Methode | Endpunkt                         | Beschreibung                                        | Zugriff    | Implementierungsstatus |
|---------|----------------------------------|-----------------------------------------------------|------------|:----------------------:|
| `GET`   | `/categories/`                   | **Liste der Kategorien**                            | Nur eigene |           ❌            |
| `POST`  | `/categories/`                   | **Erstellen einer Kategorie**                       | Nur eigene |           ❌            |
| `PATCH` | `/categories/{id}/`              | **Bearbeiten einer Kategorie**                      | Nur eigene |           ❌            |
| `GET`   | `/tags/`                         | **Liste der Tags**                                  | Nur eigene |           ❌            |
| `POST`  | `/tags/`                         | **Erstellen eines Tags**                            | Nur eigene |           ❌            |
| `GET`   | `/tasks/?category_id=3&tag=work` | **Filterung von Aufgaben nach Kategorien und Tags** | Nur eigene |           ❌            |

---

### **📌 7. Berichte und Statistiken (`/tasks/stats/`)**
| Methode | Endpunkt           | Beschreibung                                                               | Implementierungsstatus |
|---------|--------------------|----------------------------------------------------------------------------|:----------------------:|
| `GET`   | `/tasks/stats/`    | **Statistiken zu Aufgaben (`done`, `in_progress`)**                        |           ❌            |
| `GET`   | `/tasks/activity/` | **Aktivitätsprotokoll (welche Aufgaben wann und von wem geändert wurden)** |           ❌            |

---

### **📌 8. Systemendpunkte (`/health/`, `/version/`)**
| Methode | Endpunkt    | Beschreibung                              | Implementierungsstatus |
|---------|-------------|-------------------------------------------|:----------------------:|
| `GET`   | `/health/`  | **Überprüfung der Service-Verfügbarkeit** |           ❌            |
| `GET`   | `/version/` | **Abruf der API-Version (für CI/CD)**     |           ❌            |

---

🔥 **📌 Zusammenfassung: Vollständig ausgearbeitete API für OmniTaskPlanner!** 🚀  
✅ **Massenoperationen** – `bulk-update`, `bulk-delete`.  
✅ **Dynamisches Nachladen** – `available_ids`, `ids=[...]`.  
✅ **Flexible Darstellungen** – `fields=subtasks,progress`.  
✅ **Sicherheit und Authentifizierung** – `JWT`, `permissions`.  
✅ **Filterung und Kategorien** – `category_id`, `tag`.

---

# <span id="russian">**OmniTaskPlanner – API-спецификация**</span>

Этот документ содержит **все запланированные эндпоинты** для **OmniTaskPlanner**, включая **CRUD-операции, массовые обновления, ленивую подгрузку, фильтрацию и аутентификацию**.

---

## **📌 1. Аутентификация (`/auth/`)**  
| Метод   | Эндпоинт          | Описание                                    | Статус реализации |
|---------|-------------------|---------------------------------------------|:-----------------:|
| `POST`  | `/auth/register/` | Регистрация нового пользователя             |         ❌         |
| `POST`  | `/auth/login/`    | Авторизация (JWT-токены)                    |         ❌         |
| `POST`  | `/auth/refresh/`  | Обновление `access`-токена                  |         ❌         |
| `POST`  | `/auth/logout/`   | Выход (чистит `refresh`-токен)              |         ❌         |
| `GET`   | `/users/me/`      | Получение информации о текущем пользователе |         ❌         |
| `PATCH` | `/users/me/`      | Обновление данных пользователя              |         ❌         |

---

## **📌 2. Задачи (`/tasks/`)**  
| Метод   | Эндпоинт                                | Описание                               | Доступ      | Статус реализации |
|---------|-----------------------------------------|----------------------------------------|-------------|:-----------------:|
| `GET`   | `/tasks/`                               | **Список корневых задач пользователя** | Только свои |         ❌         |
| `POST`  | `/tasks/`                               | **Создать новую задачу**               | Только свои |         ❌         |
| `GET`   | `/tasks/{id}/`                          | **Получить данные о задаче**           | Только свои |         ❌         |
| `PATCH` | `/tasks/{id}/`                          | **Обновить задачу**                    | Только свои |         ❌         |
| `GET`   | `/tasks/{id}/?fields=subtasks,progress` | **Получить конкретные поля задачи**    | Только свои |         ❌         |
| `GET`   | `/tasks/{id}/full`                      | **Загрузить полную версию задачи**     | Только свои |         ❌         |

---

## **📌 3. Массовые операции (`/tasks/bulk/`)**  
| Метод   | Эндпоинт              | Описание                      | Доступ      | Статус реализации |
|---------|-----------------------|-------------------------------|-------------|:-----------------:|
| `PATCH` | `/tasks/bulk-update/` | **Массовое обновление задач** | Только свои |         ❌         |

---

## **📌 4. Динамическая подгрузка (`/tasks/available_ids/`)**  
| Метод | Эндпоинт                                              | Описание                                         | Доступ      | Статус реализации |
|-------|-------------------------------------------------------|--------------------------------------------------|-------------|:-----------------:|
| `GET` | `/tasks/available_ids/?view=moscow`                   | **Список ID задач, относящихся к представлению** | Только свои |         ❌         |
| `GET` | `/tasks/available_ids/?view=to-do&offset=50&limit=50` | **Постраничная загрузка ID задач в To-Do List**  | Только свои |         ❌         |
| `GET` | `/tasks/?ids=[...]`                                   | **Запрос недостающих задач по ID**               | Только свои |         ❌         |
| `GET` | `/tasks/?ids=[...]?fields=subtasks,progress`          | **Запрос недостающих задач по ID c полями**      | Только свои |         ❌         |

---

## **📌 5. Подзадачи (`/tasks/{id}/subtasks/`)**  
| Метод | Эндпоинт                        | Описание                                  | Доступ      | Статус реализации |
|-------|---------------------------------|-------------------------------------------|-------------|:-----------------:|
| `GET` | `/tasks/{id}/subtasks/`         | **Список подзадач для задачи**            | Только свои |         ❌         |
| `GET` | `/tasks/{id}/subtasks/?depth=1` | **Подгрузка подзадач на `depth` уровней** | Только свои |         ❌         |

---

## **📌 6. Категории и теги (`/categories/`, `/tags/`)**  
| Метод   | Эндпоинт                         | Описание                                   | Доступ      | Статус реализации |
|---------|----------------------------------|--------------------------------------------|-------------|:-----------------:|
| `GET`   | `/categories/`                   | **Список категорий**                       | Только свои |         ❌         |
| `POST`  | `/categories/`                   | **Создать категорию**                      | Только свои |         ❌         |
| `PATCH` | `/categories/{id}/`              | **Редактировать категорию**                | Только свои |         ❌         |
| `GET`   | `/tags/`                         | **Список тегов**                           | Только свои |         ❌         |
| `POST`  | `/tags/`                         | **Создать тег**                            | Только свои |         ❌         |
| `GET`   | `/tasks/?category_id=3&tag=work` | **Фильтрация задач по категориям и тегам** | Только свои |         ❌         |

---

## **📌 7. Отчёты и статистика (`/tasks/stats/`)**  
| Метод | Эндпоинт           | Описание                                                  | Статус реализации |
|-------|--------------------|-----------------------------------------------------------|:-----------------:|
| `GET` | `/tasks/stats/`    | **Статистика по задачам (`done`, `in_progress`)**         |         ❌         |
| `GET` | `/tasks/activity/` | **Лента действий (какие задачи изменялись, кем и когда)** |         ❌         |

---

## **📌 8. Системные эндпоинты (`/health/`, `/version/`)**  
| Метод | Эндпоинт    | Описание                               | Статус реализации |
|-------|-------------|----------------------------------------|:-----------------:|
| `GET` | `/health/`  | **Проверка работоспособности сервиса** |         ❌         |
| `GET` | `/version/` | **Получение версии API (для CI/CD)**   |         ❌         |

---

🔥 **📌 Итог: Полностью проработанный API для OmniTaskPlanner!** 🚀  
✅ **Массовые операции** – `bulk-update`, `bulk-delete`.  
✅ **Динамическая подгрузка** – `available_ids`, `ids=[...]`.  
✅ **Гибкие представления** – `fields=subtasks,progress`.  
✅ **Безопасность и аутентификация** – `JWT`, `permissions`.  
✅ **Фильтрация и категории** – `category_id`, `tag`.