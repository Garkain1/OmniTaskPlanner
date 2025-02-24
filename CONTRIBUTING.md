| [**English**](#english) | [**Deutsch**](#german) | [**Русский**](#russian) |
|:-----------------------:|:----------------------:|:-----------------------:|

---

# <span id="english">**Repository Guidelines and Project Contribution**</span>

This document contains instructions for developers who wish to contribute to the project. It outlines the Git workflow standards, commit message guidelines, the use of Git Hooks, and the process for creating a Pull Request.

---

## **1. Creating a Pull Request (PR)**

1. Create a new branch (`feature/your-feature`).
2. Make commits according to the standard.
3. Ensure that all tests pass (`pytest`, `npm test`).
4. Open a Pull Request into the `develop` branch, add a description of the changes, and include a link to the related issue (`Related issues: #issue_number`).
5. Wait for a review before merging the changes into the main branch.

### **Branch Naming**

All branches must follow a consistent naming standard:

| **Branch Type**           | **Example**                     |
|---------------------------|---------------------------------|
| Feature (new feature)     | `feature/task-drag-and-drop`    |
| Bugfix (bug fix)          | `fix/task-missing-title`        |
| Hotfix (critical fix)     | `hotfix/urgent-db-issue`        |
| Release (release version) | `release/v1.2.0`                |
| Docs (documentation)      | `docs/update-readme`            |
| Test (tests and coverage) | `test/improve-unit-tests`       |
| CI/CD (automation)        | `ci/github-actions`             |

**More details on branching strategies:**  
[Full guide to branches](docs/developers/git-branches.md)  

---

## **2. Commit Message Format**

```
[Type]: Short description of changes

Detailed description:
- What was done?

Purpose:
- Why is it important?

Issue fixed:
- If a bug was fixed, what was the issue?

Affected files and changes:
- Which files and systems were changed?

Related issues: #issue_number (if applicable)
```

### **Allowed Commit Types**

| **Type**     | **Description**                                  |
|--------------|--------------------------------------------------|
| `feat:`      | Addition of new functionality                    |
| `fix:`       | Bug fixes                                        |
| `chore:`     | Project maintenance (CI/CD, configurations)      |
| `docs:`      | Documentation updates                            |
| `test:`      | Adding tests                                     |
| `refactor:`  | Code improvements without changing logic         |
| `perf:`      | Performance optimizations                        |
| `style:`     | Code formatting                                  |

### **Example Commit**

```
feat: Implement task priority system

Detailed description:
- Added a priority field to tasks with levels: Low, Medium, High, and Critical
- Updated task creation and editing forms to include priority selection
- Implemented visual indicators for task priority in Kanban and To-Do views
- Enhanced sorting and filtering options based on priority levels

Purpose:
- Improve task organization by allowing users to prioritize work efficiently
- Provide better visibility of high-priority tasks in different views
- Enable users to focus on the most urgent and important tasks

Affected files and changes:
- backend/models/task.py → Added `priority` field with predefined levels
- backend/api/serializers.py → Updated task serializer to support priority
- frontend/components/TaskCard.vue → Displayed priority indicators in task UI
- frontend/views/KanbanView.vue → Enabled sorting by priority in Kanban board
- frontend/views/ToDoList.vue → Added priority filter to task list

Related issues: #34
```

---

## **3. Installing Git Hooks**

To automatically validate the commit message format and branch naming, you need to install Git Hooks:

```sh
sh dev-setup.sh
```

### **Active Git Hooks**

- **commit-msg** – Verifies that the commit message conforms to the specified template.
- **pre-push** – Blocks a `push` if the branch name does not comply with the rules.

If `dev-setup.sh` has not been executed, Git Hooks can be installed manually:

```sh
rm -f .git/hooks/commit-msg .git/hooks/pre-push

cp .github/hooks/commit-msg .git/hooks/commit-msg
chmod +x .git/hooks/commit-msg

cp .github/hooks/pre-push .git/hooks/pre-push
chmod +x .git/hooks/pre-push
```

---

# <span id="german">**Regeln für die Arbeit mit dem Repository und den Beitrag zum Projekt**</span>

Dieses Dokument enthält Anweisungen für Entwickler, die zum Projekt beitragen möchten. Es beschreibt die Standards für die Arbeit mit Git, Richtlinien für Commit-Nachrichten, die Verwendung von Git Hooks sowie den Prozess zur Erstellung eines Pull Requests.

---

## **1. Erstellung eines Pull Requests (PR)**

1. Erstellen Sie einen neuen Branch (`feature/your-feature`).
2. Führen Sie Commits gemäß dem Standard durch.
3. Stellen Sie sicher, dass alle Tests erfolgreich durchlaufen (`pytest`, `npm test`).
4. Eröffnen Sie einen Pull Request im Branch `develop`, fügen Sie eine Beschreibung der Änderungen hinzu und verlinken Sie das zugehörige Issue (`Related issues: #Issue-Nummer`).
5. Warten Sie auf das Review, bevor Sie die Änderungen in den Hauptbranch mergen.

### **Branch-Namenskonvention**

Alle Branches müssen einer einheitlichen Namenskonvention folgen:  

| **Branch-Typ**            | **Beispiel**                   |
|---------------------------|--------------------------------|
| Feature (neue Funktion)   | `feature/task-drag-and-drop`   |
| Bugfix (Fehlerbehebung)   | `fix/task-missing-title`       |
| Hotfix (kritischer Fix)   | `hotfix/urgent-db-issue`       |
| Release (Release-Version) | `release/v1.2.0`               |
| Docs (Dokumentation)      | `docs/update-readme`           |
| Test (Tests und Abdeckung)| `test/improve-unit-tests`      |
| CI/CD (Automatisierung)   | `ci/github-actions`            |

**Weitere Informationen zu Branching-Strategien:**  
[Ausführliche Anleitung zu Branches](docs/developers/git-branches.md)  

---

## **2. Format der Commit-Nachrichten**

```
[Type]: Kurze Beschreibung der Änderungen

Detailed description:
- Was wurde gemacht?

Purpose:
- Warum ist das wichtig?

Issue fixed:
- Falls ein Fehler behoben wurde, worin bestand das Problem?

Affected files and changes:
- Welche Dateien und Systeme wurden geändert?

Related issues: #Issue-Nummer (falls vorhanden)
```

### **Erlaubte Commit-Typen**

| **Typ**     | **Beschreibung**                                   |
|-------------|----------------------------------------------------|
| `feat:`     | Hinzufügen neuer Funktionalitäten                  |
| `fix:`      | Behebung von Fehlern                               |
| `chore:`    | Wartung des Projekts (CI/CD, Konfigurationen)      |
| `docs:`     | Aktualisierung der Dokumentation                   |
| `test:`     | Hinzufügen von Tests                               |
| `refactor:` | Verbesserungen im Code ohne Änderung der Logik     |
| `perf:`     | Optimierung der Performance                        |
| `style:`    | Formatierung des Codes                             |

### **Beispiel eines Commits**

```
feat: Implement task priority system

Detailed description:
- Added a priority field to tasks with levels: Low, Medium, High, and Critical
- Updated task creation and editing forms to include priority selection
- Implemented visual indicators for task priority in Kanban and To-Do views
- Enhanced sorting and filtering options based on priority levels

Purpose:
- Improve task organization by allowing users to prioritize work efficiently
- Provide better visibility of high-priority tasks in different views
- Enable users to focus on the most urgent and important tasks

Affected files and changes:
- backend/models/task.py → Added `priority` field with predefined levels
- backend/api/serializers.py → Updated task serializer to support priority
- frontend/components/TaskCard.vue → Displayed priority indicators in task UI
- frontend/views/KanbanView.vue → Enabled sorting by priority in Kanban board
- frontend/views/ToDoList.vue → Added priority filter to task list

Related issues: #34
```

---

## **3. Installation der Git Hooks**

Um die automatische Überprüfung des Formats der Commit-Nachrichten und der Branch-Namen zu gewährleisten, müssen Git Hooks installiert werden:

```sh
sh dev-setup.sh
```

### **Aktive Git Hooks**

- **commit-msg** – Überprüft, ob die Commit-Nachricht dem festgelegten Muster entspricht.
- **pre-push** – Verhindert einen `push`, falls der Branch-Name nicht den Regeln entspricht.

Falls `dev-setup.sh` nicht ausgeführt wurde, können die Git Hooks manuell installiert werden:

```sh
rm -f .git/hooks/commit-msg .git/hooks/pre-push

cp .github/hooks/commit-msg .git/hooks/commit-msg
chmod +x .git/hooks/commit-msg

cp .github/hooks/pre-push .git/hooks/pre-push
chmod +x .git/hooks/pre-push
```

---

# <span id="russian">**Правила работы с репозиторием и вклад в проект**</span>

Этот документ содержит инструкции для разработчиков, которые хотят внести вклад в проект. В нем описаны стандарты работы с Git, правила оформления коммитов, использование Git Hooks, а также процесс создания Pull Request.

---

## **1. Создание Pull Request (PR)**

1. Создайте новую ветку (`feature/your-feature`).
2. Сделайте коммиты в соответствии со стандартом.
3. Убедитесь, что все тесты проходят (`pytest`, `npm test`).
4. Откройте Pull Request в `develop`, добавьте описание изменений и ссылку на связанный issue (`Related issues: #номер_задачи`).
5. Дождитесь ревью перед слиянием изменений в основную ветку.

### **Именование веток**

Все ветки должны следовать единому стандарту именования:  

| **Тип ветки**             | **Пример**                   |
|---------------------------|------------------------------|
| Feature (новая фича)      | `feature/task-drag-and-drop` |
| Bugfix (исправление бага) | `fix/task-missing-title`     |
| Hotfix (критический фикс) | `hotfix/urgent-db-issue`     |
| Release (релизная версия) | `release/v1.2.0`             |
| Docs (документация)       | `docs/update-readme`         |
| Test (тесты и покрытие)   | `test/improve-unit-tests`    |
| CI/CD (автоматизация)     | `ci/github-actions`          |

**Подробнее о стратегиях ветвления:**  
[Полное руководство по веткам](docs/developers/git-branches.md)  

---

## **2. Формат коммитов**

```
[Type]: Краткое описание изменений

Detailed description:
- Что было сделано?

Purpose:
- Почему это важно?

Issue fixed:
- Если исправлялся баг, в чем была проблема?

Affected files and changes:
- Какие файлы и системы были изменены?

Related issues: #номер_задачи (если есть)
```

### **Разрешённые типы коммитов**

| **Тип**     | **Описание**                               |
|-------------|--------------------------------------------|
| `feat:`     | Добавление новой функциональности          |
| `fix:`      | Исправление багов                          |
| `chore:`    | Обслуживание проекта (CI/CD, конфигурации) |
| `docs:`     | Обновление документации                    |
| `test:`     | Добавление тестов                          |
| `refactor:` | Улучшение кода без изменения логики        |
| `perf:`     | Оптимизация производительности             |
| `style:`    | Форматирование кода                        |

### **Пример коммита**

```
feat: Implement task priority system

Detailed description:
- Added a priority field to tasks with levels: Low, Medium, High, and Critical
- Updated task creation and editing forms to include priority selection
- Implemented visual indicators for task priority in Kanban and To-Do views
- Enhanced sorting and filtering options based on priority levels

Purpose:
- Improve task organization by allowing users to prioritize work efficiently
- Provide better visibility of high-priority tasks in different views
- Enable users to focus on the most urgent and important tasks

Affected files and changes:
- backend/models/task.py → Added `priority` field with predefined levels
- backend/api/serializers.py → Updated task serializer to support priority
- frontend/components/TaskCard.vue → Displayed priority indicators in task UI
- frontend/views/KanbanView.vue → Enabled sorting by priority in Kanban board
- frontend/views/ToDoList.vue → Added priority filter to task list

Related issues: #34
```

---

## **3. Установка Git Hooks**

Для автоматической проверки формата коммитов и именования веток необходимо установить Git Hooks:

```sh
sh dev-setup.sh
```

### **Активные Git Hooks**

- **commit-msg** – проверяет, соответствует ли сообщение коммита установленному шаблону.
- **pre-push** – блокирует `push`, если имя ветки не соответствует правилам.

Если `dev-setup.sh` не запускался, Git Hooks можно установить вручную:

```sh
rm -f .git/hooks/commit-msg .git/hooks/pre-push

cp .github/hooks/commit-msg .git/hooks/commit-msg
chmod +x .git/hooks/commit-msg

cp .github/hooks/pre-push .git/hooks/pre-push
chmod +x .git/hooks/pre-push
```
