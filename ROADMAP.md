| [**English**](#english) | [**Deutsch**](#german) | [**Русский**](#russian) |
|:-----------------------:|:----------------------:|:-----------------------:|

---

# <span id="english">OmniTaskPlanner – Roadmap</span>

This document contains a detailed development plan for OmniTaskPlanner – a flexible task manager that allows visualizing the same tasks in different methodologies (To-Do, Kanban, Eisenhower Matrix, MoSCoW, Time Blocking, etc.).

## 📌 v0.1: Initial Setup (1-2 weeks)
- [ ] Deploy PostgreSQL and set up the development environment.
- [ ] Write `openapi.yaml`, validate it (using `Swagger Editor`, `swagger-cli`), and test it through a mock server.
- [ ] Generate models and API based on `openapi.yaml`.
- [ ] Verify the database structure: indexes, relationships, `ON DELETE`, `UNIQUE`, and `CHECK` constraints.
- [ ] Set up JWT authentication (`/auth/register/`, `/auth/login/`, `/auth/logout/`, `/auth/refresh/`).
- [ ] Implement the basic API `/users/me/` for retrieving information about the current user.

## 📌 v0.2: API Generation, Models, and Admin Panel Setup (2-3 weeks)
- [ ] Automatically generate API for `/tasks/`, `/categories/`, `/tags/`.
- [ ] Refine models and serializers manually.
- [ ] Configure Django Admin for managing users, tasks, and categories.
- [ ] Add nested subtasks (`parent_task_id`).
- [ ] Implement `PATCH /tasks/bulk-update/` for bulk updates.
- [ ] Update `openapi.yaml` after manual modifications.

## 📌 v0.3: Subtasks, Drag & Drop, and Frontend (3-4 weeks)
- [ ] Implement support for nested subtasks (`parent_task_id`).
- [ ] Add API for subtasks (`GET /tasks/{id}/subtasks/`, `PATCH /tasks/{id}/subtasks/`).
- [ ] Implement task sorting (`sort_order`) and Drag & Drop support.
- [ ] Add API for dynamic loading (`/tasks/available_ids/`).
- [ ] Develop a basic frontend (React/Vue) for task management.
- [ ] Connect the frontend to the API (`fetch`, `axios`).
- [ ] Update `openapi.yaml` after manual modifications.

## 📌 v0.4: Filtering, Categories, and Tags (3-4 weeks)
- [ ] Add API for filtering tasks by `category_id`, `tag`, `status`, `importance`.
- [ ] Implement API `/categories/` and `/tags/` for grouping tasks.
- [ ] Refine the categories API (`GET /categories/`, `POST /categories/`).
- [ ] Implement the ability to quickly change task categories (`PATCH /tasks/{id}/`).
- [ ] Enhance the frontend: adding filters, categories, and tags.
- [ ] Update `openapi.yaml` after manual modifications.

## 📌 v0.5: Time Blocking, PWA, and Offline Mode (4-6 weeks)
- [ ] Implement the `TimeBlock` model for time-based task scheduling.
- [ ] Add API for time blocks (`GET /timeblocks/`, `POST /timeblocks/`).
- [ ] Develop a calendar interface for Time Blocking in the frontend.
- [ ] Implement a PWA version with offline mode (IndexedDB + API synchronization).
- [ ] Set up automatic synchronization of changes when the connection is restored.
- [ ] Update `openapi.yaml` after manual modifications.

## 📌 v0.6: Roles, Access Rights, and Security (2-3 weeks)
- [ ] Restrict user access to tasks (users only see their own).
- [ ] Add support for a role-based model (`auth_group_permissions`).
- [ ] Set up API security (`permissions_classes`, `RBAC`).
- [ ] Conduct a security audit (CSRF, XSS, SQL Injection).
- [ ] Update `openapi.yaml` after manual modifications.

## 📌 v0.7: Optimization, Testing, and Final Adjustments (2-4 weeks)
- [ ] Optimize database queries (`select_related`, `prefetch_related`).
- [ ] Refine the statistics API (`GET /tasks/stats/`, `/tasks/activity/`).
- [ ] Finalize the frontend: UI/UX improvements, bug fixes.
- [ ] Finalize the documentation (`openapi.yaml`, Swagger, ReDoc).
- [ ] Conduct load testing for the API.

## 📌 v1.0: MVP Release 🎉
- [ ] Deploy the production server (AWS, Docker, CI/CD).
- [ ] Complete testing and bug fixes.
- [ ] Collect feedback.

---

### 🔥 What's Next?
After the v1.0 release, the project will be further developed based on user feedback.

---

# <span id="german">OmniTaskPlanner – Roadmap</span>

# OmniTaskPlanner – Roadmap

Dieses Dokument enthält einen detaillierten Entwicklungsplan für OmniTaskPlanner – einen flexiblen Task-Manager, der es ermöglicht, dieselben Aufgaben in verschiedenen Methodologien zu visualisieren (To-Do, Kanban, Eisenhower-Matrix, MoSCoW, Time Blocking usw.).

## 📌 v0.1: Initial Setup (1-2 Wochen)
- [ ] PostgreSQL bereitstellen und die Entwicklungsumgebung einrichten.
- [ ] `openapi.yaml` erstellen, auf Validität prüfen (mit `Swagger Editor`, `swagger-cli`), und über einen Mock-Server testen.
- [ ] Modelle und API auf Basis von `openapi.yaml` generieren.
- [ ] Die Datenbankstruktur überprüfen: Indizes, Beziehungen, `ON DELETE`, `UNIQUE` und `CHECK`-Beschränkungen.
- [ ] JWT-Authentifizierung einrichten (`/auth/register/`, `/auth/login/`, `/auth/logout/`, `/auth/refresh/`).
- [ ] Die grundlegende API `/users/me/` implementieren, um Informationen über den aktuellen Benutzer abzurufen.

## 📌 v0.2: API-Generierung, Modelle und Einrichtung des Admin-Panels (2-3 Wochen)
- [ ] Automatisch die API für `/tasks/`, `/categories/`, `/tags/` generieren.
- [ ] Modelle und Serializer manuell verfeinern.
- [ ] Django Admin für die Verwaltung von Benutzern, Aufgaben und Kategorien konfigurieren.
- [ ] Verschachtelte Unteraufgaben hinzufügen (`parent_task_id`).
- [ ] Implementiere `PATCH /tasks/bulk-update/` für Massenaktualisierungen.
- [ ] Aktualisiere `openapi.yaml` nach manuellen Änderungen.

## 📌 v0.3: Unteraufgaben, Drag & Drop und Frontend (3-4 Wochen)
- [ ] Unterstützung für verschachtelte Unteraufgaben implementieren (`parent_task_id`).
- [ ] API für Unteraufgaben hinzufügen (`GET /tasks/{id}/subtasks/`, `PATCH /tasks/{id}/subtasks/`).
- [ ] Aufgabensortierung (`sort_order`) und Drag & Drop-Unterstützung implementieren.
- [ ] API für dynamisches Nachladen hinzufügen (`/tasks/available_ids/`).
- [ ] Ein grundlegendes Frontend (React/Vue) zur Aufgabenverwaltung entwickeln.
- [ ] Das Frontend mit der API verbinden (`fetch`, `axios`).
- [ ] Aktualisiere `openapi.yaml` nach manuellen Änderungen.

## 📌 v0.4: Filterung, Kategorien und Tags (3-4 Wochen)
- [ ] API zur Filterung von Aufgaben nach `category_id`, `tag`, `status`, `importance` hinzufügen.
- [ ] API `/categories/` und `/tags/` zur Gruppierung von Aufgaben implementieren.
- [ ] Die Kategorien-API verfeinern (`GET /categories/`, `POST /categories/`).
- [ ] Die Möglichkeit zur schnellen Änderung der Kategorien von Aufgaben implementieren (`PATCH /tasks/{id}/`).
- [ ] Das Frontend verbessern: Hinzufügen von Filtern, Kategorien und Tags.
- [ ] Aktualisiere `openapi.yaml` nach manuellen Änderungen.

## 📌 v0.5: Time Blocking, PWA und Offline-Modus (4-6 Wochen)
- [ ] Das Modell `TimeBlock` für die zeitliche Planung von Aufgaben implementieren.
- [ ] API für Zeitblöcke hinzufügen (`GET /timeblocks/`, `POST /timeblocks/`).
- [ ] Eine Kalenderoberfläche für Time Blocking im Frontend entwickeln.
- [ ] Eine PWA-Version mit Offline-Modus (IndexedDB + API-Synchronisation) implementieren.
- [ ] Die automatische Synchronisation von Änderungen beim Wiederherstellen der Verbindung einrichten.
- [ ] Aktualisiere `openapi.yaml` nach manuellen Änderungen.

## 📌 v0.6: Rollen, Zugriffsrechte und Sicherheit (2-3 Wochen)
- [ ] Den Zugriff der Benutzer auf ihre Aufgaben einschränken (Benutzer sehen nur ihre eigenen).
- [ ] Unterstützung für ein rollenbasiertes Modell hinzufügen (`auth_group_permissions`).
- [ ] Die API-Sicherheit einrichten (`permissions_classes`, `RBAC`).
- [ ] Ein Sicherheitsaudit durchführen (CSRF, XSS, SQL Injection).
- [ ] Aktualisiere `openapi.yaml` nach manuellen Änderungen.

## 📌 v0.7: Optimierung, Testing und finale Anpassungen (2-4 Wochen)
- [ ] Datenbankabfragen optimieren (`select_related`, `prefetch_related`).
- [ ] Die Statistik-API überarbeiten (`GET /tasks/stats/`, `/tasks/activity/`).
- [ ] Das Frontend finalisieren: UI/UX-Verbesserungen, Bugfixes.
- [ ] Die Dokumentation finalisieren (`openapi.yaml`, Swagger, ReDoc).
- [ ] Lasttests der API durchführen.

## 📌 v1.0: MVP-Release 🎉
- [ ] Den Produktionsserver bereitstellen (AWS, Docker, CI/CD).
- [ ] Tests und Bugfixes abschließen.
- [ ] Feedback sammeln.

---

### 🔥 Was kommt als Nächstes?
Nach dem v1.0-Release wird das Projekt basierend auf dem Feedback der Benutzer weiterentwickelt.

---

# <span id="russian">OmniTaskPlanner – Roadmap</span>

Этот документ содержит детализированный план разработки OmniTaskPlanner – гибкого таск-менеджера, позволяющего визуализировать одни и те же задачи в разных методологиях (To-Do, Канбан, Матрица Эйзенхауэра, MoSCoW, Time Blocking и др.).

## 📌 v0.1: Initial Setup (1-2 недели)
- [ ] Развернуть PostgreSQL и настроить окружение разработки.
- [ ] Написать `openapi.yaml`, проверить на валидность (`Swagger Editor`, `swagger-cli`), протестировать через мок-сервер.
- [ ] Сгенерировать модели и API на основе `openapi.yaml`.
- [ ] Проверить структуру БД: индексы, связи, `ON DELETE`, `UNIQUE` и `CHECK`-ограничения.
- [ ] Настроить JWT-аутентификацию (`/auth/register/`, `/auth/login/`, `/auth/logout/`, `/auth/refresh/`).
- [ ] Реализовать базовое API `/users/me/` для получения информации о текущем пользователе.

## 📌 v0.2: Генерация API, моделей и настройка админ-панели (2-3 недели)
- [ ] Автоматически сгенерировать API `/tasks/`, `/categories/`, `/tags/`.
- [ ] Доработать модели и сериализаторы вручную.
- [ ] Настроить Django Admin для управления пользователями, задачами и категориями.
- [ ] Добавить вложенные подзадачи (`parent_task_id`).
- [ ] Реализовать `PATCH /tasks/bulk-update/` для массовых обновлений.
- [ ] Обновить `openapi.yaml` после ручных изменений.

## 📌 v0.3: Подзадачи, Drag & Drop и фронтенд (3-4 недели)
- [ ] Реализовать поддержку вложенных подзадач (`parent_task_id`).
- [ ] Добавить API подзадач (`GET /tasks/{id}/subtasks/`, `PATCH /tasks/{id}/subtasks/`).
- [ ] Реализовать сортировку задач (`sort_order`) и поддержку Drag & Drop.
- [ ] Добавить API для динамической подгрузки (`/tasks/available_ids/`).
- [ ] Разработать базовый фронтенд (React/Vue) для управления задачами.
- [ ] Подключить фронтенд к API (`fetch`, `axios`).
- [ ] Обновить `openapi.yaml` после ручных изменений.

## 📌 v0.4: Фильтрация, категории и теги (3-4 недели)
- [ ] Добавить API фильтрации задач по `category_id`, `tag`, `status`, `importance`.
- [ ] Реализовать API `/categories/` и `/tags/` для группировки задач.
- [ ] Доработать API категорий (`GET /categories/`, `POST /categories/`).
- [ ] Реализовать возможность быстрой смены категорий у задач (`PATCH /tasks/{id}/`).
- [ ] Доработать фронтенд: добавление фильтров, категорий и тегов.
- [ ] Обновить `openapi.yaml` после ручных изменений.

## 📌 v0.5: Time Blocking, PWA и офлайн-режим (4-6 недель)
- [ ] Реализовать модель `TimeBlock` для планирования задач по времени.
- [ ] Добавить API тайм-блоков (`GET /timeblocks/`, `POST /timeblocks/`).
- [ ] Разработать календарный интерфейс для Time Blocking во фронтенде.
- [ ] Реализовать PWA-версию с офлайн-режимом (IndexedDB + синхронизация API).
- [ ] Настроить автоматическую синхронизацию изменений при восстановлении соединения.
- [ ] Обновить `openapi.yaml` после ручных изменений.

## 📌 v0.6: Роли, права доступа и безопасность (2-3 недели)
- [ ] Ограничить доступ пользователей к задачам (пользователь видит только свои).
- [ ] Добавить поддержку ролевой модели (`auth_group_permissions`).
- [ ] Настроить защиту API (`permissions_classes`, `RBAC`).
- [ ] Провести аудит безопасности (CSRF, XSS, SQL Injection).
- [ ] Обновить `openapi.yaml` после ручных изменений.

## 📌 v0.7: Оптимизация, тестирование и финальные доработки (2-4 недели)
- [ ] Оптимизировать запросы к БД (`select_related`, `prefetch_related`).
- [ ] Доработать API статистики (`GET /tasks/stats/`, `/tasks/activity/`).
- [ ] Финализировать фронтенд: UI/UX улучшения, исправление багов.
- [ ] Финализировать документацию (`openapi.yaml`, Swagger, ReDoc).
- [ ] Провести нагрузочное тестирование API.

## 📌 v1.0: MVP-релиз 🎉
- [ ] Развернуть продакшн-сервер (AWS, Docker, CI/CD).
- [ ] Завершить тестирование и баг-фиксы.
- [ ] Собрать обратную связь.

---

### 🔥 Что дальше?
После релиза v1.0 проект будет дорабатываться в зависимости от обратной связи пользователей.
