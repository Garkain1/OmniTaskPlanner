| [**English**](#english) | [**Deutsch**](#german) | [**Русский**](#russian) |
|:-----------------------:|:----------------------:|:-----------------------:|

---

# <span id="english">**OmniTaskPlanner**</span>

**OmniTaskPlanner** is a concept for a flexible task planner that allows visualizing the same tasks using different time management and prioritization methodologies, including:  

- Classic **To-Do** (task lists)  
- **Kanban** (Trello-like view)  
- **Eisenhower Matrix** (Important/Urgent)  
- **MoSCoW** (Must, Should, Could, Won’t)  
- **Time Blocking** (Calendar)  
- **GTD**, **RICE**, and **Pomodoro**  

> **Attention!**  
> This project is currently in the planning and design stage. The features and architecture described below are planned functionalities and have not yet been **implemented**.  

---

## **Project Description**  

OmniTaskPlanner offers **a single database** to display tasks in different methodologies without duplication. The project is focused on:  

- Flexible customization of task parameters (importance, urgency, reach, confidence, effort)  
- Unified task management through categories, tags, and a role system (Admin, User)  
- A single API (based on Django REST Framework) to support web, mobile, and desktop applications  

---

## **Core Features (Planned)**  

- **A single database for different task views:**  
  - Display tasks in To-Do, Kanban, Eisenhower Matrix, MoSCoW, Time Blocking, GTD, RICE, and Pomodoro formats.  

- **Flexible task customization:**  
  - Tasks have fixed parameters (importance, urgency, reach, confidence, effort) used across different methodologies.  
  - Ability to group tasks using **categories** and **tags**.  

- **Intuitive task management:**  
  - **Drag & Drop** support in all views.  
  - Dynamic task order updates using the `sort_order` parameter (step 10 with automatic recalculation in case of overflow).  

- **Time Blocking and scheduling:**  
  - Assigning tasks to specific time slots in the calendar.  
  - Ability to copy tasks for repeated events (direct repetition is not supported).  

- **Role-based access control:**  
  - Access control using Django Permissions.  

- **Offline mode and synchronization:**  
  - Local storage of changes (IndexedDB/SQLite) with subsequent synchronization via bulk updates.  
  - Conflict detection and resolution during synchronization.  

> **Note:** All listed features are in the planning stage and may change during development.  

---

## **Technical Solutions**  

### **Backend**  

- **Django + Django REST Framework:**  
  API-first approach, custom user model, JWT authentication.  
- **PostgreSQL:**  
  Relational database with JSONB support for custom data.  
- **Access control system:**  
  Using Django Permissions (auth_group, auth_permission) for access management.  

### **Frontend**  

- **Single Page Application (React/Vue.js):**  
  Interactive UI with Drag & Drop support in all views.  
- **UI Optimization:**  
  Using `useState()`, `useMemo()`, and `useCallback()` for fast reactivity, local updates, and computed caching (e.g., RICE).  

### **DevOps and CI/CD**  

- **Docker:**  
  Containerization of all components (backend, frontend, database, Nginx).  
- **GitHub Actions:**  
  Automated testing and deployment.  
- **Planned deployment on AWS:**  
  Using AWS ECS for scaling and infrastructure management.  

---

## **Project Architecture**  

### **Main Database Entities**  

- **Task:**  
  - Supports parent tasks and subtasks (`parent_task_id`).  
  - Task parameters (importance, urgency, reach, confidence, effort).  
  - `sort_order` field for task order management (Drag & Drop).  

- **Category and Tag:**  
  - Grouping and filtering tasks by meaning and context.  

- **TimeBlock:**  
  - Assigning tasks to specific times in the calendar.  

- **Users and Roles:**  
  - Access management via a custom user model and standard Django Permissions.  

### **Task Visualization Methods**  

- **To-Do List, Kanban Board, Eisenhower Matrix, MoSCoW, Time Blocking, GTD, RICE, Pomodoro**  
  Ability to switch between different views for flexible task planning and management.  

### **Task Ordering System**  

- **sort_order:**  
  - Uses numerical values with a step of 10 for positioning.  
  - Automatic recalculation when the range overflows.  

---

## **Use Case Examples**  

1. **Personal Task Planner:**  
   - Switching between To-Do, Kanban, and Eisenhower Matrix views.  
   - Visually prioritizing tasks by importance and urgency.  
   - Time planning using Time Blocking.  

2. **Project Management:**  
   - Prioritizing tasks using MoSCoW and RICE.  

3. **Freelancer Workflow:**  
   - Grouping tasks by clients and projects.  
   - Optimized daily planning with Time Blocking.  

---

## **Development Plans and Upcoming Features**  

More details on planned functionality can be found in [features.md](docs/planned/features.md).  

- Full implementation of all task visualization methods.  
- Automated `sort_order` management and Drag & Drop support at all levels.  
- Implementation of offline mode with automatic synchronization.  
- Development of mobile and desktop applications to expand functionality.  
- Performance and security optimizations for the API.  

> **Important:** All described features are in the planning stage and may change significantly during development.  

---

## **Documentation**  

The full documentation overview is available at [docs/OVERVIEW.md](docs/OVERVIEW.md).  

---

## **Git Workflow**

We follow a structured Git workflow to maintain clarity and order in the repository.  

- **Branch Naming** → Use prefixes like `feature/`, `fix/`, `hotfix/`, etc. ([Branch Guide](docs/developers/git-branches.md)).  
- **Commit Format** → Follow the standard (`feat:`, `fix:`, `chore:`) ([Commit Guide](CONTRIBUTING.md)).  
- **Git Hooks** → Automatically installed via `dev-setup.sh`, enforcing commit format and branch naming.  

For more details, see [CONTRIBUTING.md](CONTRIBUTING.md).  

---

## **License**  

This project is distributed under the [CC BY-NC 4.0](LICENSE.md) license.  

---

> **Conclusion:**  
> OmniTaskPlanner is an ambitious project aimed at combining different task management methodologies into one flexible and scalable tool. Currently, the functionality is described conceptually, and its implementation is planned for future development stages.  

---

# <span id="german">**OmniTaskPlanner**</span>

**OmniTaskPlanner** ist ein Konzept für einen flexiblen Aufgabenplaner, der es ermöglicht, dieselben Aufgaben mit verschiedenen Methoden des Zeitmanagements und der Priorisierung zu visualisieren, darunter:  

- Klassische **To-Do-Listen**  
- **Kanban** (Trello-ähnliche Ansicht)  
- **Eisenhower-Matrix** (Wichtig/Dringend)  
- **MoSCoW** (Must, Should, Could, Won’t)  
- **Time Blocking** (Kalender)  
- **GTD**, **RICE** und **Pomodoro**  

> **Achtung!**  
> Dieses Projekt befindet sich derzeit in der Planungs- und Entwurfsphase. Die unten beschriebenen Funktionen und die Architektur sind geplante Features und wurden noch **nicht implementiert**.  

---

## **Projektbeschreibung**  

OmniTaskPlanner verwendet **eine einzige Datenbank**, um Aufgaben in verschiedenen Methoden darzustellen, ohne dass Duplikate entstehen. Das Projekt konzentriert sich auf: 

- Flexible Anpassung von Aufgabenparametern (Wichtigkeit, Dringlichkeit, Reichweite, Vertrauen, Aufwand)  
- Einheitliche Aufgabenverwaltung durch Kategorien, Tags und ein Rollensystem (Admin, User)  
- Eine einzige API (basierend auf dem Django REST Framework), um Web-, Mobile- und Desktop-Anwendungen zu unterstützen  

---

## **Geplante Hauptfunktionen**  

- **Zentrale Datenbank für verschiedene Ansichten:**  
  - Darstellung von Aufgaben als To-Do-Listen, Kanban, Eisenhower-Matrix, MoSCoW, Time Blocking, GTD, RICE und Pomodoro.  

- **Flexible Anpassung von Aufgaben:**  
  - Aufgaben haben feste Parameter (Wichtigkeit, Dringlichkeit, Reichweite, Vertrauen, Aufwand), die in verschiedenen Methoden verwendet werden.  
  - Möglichkeit zur Gruppierung durch **Kategorien** und **Tags**.  

- **Intuitive Verwaltung:**  
  - **Drag & Drop**-Unterstützung in allen Ansichten.  
  - Dynamische Aktualisierung der Reihenfolge mit dem Parameter `sort_order` (Schrittweite 10 mit automatischer Neuberechnung bei Überlauf).  

- **Time Blocking und Planung:**  
  - Zuweisung von Aufgaben zu bestimmten Zeitfenstern im Kalender.  
  - Möglichkeit, Aufgaben zu kopieren, um wiederkehrende Ereignisse zu planen (direkte Wiederholungen werden nicht unterstützt).  

- **Rechte- und Rollensystem:**  
  - Zugriffskontrolle mit Django-Berechtigungen.  

- **Offline-Modus und Synchronisation:**  
  - Lokale Speicherung von Änderungen (IndexedDB/SQLite) mit anschließender Synchronisation per Bulk-Update.  
  - Erkennung und Lösung von Synchronisationskonflikten.  

> **Wichtig:** Alle genannten Funktionen befinden sich in der Planungsphase und können sich im Laufe der Entwicklung erheblich ändern

---

## **Technische Lösungen**  

### **Backend**  

- **Django + Django REST Framework:**  
  API-First-Ansatz, benutzerdefiniertes Benutzer-Modell, JWT-Authentifizierung.  
- **PostgreSQL:**  
  Relationale Datenbank mit JSONB-Unterstützung für benutzerdefinierte Daten.  
- **Zugriffskontrollsystem:**  
  Verwendung von Django-Berechtigungen (`auth_group`, `auth_permission`) zur Rechteverwaltung.  

### **Frontend**  

- **Single Page Application (React/Vue.js):**  
  Interaktive Benutzeroberfläche mit Drag & Drop-Unterstützung in allen Ansichten.  
- **Optimierung der UI:**  
  Nutzung von `useState()`, `useMemo()` und `useCallback()`, um schnelle Reaktionen auf Änderungen zu ermöglichen, lokale Updates zu unterstützen und Berechnungen (z. B. RICE) zu cachen.  

### **DevOps und CI/CD**  

- **Docker:**  
  Containerisierung aller Komponenten (Backend, Frontend, Datenbank, Nginx).  
- **GitHub Actions:**  
  Automatisierte Tests und Deployments.  
- **Geplantes Deployment auf AWS:**  
  Nutzung von AWS ECS für Skalierung und Infrastrukturmanagement.  

---

## **Projektarchitektur**  

### **Hauptentitäten der Datenbank**  

- **Task (Aufgaben):**  
  - Unterstützung von übergeordneten Aufgaben und Unteraufgaben (`parent_task_id`).  
  - Aufgabenparameter (Wichtigkeit, Dringlichkeit, Reichweite, Vertrauen, Aufwand).  
  - `sort_order`-Feld zur Steuerung der Reihenfolge (Drag & Drop).  

- **Category (Kategorien) und Tag (Tags):**  
  - Gruppierung und Filterung von Aufgaben nach Bedeutung und Kontext.  

- **TimeBlock (Zeitblöcke):**  
  - Zuweisung von Aufgaben zu bestimmten Zeitpunkten im Kalender.  

- **Benutzer und Rollen:**  
  - Zugriffskontrolle über ein benutzerdefiniertes Modell und standardmäßige Django-Berechtigungen.  

### **Visualisierungsmodi für Aufgaben**  

- **To-Do-Liste, Kanban-Board, Eisenhower-Matrix, MoSCoW, Time Blocking, GTD, RICE, Pomodoro**  
  Möglichkeit, zwischen verschiedenen Ansichten für eine flexible Aufgabenplanung und -verwaltung zu wechseln.  

### **Reihenfolgenverwaltung von Aufgaben**  

- **sort_order:**  
  - Verwendung numerischer Werte mit einer Schrittweite von 10 zur Positionsbestimmung.  
  - Automatische Neuberechnung bei Überlauf des Wertebereichs.  

---

## **Beispielhafte Anwendungsfälle**  

1. **Persönlicher Aufgabenplaner:**  
   - Wechsel zwischen To-Do-, Kanban- und Eisenhower-Matrix-Ansichten.  
   - Visuelle Priorisierung von Aufgaben nach Wichtigkeit und Dringlichkeit.  
   - Zeitplanung mit Time Blocking.  

2. **Projektmanagement:**  
   - Priorisierung von Aufgaben mithilfe von MoSCoW und RICE.  

3. **Freelancer-Arbeitsabläufe:**  
   - Gruppierung von Aufgaben nach Kunden und Projekten.  
   - Optimierte Tagesplanung mit Time Blocking.  

---

## **Entwicklungspläne und zukünftige Funktionen**  

Detaillierte Informationen zu geplanten Funktionen finden Sie in [features.md](docs/planned/features.md).  

- Vollständige Implementierung aller Aufgabenvisualisierungsmethoden.  
- Automatisierte `sort_order`-Verwaltung und Drag & Drop-Unterstützung auf allen Ebenen.  
- Einführung eines Offline-Modus mit automatischer Synchronisation.  
- Entwicklung von mobilen und Desktop-Anwendungen zur Erweiterung des Funktionsumfangs.  
- Optimierung der Leistung und Sicherheit der API.  

> **Wichtig:** Alle beschriebenen Funktionen befinden sich in der Planungsphase und können sich während der Entwicklung erheblich ändern.  

---

## **Dokumentation**  

Die vollständige Dokumentationsübersicht ist unter [docs/OVERVIEW.md](docs/OVERVIEW.md) verfügbar.

---

## **Git-Workflow**  

Wir verwenden einen strukturierten Git-Workflow, um Klarheit und Ordnung im Repository zu gewährleisten.  

- **Benennung von Branches** → Verwenden Sie Präfixe wie `feature/`, `fix/`, `hotfix/` usw. ([Branch-Leitfaden](docs/developers/git-branches.md)).  
- **Commit-Format** → Halten Sie sich an den Standard (`feat:`, `fix:`, `chore:`) ([Commit-Leitfaden](CONTRIBUTING.md)).  
- **Git Hooks** → Werden automatisch über `dev-setup.sh` installiert und erzwingen das Commit-Format sowie die Namensgebung der Branches.  

Weitere Details finden Sie in [CONTRIBUTING.md](CONTRIBUTING.md).

---

## **Lizenz**  

Dieses Projekt wird unter der [CC BY-NC 4.0](LICENSE.md)-Lizenz veröffentlicht.  

---

> **Fazit:**  
> OmniTaskPlanner ist ein ambitioniertes Projekt, das verschiedene Methoden des Aufgabenmanagements in einem flexiblen und skalierbaren Tool vereinen soll. Derzeit wird der Funktionsumfang nur konzeptionell beschrieben, und seine Umsetzung ist für zukünftige Entwicklungsphasen geplant.  

---

# <span id="russian">**OmniTaskPlanner**</span> 

**OmniTaskPlanner** – это концепция гибкого планировщика задач, позволяющая визуализировать одни и те же задачи в различных методологиях управления временем и приоритетами, таких как:

- Классический **To-Do** (списки задач)
- **Канбан** (Trello-подобный вид)
- **Матрица Эйзенхауэра** (Важно/Срочно)
- **MoSCoW** (Must, Should, Could, Won’t)
- **Time Blocking** (Календарь)
- **GTD**, **RICE** и **Pomodoro**

> **Внимание!**  
> Данный проект находится на стадии планирования и проектирования. Ниже описанный функционал и архитектура – это запланированные возможности, которые на данный момент ещё **не реализованы**.

---

## **Описание проекта**

OmniTaskPlanner предлагает **одну базу данных** для отображения задач по разным методологиям без их дублирования. Проект нацелен на:
- Гибкую настройку параметров задач (важность, срочность, охват, уверенность, усилия)
- Унифицированное управление задачами через категории, теги и систему ролей (Admin, User)
- Единый API (на основе Django REST Framework) для поддержки веб-, мобильных и десктопных приложений

---

## **Основные возможности (запланированные)**

- **Единая база данных для различных представлений:**
  - Отображение задач в формате To-Do, Канбан, Матрицы Эйзенхауэра, MoSCoW, Time Blocking, GTD, RICE и Pomodoro.
  
- **Гибкая настройка задач:**
  - Задачи имеют фиксированные параметры (importance, urgency, reach, confidence, effort), которые используются в разных методологиях.
  - Возможность группировки через **категории** и **теги**.

- **Интуитивное управление:**
  - Поддержка **Drag & Drop** во всех режимах.
  - Динамическое обновление порядка задач с помощью параметра `sort_order` (шаг 10 с автоматическим перерасчетом при переполнении диапазона).

- **Time Blocking и планирование:**
  - Назначение задач на определённые временные слоты в календаре.
  - Возможность копировать задачи для настройки повторяющихся событий (повторение напрямую не поддерживается).

- **Система прав и ролей:**
  - Разграничение доступа с использованием Django Permissions.

- **Оффлайн-режим и синхронизация:**
  - Локальное хранение изменений (IndexedDB/SQLite) с последующей синхронизацией через bulk-update.
  - Обнаружение и разрешение конфликтов при синхронизации данных.

> **Примечание:** Все указанные возможности находятся в стадии планирования и могут быть изменены по мере разработки.

---

## **Технические решения**

### **Бэкенд**

- **Django + Django REST Framework:**  
  API-first подход, кастомная модель пользователя, JWT-аутентификация.
- **PostgreSQL:**  
  Реляционная база данных с поддержкой JSONB для кастомных данных.
- **Система прав доступа:**  
  Использование стандартных Django Permissions (auth_group, auth_permission) для управления доступом.

### **Фронтенд**

- **Single Page Application (React/Vue.js):**  
  Интерактивный интерфейс с поддержкой Drag & Drop во всех представлениях.
- **Оптимизация UI:**  
  Использование `useState()`, `useMemo()` и `useCallback()` для быстрой реакции на изменения, локальное обновление данных и кеширование вычислений (например, RICE).

### **DevOps и CI/CD**

- **Docker:**  
  Контейнеризация всех компонентов (бэкенд, фронтенд, база данных, Nginx).
- **GitHub Actions:**  
  Автоматизация тестирования и деплоя.
- **Планируемый деплой на AWS:**  
  Использование AWS ECS для масштабирования и управления инфраструктурой.

---

## **Архитектура проекта**

### **Основные сущности базы данных**

- **Task (Задачи):**  
  - Поддержка родительских задач и подзадач (`parent_task_id`).
  - Параметры задач (importance, urgency, reach, confidence, effort).
  - Поле `sort_order` для управления порядком (Drag & Drop).

- **Category (Категории) и Tag (Теги):**  
  - Группировка и фильтрация задач по смыслу и контексту.

- **TimeBlock (Тайм-блоки):**  
  - Назначение задач на конкретное время в календаре.

- **Пользователи и роли:**  
  - Разграничение доступа через кастомную модель пользователя и стандартные Django Permissions.

### **Методы визуализации задач**

- **To-Do список, Канбан-доска, Матрица Эйзенхауэра, MoSCoW, Time Blocking, GTD, RICE, Pomodoro**  
  Возможность переключения между разными представлениями для удобства планирования и управления.

### **Управление порядком задач**

- **sort_order:**  
  - Использование числового значения с шагом 10 для определения позиции.
  - Автоматический перерасчет при переполнении диапазона значений.

---

## **Примеры использования**

1. **Личный планировщик задач:**
   - Переключение между представлениями To-Do, Канбан и Матрицы Эйзенхауэра.
   - Визуальное разделение задач по важности и срочности.
   - Планирование времени с помощью Time Blocking.

2. **Менеджер проектов:**
   - Расстановка приоритетов с использованием MoSCoW и RICE.

3. **Фрилансер:**
   - Группировка задач по клиентам и проектам.
   - Оптимальное планирование рабочего дня с помощью Time Blocking.

---

## **Планы развития и запланированные фичи**

Подробнее о запланированном функционале можно прочитать в [features.md](docs/planned/features.md).

- Полноценная реализация всех заявленных методов визуализации задач.
- Автоматизация управления `sort_order` и поддержка Drag & Drop на всех уровнях.
- Внедрение оффлайн-режима с автоматической синхронизацией изменений.
- Разработка мобильного и десктопного приложения для расширения функционала.
- Оптимизация производительности и безопасности API.

> **Важно:** Все описанные функции находятся на стадии планирования и могут существенно измениться в процессе разработки.

---

## **Документация**

Полный обзор документации доступен в [docs/OVERVIEW.md](docs/OVERVIEW.md).

---

## **Git Workflow**

Мы используем структурированный Git workflow для поддержания чистоты и порядка в репозитории.

- **Именование веток** → Используйте `feature/`, `fix/`, `hotfix/` и другие префиксы ([Руководство по веткам](docs/developers/git-branches.md)).
- **Формат коммитов** → Соблюдайте стандарт (`feat:`, `fix:`, `chore:`) ([Гайд по коммитам](CONTRIBUTING.md)).
- **Git Hooks** → Автоматически устанавливаются через `dev-setup.sh`, проверяют формат коммитов и названия веток.

Подробнее смотрите в [CONTRIBUTING.md](CONTRIBUTING.md).

---

## **Лицензия**

Этот проект распространяется под лицензией [CC BY-NC 4.0](LICENSE.md).

---

> **Заключение:**  
> OmniTaskPlanner – это амбициозный проект, направленный на объединение различных методологий управления задачами в одном гибком и масштабируемом инструменте. Пока что функционал описан на концептуальном уровне, и его реализация запланирована на будущие этапы разработки.
