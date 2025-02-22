| [**English**](#english) | [**Deutsch**](#german) | [**Русский**](#russian) |
|:-----------------------:|:----------------------:|:-----------------------:|

---

# <span id="english">**OmniTaskPlanner – Planned Features**</span>

This document contains a list of features that are **not yet implemented** but are planned for development.

**What is included in this file?**  
- **MVP Features** – functionality that must be implemented in the first version.  
- **Extended Capabilities** – additional enhancements that will be added after the release.  
- **Technical Improvements** – optimization of the database, security, API, DevOps, and CI/CD.

**What is NOT included in this file?**  
- **Features that have already been implemented** are located in the file `implemented/features.md`.

This document **is updated as decisions are made to add new features**.

---

### **1. Task Management**  
OmniTaskPlanner provides convenient tools for creating, editing, and managing tasks:  
- **Creating, editing, and deleting tasks**: users can quickly add new tasks, edit them, and delete unnecessary ones.  
- **Support for nested subtasks**: each task can have an unlimited number of nested subtasks, allowing work to be structured in levels.  
- **Drag & Drop of tasks across all systems**: tasks can be moved between categories, statuses, and lists via a convenient Drag & Drop interface.  
- **Flexible sorting system (sort_order)**: each task has a numeric parameter `sort_order` that determines its order in lists. The `sort_order` value is updated dynamically when tasks are dragged and dropped.  
- **Soft deletion (`is_deleted = True`) with the possibility of restoration**: deleted tasks do not disappear immediately but are marked as `is_deleted = True`, allowing administrators to restore them.  
- **Task restoration**: only an administrator can restore a deleted task. When restoring, all subtasks and their subtasks (if they were deleted together with the main task) are also restored.  
- **Trash (frontend only)**: when a task is deleted, it does NOT receive `is_deleted = True` but is simply hidden from the main list (`inTrash = true`).  
  - The user can either restore the task or confirm its deletion.  
  - After confirming deletion, all tasks from the “Trash” are sent in a `bulk-update` with `is_deleted = True` (cascading).  
  - Tasks marked as `is_deleted = True` disappear from the list permanently (user restoration is not possible).  
- **Automatic task placement**: if there are less than 24 hours until the deadline, the task is automatically marked as urgent. If the status is changed (e.g. from `To Do` → `In Progress`), the task is moved to the corresponding Kanban column. Overdue tasks can be automatically archived.  
- **Archiving tasks**: tasks with the status `"Done"` are **NOT automatically archived**.  
  - The user decides when to move a task to `"Archived"` using a special button.

---

### **2. Task Visualization (Organization Methods)**  
OmniTaskPlanner supports several popular task organization methods, allowing the user to choose the most convenient way to display tasks:  
- **Classic To-Do list**: a standard list of tasks with the ability to group and sort them.  
- **Kanban board**: tasks are displayed as cards in columns (`To Do`, `In Progress`, `Done`), which can be moved between statuses.  
- **Eisenhower Matrix**: tasks are presented in quadrants with the axes “Important/Not Important” and “Urgent/Not Urgent”.  
- **MoSCoW (Must, Should, Could, Won’t)**: a methodology for prioritizing tasks according to four categories of importance.  
- **Time Blocking (calendar scheduling)**: the ability to assign tasks to specific time slots for planning the day.  
- **GTD (Getting Things Done)**: a productivity system that categorizes tasks by contexts and projects.  
- **RICE (Reach, Impact, Confidence, Effort)**: a methodology for evaluating tasks based on impact and effort criteria.  
- **Pomodoro**: a focus timer that allows working on tasks using the Pomodoro technique (25 minutes of work – 5 minutes of break).  
- **Drag & Drop is supported in all modes**:  
  - **Kanban**: moving tasks between statuses `To Do`, `In Progress`, `Done`.  
  - **MoSCoW**: moving tasks between `Must`, `Should`, `Could`, `Won't`.  
  - **Eisenhower Matrix**: moving tasks between `Urgent/Not Urgent` and `Important/Not Important`.  
- **GTD (Getting Things Done)**: a productivity system that categorizes tasks by contexts and projects.  
  - **Visualization**: tasks are grouped by "Categories" (for example, "Project A", "Work", "Study").  
  - Additionally: the ability to quickly move tasks between contexts.
- **RICE (Reach, Impact, Confidence, Effort)**: a methodology for evaluating tasks based on impact and effort criteria.  
  - **Visualization**: tasks are sorted by a weighted priority coefficient `(Reach × Impact × Confidence) ÷ Effort`.  
  - **Filters**: the ability to display only tasks with the highest or lowest priority.

---

### **3. Task Parameters**  
Each task in OmniTaskPlanner can be supplemented with various attributes for better organization:  
- **Tags and categories**: users can add tags and categories to tasks for convenient grouping.  
- **Task statuses**: each task has a status (`To Do`, `In Progress`, `Done`, `Archived`), which determines its stage of completion.  
- **Priorities**: tasks have parameters for importance (`Importance`) and urgency (`Urgency`).  
- **Task evaluation**: the parameters `Reach`, `Confidence`, `Effort` allow assessing the task’s impact, the level of confidence in it, and the effort required to complete it.  
- **Due date (`due_date`)**: the ability to set a deadline for each task.  
- **Filtering and search**: users can find tasks by tags, categories, status, importance, and other parameters.  
- **Recalculation of `sort_order`**:  
  - During Drag & Drop between statuses, `sort_order` is recalculated with an increment of `10`.  
  - If the range of `sort_order` is exhausted, a recalculation of the entire group of tasks is performed.  
  - `sort_order` works the same in To-Do lists, Kanban, and the Eisenhower Matrix.

---

### **4. Frontend (User Interface)**  
- **Choice between different task views**: the interface allows switching between various visualization methods (To-Do, Kanban, Eisenhower, etc.).  
- **Inline task editing**: the ability to modify task parameters directly in the lists without needing to open a separate editing window.  
- **Flexible display customization**: users can customize category colors, the order in which tasks are displayed, and hide unnecessary parameters.  
- **Desktop and mobile versions**: in addition to the web version, desktop and mobile applications will be developed (the question of whether to make them separate projects remains open).  
- **Bulk update of changes**: all task changes are accumulated on the frontend and sent to the server in a single request (`task/bulk` or `task/{id}/bulk`), with updates occurring every 10 seconds or when the view is changed.
  - **Drag & Drop recalculates `sort_order` on the frontend, not on the server.**  
  - **If tasks are moved to another status, the frontend must send the updated `sort_order` in the `bulk-update`.**  
  - **The API does not automatically change `sort_order`, but applies the values provided.**  
  - **During Drag & Drop, `sort_order` is set with an increment of 10 (e.g., if moving from `20` to `30`, the new task receives `25`).**  
  - **If the `sort_order` range is exhausted, the frontend itself initiates a recalculation of the entire group of tasks.**
- **Lazy loading of tasks**: tasks are loaded dynamically as needed, bypassing standard pagination.  
- **Lazy removal of collapsed tasks (UI)**: if a task is collapsed, it is hidden from the interface and unloaded from memory, but remains accessible upon expansion.  
- **Click filters**: quick access to tasks based on criteria (`Only urgent`, `Only important`, `Filter by tags/categories`). Filters can be combined for convenience.  
- **PWA (Progressive Web App) and offline mode**  
  - **Local task storage**: all changes are stored in `IndexedDB` or `SQLite` while offline, and then synchronized when a network connection is available.  
  - **Automatic synchronization**:  
    - When the network becomes available, tasks are sent in a `bulk-update`.  
  - **Conflict detection**:  
    - If the parameter (`title`) was changed only on the client, and (`urgency`) only on the server, the server merges the changes.  
    - If the same parameter (`status`) was changed on both the client and the server → the UI offers a choice of which version to use.  
  - **User settings**: offline mode can be enabled or disabled in the settings.
- **Recalculation of `effective_status` on the frontend (without a server request)**  
  - If a parent task is marked as “done”, all subtasks temporarily receive `effective_status = "done"`.  
  - When the parent task is moved back to `To Do`, all subtasks revert to their actual `status`.  
  - The update of `effective_status` is performed locally, without burdening the server.
- **Lazy sending of `bulk-update` (every 10 seconds + upon view change)**  
  - All changes are accumulated in `modifiedTasks` and then sent via `PATCH /tasks/bulk-update/` in a single request.  
  - If there are no changes, `bulk-update` is not sent, reducing the load on the API.  
  - When changing the view (e.g. `To-Do → Kanban → MoSCoW`), `bulk-update` is called before switching.
- **UI update without waiting for the server**  
  - All changes are applied locally in `useState()`, and then sent to the server.  
  - During Drag & Drop, `effective_status` is updated instantly, without waiting for a response from the API.  
  - The frontend receives new data every 5–10 seconds via `GET /tasks/`.
- **Caching `effective_status` via `useMemo()`**  
  - To avoid unnecessary re-renders, `useMemo()` is used to cache `effective_status`.  
  - Recalculation occurs only when the parent task or the task list changes.
- **Saving changes to `localStorage` before closing the tab**  
  - If the user closes the tab, unsaved changes are not lost.  
  - Before closing the page, tasks are saved to `localStorage`.  
  - Upon reopening the page, unsaved changes are loaded and sent in a `bulk-update`.
- **Automatic recalculation of `RICE` on the frontend**
  - **`RICE = (Reach * Impact * Confidence) / Effort` is calculated locally, without a server request.**  
  - If `reach`, `impact`, `confidence`, or `effort` change, the new `RICE` is recalculated instantly.  
  - The server may recalculate `RICE`, but only if necessary (for example, during `GET /tasks/`).  
  - `useMemo()` is used to cache the `RICE` values so that it is not recalculated on every re-render.
- **Optimization of Drag & Drop**
  - Updating `sort_order` is performed only for tasks that have changed.  
  - `useMemo()` and `useCallback()` are used to prevent unnecessary state updates.  
  - If `sort_order` becomes exhausted (for example, if all tasks have `sort_order` with the minimum increment), the frontend automatically recalculates `sort_order` for all tasks in the column.  
  - Drag & Drop animation is supported for smoother interaction.

---

### **5. Managing sort_order**  
- **sort_order is used with an increment of 10**: each task receives a numeric value `sort_order` that determines its position in the list.  
- **Dynamic updating**: when tasks are moved, a new `sort_order` is calculated; for example, if a task is moved between `20` and `30`, it is assigned `25`.  
- **Automatic recalculation**: if the range of `sort_order` values is exhausted, `sort_order` for the entire group of tasks is recalculated.  
- **Recalculation of `sort_order` in bulk updates**:  
  - `PATCH /tasks/bulk/` automatically recalculates `sort_order` for all tasks.  
  - If tasks are moved to another status, `sort_order` is recalculated dynamically.

---

### **6. Backend**  
- **PostgreSQL as the primary database**: PostgreSQL is used to store all user data and tasks.  
- **Django API**: a REST API is implemented for communication with the frontend and mobile applications.  
- **JWT authentication**: JSON Web Token is used for secure user authentication.  
- **Access segregation**: user tasks are not visible to administrators, but can be restored after soft deletion.  
- **Display of subtask count**: the interface will show how many subtasks a task has in total and how many of them are completed.  
- **Lazy loading (`offset` + `limit`)**: the API returns tasks as needed, minimizing server load.  
  - By default, the API returns only root tasks (`parent_task = NULL`).  
  - Subtasks are loaded dynamically when a task is expanded (`GET /tasks/{id}/subtasks/`).  
  - It is possible to request nested subtasks using the `depth` parameter:  
    - `GET /tasks/{id}/subtasks/?depth=1` → Loads only 1 level of subtasks.  
    - `GET /tasks/{id}/subtasks/?depth=2` → Loads 2 levels of nesting.  
  - The frontend can request only the required level of nesting, in order not to overload the server with unnecessary data.
- **User permissions**:  
  - A regular user can only edit their own tasks.  
  - An administrator can restore deleted tasks and manage categories.  
  - In the future, the addition of business accounts with team collaboration is possible.
- **API and nested subtasks**:  
  - `GET /tasks/{id}/subtasks/?depth=1` → Loads only 1 level of subtasks.  
  - `GET /tasks/{id}/subtasks/?depth=2` → Loads 2 levels of nesting.

---

### **7. CI/CD and DevOps**  
- **GitHub Actions for CI/CD**: automation of testing and deployment of the project.  
- **Docker containers**: the backend, frontend, database, and Nginx will be packaged in Docker containers.  
- **Deployment on AWS**: the application will be deployed on AWS, including a server on EC2 and a database in a Private Subnet.
  - **Containerization**: `Docker Compose` is used for development, and in production – `AWS ECS (Elastic Container Service)` with automatic scaling.

---

# <span id="german">**OmniTaskPlanner – Geplante Funktionen**</span>

Dieses Dokument enthält eine Liste von Funktionen, die **noch nicht implementiert wurden**, aber für die Entwicklung geplant sind.

**Was ist in dieser Datei enthalten?**  
- **MVP-Funktionen** – Funktionalitäten, die in der ersten Version implementiert werden müssen.  
- **Erweiterte Funktionen** – zusätzliche Verbesserungen, die nach dem Release hinzugefügt werden.  
- **Technische Verbesserungen** – Optimierung der Datenbank, Sicherheit, API, DevOps und CI/CD.

**Was ist NICHT in dieser Datei enthalten?**  
- **Funktionen, die bereits implementiert wurden**, befinden sich in der Datei `implemented/features.md`.

Dieses Dokument **wird aktualisiert, sobald Entscheidungen über die Hinzufügung neuer Funktionen getroffen werden**.

---

### **1. Aufgabenverwaltung**  
OmniTaskPlanner bietet benutzerfreundliche Werkzeuge zur Erstellung, Bearbeitung und Verwaltung von Aufgaben:  
- **Erstellen, Bearbeiten und Löschen von Aufgaben**: Benutzer können schnell neue Aufgaben hinzufügen, diese bearbeiten und überflüssige Aufgaben löschen.  
- **Unterstützung verschachtelter Unteraufgaben**: Jede Aufgabe kann eine unbegrenzte Anzahl verschachtelter Unteraufgaben haben, was die Strukturierung der Arbeit in Ebenen ermöglicht.  
- **Drag & Drop von Aufgaben in allen Systemen**: Aufgaben können zwischen Kategorien, Status und Listen mittels einer benutzerfreundlichen Drag & Drop-Oberfläche verschoben werden.  
- **Flexibles Sortiersystem (sort_order)**: Jede Aufgabe hat einen numerischen Parameter `sort_order`, der ihre Reihenfolge in den Listen bestimmt. Der Wert von `sort_order` wird dynamisch beim Verschieben von Aufgaben aktualisiert.  
- **Weiches Löschen (`is_deleted = True`) mit Wiederherstellungsoption**: Gelöschte Aufgaben verschwinden nicht sofort, sondern werden als `is_deleted = True` markiert, was Administratoren die Wiederherstellung ermöglicht.  
- **Wiederherstellung von Aufgaben**: Nur ein Administrator kann eine gelöschte Aufgabe wiederherstellen. Bei der Wiederherstellung werden auch alle Unteraufgaben und deren Unteraufgaben wiederhergestellt, sofern sie zusammen mit der Hauptaufgabe gelöscht wurden.  
- **Papierkorb (nur im Frontend)**: Beim Löschen einer Aufgabe wird sie NICHT mit `is_deleted = True` markiert, sondern lediglich aus der Hauptliste ausgeblendet (`inTrash = true`).  
  - Der Benutzer kann die Aufgabe entweder wiederherstellen oder die Löschung bestätigen.  
  - Nach der Bestätigung der Löschung werden alle Aufgaben aus dem „Papierkorb“ in einem `bulk-update` mit `is_deleted = True` (kaskadierend) gesendet.  
  - Aufgaben, die als `is_deleted = True` markiert sind, verschwinden dauerhaft aus der Liste (eine Wiederherstellung durch den Benutzer ist nicht möglich).  
- **Automatische Aufgabenplatzierung**: Wenn weniger als 24 Stunden bis zum Fälligkeitsdatum verbleiben, wird die Aufgabe automatisch als dringend markiert. Ändert sich der Status (z. B. von `To Do` → `In Progress`), wird die Aufgabe in die entsprechende Kanban-Spalte verschoben. Überfällige Aufgaben können automatisch archiviert werden.  
- **Archivierung von Aufgaben**: Aufgaben mit dem Status `"Done"` werden **NICHT automatisch archiviert**.  
  - Der Benutzer entscheidet selbst, wann eine Aufgabe in den Status `"Archived"` verschoben wird, über einen speziellen Button.

---

### **2. Aufgabenvisualisierung (Organisationsmethoden)**  
OmniTaskPlanner unterstützt mehrere beliebte Methoden zur Aufgabenorganisation, sodass der Benutzer die für ihn am besten geeignete Anzeigeform wählen kann:  
- **Klassische To-Do-Liste**: Eine Standard-Aufgabenliste mit der Möglichkeit, Aufgaben zu gruppieren und zu sortieren.  
- **Kanban-Board**: Aufgaben werden als Karten in Spalten (`To Do`, `In Progress`, `Done`) dargestellt, die zwischen den Status verschoben werden können.  
- **Eisenhower-Matrix**: Aufgaben werden in Quadranten dargestellt, mit den Achsen „Wichtig/Nicht wichtig“ und „Dringend/Nicht dringend“.  
- **MoSCoW (Must, Should, Could, Won't)**: Eine Methodik zur Priorisierung von Aufgaben nach vier Wichtigkeitskategorien.  
- **Time Blocking (Zeitblockierung)**: Die Möglichkeit, Aufgaben bestimmten Zeitfenstern zuzuordnen, um den Tag zu planen.  
- **GTD (Getting Things Done)**: Ein Produktivitätssystem, das Aufgaben nach Kontexten und Projekten kategorisiert.  
- **RICE (Reach, Impact, Confidence, Effort)**: Eine Methodik zur Bewertung von Aufgaben basierend auf Einfluss- und Aufwandkriterien.  
- **Pomodoro**: Ein Fokustimer, der es ermöglicht, Aufgaben nach der Pomodoro-Technik zu bearbeiten (25 Minuten Arbeit – 5 Minuten Pause).  
- **Drag & Drop wird in allen Modi unterstützt**:  
  - **Kanban**: Verschiebung von Aufgaben zwischen den Status `To Do`, `In Progress`, `Done`.  
  - **MoSCoW**: Verschiebung von Aufgaben zwischen `Must`, `Should`, `Could`, `Won't`.  
  - **Eisenhower-Matrix**: Verschiebung von Aufgaben zwischen `Dringend/Nicht dringend` und `Wichtig/Nicht wichtig`.  
- **GTD (Getting Things Done)**: Ein Produktivitätssystem, das Aufgaben nach Kontexten und Projekten kategorisiert.  
  - **Visualisierung**: Aufgaben werden nach "Kategorien" gruppiert (zum Beispiel "Projekt A", "Arbeit", "Studium").  
  - Zusätzlich: die Möglichkeit, Aufgaben schnell zwischen Kontexten zu verschieben.
- **RICE (Reach, Impact, Confidence, Effort)**: Eine Methodik zur Bewertung von Aufgaben basierend auf Einfluss- und Aufwandkriterien.  
  - **Visualisierung**: Aufgaben werden nach einem gewichteten Prioritätskoeffizienten `(Reach × Impact × Confidence) ÷ Effort` sortiert.  
  - **Filter**: Möglichkeit, nur Aufgaben mit höchster oder niedrigster Priorität anzuzeigen.

---

### **3. Aufgabenparameter**  
Jede Aufgabe in OmniTaskPlanner kann mit verschiedenen Merkmalen versehen werden, um eine bessere Organisation zu ermöglichen:  
- **Tags und Kategorien**: Benutzer können Aufgaben Tags und Kategorien hinzufügen, um sie bequem zu gruppieren.  
- **Aufgabenstatus**: Jede Aufgabe hat einen Status (`To Do`, `In Progress`, `Done`, `Archived`), der den Fortschritt bestimmt.  
- **Prioritäten**: Aufgaben haben Parameter für Wichtigkeit (`Importance`) und Dringlichkeit (`Urgency`).  
- **Aufgabeneinschätzung**: Die Parameter `Reach`, `Confidence`, `Effort` ermöglichen die Bewertung des Einflusses einer Aufgabe, das Vertrauen darin und den erforderlichen Aufwand zur Erledigung.  
- **Fälligkeitsdatum (`due_date`)**: Möglichkeit, für jede Aufgabe ein Fälligkeitsdatum festzulegen.  
- **Filterung und Suche**: Benutzer können Aufgaben nach Tags, Kategorien, Status, Wichtigkeit und anderen Parametern finden.  
- **Neuberechnung von `sort_order`**:  
  - Beim Drag & Drop zwischen Status wird `sort_order` in Schritten von `10` neu berechnet.  
  - Wenn der Wertebereich von `sort_order` erschöpft ist, wird die gesamte Gruppe von Aufgaben neu berechnet.  
  - `sort_order` funktioniert gleichermaßen in To-Do-Listen, Kanban und der Eisenhower-Matrix.

---

### **4. Frontend (Benutzeroberfläche)**  
- **Auswahl zwischen verschiedenen Aufgabenansichten**: Die Benutzeroberfläche ermöglicht den Wechsel zwischen unterschiedlichen Visualisierungsmethoden (To-Do, Kanban, Eisenhower usw.).  
- **Inline-Aufgabenbearbeitung**: Die Möglichkeit, Aufgabenparameter direkt in den Listen zu ändern, ohne ein separates Bearbeitungsfenster öffnen zu müssen.  
- **Flexible Anpassung der Darstellung**: Benutzer können Kategorienfarben, die Reihenfolge der Aufgabenanzeige anpassen und unnötige Parameter ausblenden.  
- **Desktop- und mobile Versionen**: Neben der Web-Version werden Desktop- und Mobile-Anwendungen entwickelt (die Frage, ob diese als separate Projekte realisiert werden sollen, bleibt offen).  
- **Massenaktualisierung von Änderungen**: Alle Änderungen an Aufgaben werden im Frontend gesammelt und in einer Anfrage (`task/bulk` oder `task/{id}/bulk`) an den Server gesendet, wobei Aktualisierungen alle 10 Sekunden oder beim Wechsel der Ansicht erfolgen.
  - **Drag & Drop berechnet `sort_order` im Frontend neu, nicht auf dem Server.**  
  - **Wenn Aufgaben in einen anderen Status verschoben werden, muss das Frontend den aktualisierten `sort_order` im `bulk-update` übermitteln.**  
  - **Die API ändert `sort_order` nicht automatisch, sondern wendet die übergebenen Werte an.**  
  - **Beim Drag & Drop wird `sort_order` in Schritten von 10 festgelegt (z. B. wenn von `20` zu `30`, erhält die neue Aufgabe `25`).**  
  - **Wenn der Bereich von `sort_order` erschöpft ist, initiiert das Frontend die Neuberechnung der gesamten Aufgaben-Gruppe.**
- **Lazy Loading von Aufgaben**: Aufgaben werden dynamisch nach Bedarf geladen, anstelle einer standardmäßigen Paginierung.  
- **Lazy Removal von zusammengeklappten Aufgaben (UI)**: Wenn eine Aufgabe zusammengeklappt wurde, wird sie aus der Benutzeroberfläche ausgeblendet und aus dem Speicher entfernt, bleibt jedoch beim erneuten Aufklappen zugänglich.  
- **Klickfilter**: Schneller Zugriff auf Aufgaben basierend auf Kriterien (`Nur dringend`, `Nur wichtig`, `Filter nach Tags/Kategorien`). Filter können für zusätzlichen Komfort kombiniert werden.  
- **PWA (Progressive Web App) und Offline-Modus**  
  - **Lokale Speicherung von Aufgaben**: Alle Änderungen werden in `IndexedDB` oder `SQLite` gespeichert, solange keine Netzwerkverbindung besteht, und anschließend synchronisiert, sobald eine Verbindung verfügbar ist.  
  - **Automatische Synchronisierung**:  
    - Sobald das Netzwerk verfügbar ist, werden Aufgaben in einem `bulk-update` gesendet.  
  - **Konflikterkennung**:  
    - Wenn der Parameter (`title`) nur auf dem Client und (`urgency`) nur auf dem Server geändert wurde, führt der Server die Änderungen zusammen.  
    - Wenn derselbe Parameter (`status`) sowohl auf dem Client als auch auf dem Server geändert wurde → bietet die Benutzeroberfläche an, welche Version verwendet werden soll.  
  - **Benutzereinstellungen**: Im Einstellungsmenü kann der Offline-Modus ein- oder ausgeschaltet werden.
- **Neuberechnung von `effective_status` im Frontend (ohne Serverabfrage)**  
  - Wenn eine übergeordnete Aufgabe als „done“ markiert ist, erhalten alle Unteraufgaben vorübergehend `effective_status = "done"`.  
  - Wenn die übergeordnete Aufgabe wieder in `To Do` zurückgesetzt wird, erhalten alle Unteraufgaben ihren tatsächlichen `status` zurück.  
  - Die Aktualisierung von `effective_status` erfolgt lokal, ohne den Server zu belasten.
- **Lazy-Versand von `bulk-update` (alle 10 Sekunden + beim Wechsel der Ansicht)**  
  - Alle Änderungen werden in `modifiedTasks` gesammelt und dann mit einer Anfrage an `PATCH /tasks/bulk-update/` gesendet.  
  - Wenn keine Änderungen vorliegen, wird `bulk-update` nicht gesendet, wodurch die API-Last reduziert wird.  
  - Beim Wechsel der Ansicht (z. B. `To-Do → Kanban → MoSCoW`) wird vor dem Umschalten `bulk-update` aufgerufen.
- **UI-Aktualisierung ohne Warten auf den Server**  
  - Alle Änderungen werden lokal in `useState()` angewendet und anschließend an den Server gesendet.  
  - Beim Drag & Drop wird `effective_status` sofort aktualisiert, ohne auf eine Antwort der API zu warten.  
  - Das Frontend erhält alle 5–10 Sekunden neue Daten über `GET /tasks/`.
- **Caching von `effective_status` über `useMemo()`**  
  - Um unnötige Neurenderungen zu vermeiden, wird `useMemo()` zum Caching von `effective_status` verwendet.  
  - Die Neuberechnung erfolgt nur bei Änderungen der übergeordneten Aufgabe oder der Aufgabenliste.
- **Speicherung von Änderungen in `localStorage` vor dem Schließen des Tabs**  
  - Wenn der Benutzer den Tab schließt, gehen ungespeicherte Änderungen nicht verloren.  
  - Vor dem Schließen der Seite werden die Aufgaben in `localStorage` gespeichert.  
  - Beim nächsten Öffnen der Seite werden ungespeicherte Änderungen geladen und in einem `bulk-update` gesendet.
- **Automatische Neuberechnung von `RICE` im Frontend**
  - **`RICE = (Reach * Impact * Confidence) / Effort` wird lokal berechnet, ohne den Server anzufragen.**  
  - Wenn `reach`, `impact`, `confidence` oder `effort` geändert werden, wird der neue `RICE` sofort neu berechnet.  
  - Der Server kann `RICE` neu berechnen, allerdings nur bei Bedarf (z. B. bei `GET /tasks/`).  
  - `useMemo()` wird verwendet, um die `RICE`-Werte zu cachen, damit sie nicht bei jedem Neurendern neu berechnet werden.
- **Optimierung von Drag & Drop**
  - Die Aktualisierung von `sort_order` erfolgt nur für geänderte Aufgaben.  
  - `useMemo()` und `useCallback()` werden verwendet, um unnötige Zustandsaktualisierungen zu vermeiden.  
  - Wenn `sort_order` erschöpft ist (zum Beispiel, wenn alle Aufgaben den minimalen Schritt für `sort_order` haben), berechnet das Frontend `sort_order` für alle Aufgaben in der Spalte neu.  
  - Eine Drag & Drop-Animation wird unterstützt, um eine flüssigere Interaktion zu gewährleisten.

---

### **5. Verwaltung von sort_order**  
- **`sort_order` wird mit einem Schritt von 10 verwendet**: Jede Aufgabe erhält einen numerischen Wert `sort_order`, der ihre Position in der Liste bestimmt.  
- **Dynamische Aktualisierung**: Beim Verschieben von Aufgaben wird ein neuer `sort_order` berechnet, zum Beispiel, wenn eine Aufgabe zwischen `20` und `30` verschoben wird, erhält sie `25`.  
- **Automatische Neuberechnung**: Wenn der Wertebereich von `sort_order` erschöpft ist, wird `sort_order` für die gesamte Gruppe von Aufgaben neu berechnet.  
- **Neuberechnung von `sort_order` bei Massenaktualisierungen**:  
  - `PATCH /tasks/bulk/` berechnet `sort_order` für alle Aufgaben automatisch neu.  
  - Wenn Aufgaben in einen anderen Status verschoben werden, wird `sort_order` dynamisch neu berechnet.

---

### **6. Backend**  
- **PostgreSQL als primäre Datenbank**: PostgreSQL wird zur Speicherung aller Benutzerdaten und Aufgaben verwendet.  
- **Django API**: Es wird eine REST-API zur Kommunikation mit dem Frontend und mobilen Anwendungen implementiert.  
- **JWT-Authentifizierung**: Es wird JSON Web Token zur sicheren Benutzerauthentifizierung verwendet.  
- **Zugriffsaufteilung**: Benutzeraufgaben sind für Administratoren nicht sichtbar, können jedoch nach dem weichen Löschen wiederhergestellt werden.  
- **Anzeige der Anzahl von Unteraufgaben**: In der Benutzeroberfläche wird angezeigt, wie viele Unteraufgaben eine Aufgabe insgesamt hat und wie viele davon bereits erledigt sind.  
- **Lazy Loading (`offset` + `limit`)**: Die API liefert Aufgaben nach Bedarf, um die Serverlast zu minimieren.  
  - Standardmäßig gibt die API nur Stammaufgaben zurück (`parent_task = NULL`).  
  - Unteraufgaben werden dynamisch beim Aufklappen einer Aufgabe geladen (`GET /tasks/{id}/subtasks/`).  
  - Es können verschachtelte Unteraufgaben über den Parameter `depth` angefordert werden:  
    - `GET /tasks/{id}/subtasks/?depth=1` → Lädt nur eine Ebene von Unteraufgaben.  
    - `GET /tasks/{id}/subtasks/?depth=2` → Lädt 2 Ebenen der Verschachtelung.  
  - Das Frontend kann nur die erforderliche Verschachtelungsebene anfordern, um den Server nicht mit unnötigen Daten zu belasten.
- **Benutzerrechte**:  
  - Ein normaler Benutzer kann nur seine eigenen Aufgaben bearbeiten.  
  - Ein Administrator kann gelöschte Aufgaben wiederherstellen und Kategorien verwalten.  
  - In Zukunft ist die Einführung von Geschäftskonten mit Teamarbeit möglich.
- **API und verschachtelte Unteraufgaben**:  
  - `GET /tasks/{id}/subtasks/?depth=1` → Lädt nur eine Ebene von Unteraufgaben.  
  - `GET /tasks/{id}/subtasks/?depth=2` → Lädt 2 Ebenen der Verschachtelung.

---

### **7. CI/CD und DevOps**  
- **GitHub Actions für CI/CD**: Automatisierung von Tests und Deployment des Projekts.  
- **Docker-Container**: Backend, Frontend, Datenbank und Nginx werden in Docker-Containern verpackt.  
- **Deployment auf AWS**: Die Anwendung wird auf AWS bereitgestellt, einschließlich eines Servers auf EC2 und einer Datenbank in einem Private Subnet.
  - **Containerisierung**: Es wird `Docker Compose` für die Entwicklung verwendet, und in der Produktion – `AWS ECS (Elastic Container Service)` mit automatischer Skalierung.

---

# <span id="russian">**OmniTaskPlanner – Запланированные фичи**</span>

Этот документ содержит список функций, которые **еще не реализованы**, но запланированы для разработки.  

**Что включено в этот файл?**  
- **Фичи MVP** – функционал, который должен быть реализован в первой версии.  
- **Расширенные возможности** – дополнительные улучшения, которые будут добавлены после релиза.  
- **Технические улучшения** – оптимизация базы данных, безопасности, API, DevOps и CI/CD.  

**Что НЕ включено в этот файл?**  
- **Фичи, которые уже реализованы**, находятся в файле `implemented/features.md`.  

Этот документ **обновляется по мере принятия решений о добавлении новых функций**.

---

### **1. Управление задачами**  
OmniTaskPlanner предоставляет удобные инструменты для создания, редактирования и управления задачами:  
- **Создание, редактирование и удаление задач**: пользователи могут быстро добавлять новые задачи, редактировать их и удалять ненужные.  
- **Поддержка вложенных подзадач**: каждая задача может иметь неограниченное количество вложенных подзадач, позволяя структурировать работу по уровням.  
- **Перетаскивание задач (Drag & Drop) во всех системах**: задачи можно перемещать между категориями, статусами и списками через удобный интерфейс Drag & Drop.  
- **Гибкая система сортировки (sort_order)**: у каждой задачи есть числовой параметр `sort_order`, который определяет её порядок в списках. Значение `sort_order` обновляется динамически при перетаскивании задач.
- **Мягкое удаление (`is_deleted = True`) с возможностью восстановления**: удаленные задачи не исчезают сразу, а помечаются как `is_deleted = True`, что позволяет администраторам их восстанавливать.  
- **Восстановление задач**: восстановить удаленную задачу может только администратор. При восстановлении также восстанавливаются все подзадачи и их подзадачи, если они были удалены одновременно с основной задачей.  
- **Корзина (только на фронтенде)**: при удалении задачи она **НЕ** получает `is_deleted = True`, а просто скрывается из основного списка (`inTrash = true`).  
  - Пользователь может либо восстановить задачу, либо подтвердить удаление.  
  - После подтверждения удаления все задачи из "Корзины" отправляются в `bulk-update` с `is_deleted = True` (каскадно).  
  - Задачи, получившие `is_deleted = True`, исчезают из списка навсегда (восстановление пользователем невозможно).
- **Авторазмещение задач**: если до дедлайна остаётся <24 часов, задача автоматически помечается как срочная. Если статус изменён (`To Do` → `In Progress`), задача перемещается в соответствующий столбец Канбана. Просроченные задачи могут автоматически архивироваться.  
- **Архивирование задач**: задачи со статусом `"Done"` **не архивируются автоматически**.  
  - Пользователь сам решает, когда переместить задачу в `"Archived"`, через специальную кнопку.  


### **2. Визуализация задач (методы организации)**  
OmniTaskPlanner поддерживает сразу несколько популярных методов организации задач, позволяя пользователю выбирать наиболее удобный способ отображения:  
- **Классический To-Do список**: стандартный список задач с возможностью их группировки и сортировки.  
- **Канбан-доска**: отображение задач в виде карточек с колонками (`To Do`, `In Progress`, `Done`), которые можно перемещать между статусами.  
- **Матрица Эйзенхауэра**: представление задач в виде квадрантов с осями "Важно/Не важно" и "Срочно/Не срочно".  
- **MoSCoW (Must, Should, Could, Won’t)**: методология расстановки приоритетов задач по четырем категориям важности.  
- **Time Blocking (распределение по календарю)**: возможность привязки задач к конкретным временным слотам для планирования дня.  
- **GTD (Getting Things Done)**: система продуктивности с категоризацией задач по контекстам и проектам.  
- **RICE (Reach, Impact, Confidence, Effort)**: методика оценки задач по критериям влияния и затрат.  
- **Pomodoro**: таймер фокусировки, позволяющий работать с задачами по технике Pomodoro (25 минут работы – 5 минут отдыха).  
- **Drag & Drop поддерживается во всех режимах**:
  - **Канбан**: перемещение задач между статусами `To Do`, `In Progress`, `Done`.  
  - **MoSCoW**: перемещение задач между `Must`, `Should`, `Could`, `Won't`.  
  - **Матрица Эйзенхауэра**: перемещение задач между `Срочно/Не срочно` и `Важно/Не важно`.  
- **GTD (Getting Things Done)**: система продуктивности с категоризацией задач по контекстам и проектам.
  - Визуализация: задачи группируются по "Категориям" (например, "Проект А", "Работа", "Учёба").  
  - Дополнительно: возможность быстрого перемещения задач между контекстами.

- **RICE (Reach, Impact, Confidence, Effort)**: методика оценки задач по критериям влияния и затрат.
  - Визуализация: сортировка задач по взвешенному коэффициенту приоритета `(Reach × Impact × Confidence) ÷ Effort`.  
  - Фильтры: возможность показывать только задачи с наибольшим или наименьшим приоритетом.

### **3. Параметры задач**  
Каждая задача в OmniTaskPlanner может быть дополнена различными характеристиками для лучшей организации:  
- **Теги и категории**: пользователи могут добавлять к задачам теги и категории для удобной группировки.  
- **Статусы задач**: каждая задача имеет статус (`To Do`, `In Progress`, `Done`, `Archived`), который определяет этап её выполнения.  
- **Приоритеты**: у задач есть параметры важности (`Importance`) и срочности (`Urgency`).  
- **Оценка задач**: параметры `Reach`, `Confidence`, `Effort` позволяют оценивать влияние задачи, уровень уверенности в ней и затраты усилий на выполнение.  
- **Срок выполнения (`due_date`)**: возможность установки дедлайна для каждой задачи.  
- **Фильтрация и поиск**: пользователи могут находить задачи по тегам, категориям, статусу, важности и другим параметрам.  
- **Пересчёт `sort_order`**:  
  - При Drag & Drop между статусами `sort_order` пересчитывается с шагом `10`.  
  - Если диапазон `sort_order` переполняется, выполняется перерасчёт всей группы задач.  
  - `sort_order` работает одинаково в `To-Do`, `Канбане` и `Матрице Эйзенхауэра`.  

### **4. Фронтенд (пользовательский интерфейс)**  
- **Выбор между разными представлениями задач**: интерфейс позволяет переключаться между различными методами визуализации (To-Do, Канбан, Эйзенхауэр и т.д.).  
- **Инлайн-редактирование задач**: возможность изменять параметры задач прямо в списках без необходимости открывать отдельное окно редактирования.  
- **Гибкая настройка отображения**: пользователи могут настраивать цвета категорий, порядок отображения задач, скрывать ненужные параметры.  
- **Десктопная и мобильная версии**: помимо веб-версии будет разрабатываться десктопное и мобильное приложение (вопрос, стоит ли их делать отдельными проектами, остаётся открытым).  
- **Bulk-обновление изменений**: все изменения задач копятся на фронтенде и отправляются на сервер одним запросом (`task/bulk` или `task/{id}/bulk`), обновление происходит каждые 10 секунд или при смене представления.
  - **Drag & Drop пересчитывает `sort_order` на фронтенде**, а не на сервере.  
  - **Если задачи перемещены в другой статус**, фронтенд **должен передавать обновлённые `sort_order` в `bulk-update`**.  
  - **API не изменяет `sort_order` автоматически**, а применяет переданные значения.  
  - **При Drag & Drop `sort_order` устанавливается с шагом 10** (если `20 → 30`, новая задача получает `25`).  
  - **Если диапазон `sort_order` переполняется, фронтенд сам инициирует пересчёт всей группы задач**.
- **Ленивая подгрузка задач**: задачи загружаются динамически по мере необходимости, исключая стандартную пагинацию.  
- **Ленивое удаление свернутых задач (UI)**: если задача была свернута, она скрывается из интерфейса и выгружается из памяти, но остаётся доступной при повторном раскрытии.
- **Фильтры "по клику"**: быстрый доступ к задачам по критериям (`Только срочные`, `Только важные`, `Фильтр по тегам/категориям`). Можно комбинировать фильтры для удобства.
- **PWA (Progressive Web App) и офлайн-режим**  
  - **Локальное хранение задач**: все изменения хранятся в `IndexedDB`или `SQLite`, пока нет сети. А затем синхронизироваться при подключении к сети.
  - **Автоматическая синхронизация**:
    - **При появлении сети задачи отправляются в `bulk-update`**.  
  - **Обнаружение конфликтов**:  
    - **Если параметр (`title`) изменился только на клиенте, а (`urgency`) — только на сервере, сервер объединяет изменения**.  
    - **Если один и тот же параметр (`status`) был изменён на клиенте и сервере → UI предлагает выбрать версию**.  
  - **Настройки пользователя**: можно включить или отключить офлайн-режим в настройках.
- **Пересчёт `effective_status` на фронтенде (без запроса к серверу)**  
  - **Если родительская задача "выполнена", все подзадачи временно получают `effective_status = "done"`**.  
  - **При возврате родителя в `To Do` все подзадачи возвращают свой фактический `status`**.  
  - **Обновление `effective_status` выполняется локально, не перегружая сервер.**  

- **Ленивая отправка `bulk-update` (раз в 10 секунд + при смене вида)**  
  - **Все изменения накапливаются в `modifiedTasks`, а затем отправляются `PATCH /tasks/bulk-update/` одним запросом.**  
  - **Если изменений нет, `bulk-update` не отправляется, уменьшая нагрузку на API.**  
  - **При смене представления (`To-Do → Канбан → MoSCoW`) перед переключением вызывается `bulk-update`**.  

- **Обновление UI без ожидания сервера**  
  - **Все изменения применяются локально в `useState()`, а затем отправляются на сервер.**  
  - **При `Drag & Drop` `effective_status` обновляется мгновенно, не дожидаясь ответа от API.**  
  - **Фронтенд получает новые данные раз в 5-10 секунд через `GET /tasks/`.**  

- **Кеширование `effective_status` через `useMemo()`**  
  - **Чтобы избежать лишних ререндеров, используется `useMemo()` для кеширования `effective_status`.**  
  - **Пересчёт происходит только при изменении родительской задачи или списка задач.**  

- **Сохранение изменений в `localStorage` перед закрытием вкладки**  
  - **Если пользователь закрыл вкладку, несохранённые изменения не теряются.**  
  - **Перед закрытием страницы задачи записываются в `localStorage`.**  
  - **При следующем открытии страницы несохранённые изменения загружаются и отправляются в `bulk-update`**.  
- **Автоматический пересчёт `RICE` на фронтенде**
  - **`RICE = (Reach * Impact * Confidence) / Effort` вычисляется локально, без запроса к серверу**.
  - **Если изменяются `reach`, `impact`, `confidence` или `effort`, новый `RICE` пересчитывается мгновенно**.
  - **Сервер может пересчитывать `RICE`, но только при необходимости (например, при `GET /tasks/`).**
  - **Используется `useMemo()` для кэширования значений `RICE`, чтобы не пересчитывать его при каждом ререндере**.
- **Оптимизация Drag & Drop**
  - **Обновление `sort_order` выполняется только для изменённых задач**.
  - **Используется `useMemo()` и `useCallback()` для предотвращения лишних обновлений состояния**.
  - **Если `sort_order` переполняется (например, все задачи получили `sort_order` с минимальным шагом), фронтенд автоматически пересчитывает `sort_order` для всех задач в колонке**.
  - **Поддерживается анимация Drag & Drop для более плавного взаимодействия**.

### **5. Управление sort_order**  
- **sort_order используется с шагом 10**: каждая задача получает числовое значение `sort_order`, определяющее её положение в списке.  
- **Динамическое обновление**: при перемещении задач вычисляется новый `sort_order`, например, если задача перемещается между `20` и `30`, ей присваивается `25`.  
- **Автоматический пересчет**: если диапазон значений `sort_order` заканчивается, происходит перерасчет `sort_order` всей группы задач.  
- **Пересчёт `sort_order` в `bulk`-обновлениях**:  
  - `PATCH /tasks/bulk/` автоматически пересчитывает `sort_order` для всех задач.  
  - Если задачи перемещены в другой статус, `sort_order` пересчитывается динамически.  

### **6. Бэкенд**  
- **PostgreSQL как основная база данных**: используется PostgreSQL для хранения всех данных пользователей и задач.  
- **Django API**: реализуется REST API для работы с фронтендом и мобильными приложениями.  
- **JWT-аутентификация**: используется JSON Web Token для безопасной авторизации пользователей.  
- **Разделение доступа**: задачи пользователей не видны администраторам, но могут быть восстановлены после мягкого удаления.  
- **Отображение количества подзадач**: в интерфейсе будет видно, сколько всего подзадач у задачи и сколько из них уже выполнено.  
- **Ленивая подгрузка (`offset` + `limit`)**: API возвращает задачи по мере необходимости, минимизируя нагрузку на сервер.  
  - **По умолчанию API возвращает только корневые задачи (`parent_task = NULL`)**.  
  - **Подзадачи загружаются динамически при раскрытии задачи (`GET /tasks/{id}/subtasks/`)**.  
  - **Можно запросить вложенные подзадачи через параметр `depth`**:  
    - `GET /tasks/{id}/subtasks/?depth=1` → Загружает только 1 уровень подзадач.  
    - `GET /tasks/{id}/subtasks/?depth=2` → Загружает 2 уровня вложенности.  
  - **Фронтенд может запрашивать только нужный уровень вложенности**, чтобы не загружать сервер лишними данными.
- **Права пользователей**:  
  - **Обычный пользователь** может редактировать только свои задачи.  
  - **Администратор** может восстанавливать удалённые задачи и управлять категориями.  
  - **В будущем возможно добавление бизнес-аккаунтов с командной работой.**  

- **API и вложенные подзадачи**:  
  - `GET /tasks/{id}/subtasks/?depth=1` → Загружает только 1 уровень подзадач.  
  - `GET /tasks/{id}/subtasks/?depth=2` → Загружает 2 уровня вложенности.  

### **7. CI/CD и DevOps**  
- **GitHub Actions для CI/CD**: автоматизация тестирования и деплоя проекта.  
- **Docker-контейнеры**: бэкенд, фронтенд, база данных и Nginx будут упакованы в Docker-контейнеры.
- **Деплой на AWS**: приложение будет развернуто на AWS, включая сервер на EC2 и базу данных в Private Subnet.
  - Контейнеризация: используется `Docker Compose` для разработки, а в продакшене – `AWS ECS (Elastic Container Service)` с автоматическим масштабированием.  

