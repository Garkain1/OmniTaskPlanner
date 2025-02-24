| [**English**](#english) | [**Deutsch**](#german) | [**Русский**](#russian) |
|:-----------------------:|:----------------------:|:-----------------------:|

---

# <span id="english">**Branching and Tagging Strategy in OmniTaskPlanner**</span>

This document outlines:
- The primary development branches and their purposes.
- The workflow for managing branches (features, releases, hotfixes).
- The rules for using tags (for releases, release candidates, and hotfixes).
- The prohibition of direct pushes to the `main`, `develop`, and `production` branches (all changes must be introduced via Pull Requests).

---

## 1. Main Branches

| **Branch**   | **Purpose**                                                                   | **Merged Into?**     |
|--------------|-------------------------------------------------------------------------------|----------------------|
| `develop`    | The central branch for ongoing development                                    | `main`               |
| `main`       | Contains code that is ready for release (although not immediately deployed)   | `production`         |
| `production` | Houses only stable code that is deployed in the live environment              | –                    |
| `feature/*`  | Branches dedicated to developing new features (created from `develop`)        | `develop`            |
| `fix/*`      | Branches intended for bug fixes                                               | `develop`            |
| `release/*`  | Branches used to prepare releases before deployment                           | `main`               |
| `hotfix/*`   | Branches for urgent fixes in the `production` branch                          | `main` and `develop` |
| `docs/*`     | Branches for significant documentation updates                                | `develop`            |
| `test/*`     | Branches for enhancing or refactoring tests                                   | `develop`            |
| `ci/*`       | Branches for updating CI/CD configurations (e.g., GitHub Actions, deployment) | `develop`            |

> **IMPORTANT:** Direct pushes are forbidden.  
> The `main`, `develop`, and `production` branches are protected.  
> **All changes to these branches must be made through Pull Requests**, following a code review.

---

## 2. Branch Workflow

### 2.1. Creating a New Feature (Branch `feature/*`)
1. Switch to the `develop` branch and update it:
   ```bash
   git checkout develop
   git pull origin develop
   ```
2. Create a new branch for the feature:
   ```bash
   git checkout -b feature/new-feature
   ```
3. Make your changes, commit them, and push the branch to the remote repository:
   ```bash
   git add .
   git commit -m "feat: added a new feature"
   git push origin feature/new-feature
   ```
4. Open a **Pull Request to `develop`** on GitHub.  
   > *Direct pushes to `develop` are not allowed.*

### 2.2. Completing a Feature (Pull Request to `develop`)
1. Wait for your Pull Request to `develop` to be approved and merged.
2. Once merged (via GitHub), update your local `develop` branch and delete the local feature branch:
   ```bash
   git checkout develop
   git pull origin develop
   git branch -d feature/new-feature
   ```
3. If you wish to preserve the feature’s commit history as a separate branch, choose the "Create a merge commit" option during the merge (equivalent to using `--no-ff`).

---

### 2.3. Preparing a Release (Branch `release/*`)
1. Ensure that the `develop` branch is stable and ready for a release:
   ```bash
   git checkout develop
   git pull origin develop
   ```
2. Create a release branch:
   ```bash
   git checkout -b release/1.0.0
   ```
3. In the `release/1.0.0` branch, address any bugs, update the documentation, and add final tests.
4. Push the branch to the remote repository and open a Pull Request to `main`:
   ```bash
   git push origin release/1.0.0
   ```
5. After the Pull Request is approved and merged into `main`, integrate those changes back into `develop`.  
   - This is typically done by opening an additional Pull Request from `release/1.0.0` to `develop` or by manually merging from `main` into `develop` to synchronize the changes.
6. Once merged, delete the local release branch:
   ```bash
   git checkout develop
   git pull origin develop
   git branch -d release/1.0.0
   ```

---

### 2.4. Deploying to Production (Branch `production`)
1. After merging the release into `main` and performing further validations, merge the changes into the `production` branch. Since direct pushes are prohibited:
   - Open a Pull Request from `main` to `production`.
   - Wait for the approval and merge.
2. If a CI/CD pipeline is configured, merging into `production` will automatically trigger the deployment process.

---

### 2.5. Urgent Hotfix (Branch `hotfix/*`)
1. If a critical error is identified in production, create a hotfix branch from `production`:
   ```bash
   git checkout production
   git pull origin production
   git checkout -b hotfix/urgent-fix
   ```
2. Fix the error, commit the changes, and push the branch:
   ```bash
   git add .
   git commit -m "fix: urgent bug fix in production"
   git push origin hotfix/urgent-fix
   ```
3. Open two Pull Requests:
   - One from `hotfix/urgent-fix` to `main` (to update the release-ready code).
   - Another from `hotfix/urgent-fix` to `develop` (to synchronize the development branch).
4. After merging the hotfix into `main`, merge the changes into `production` as well (by opening a Pull Request from `main` to `production`).
5. Delete the local hotfix branch:
   ```bash
   git branch -d hotfix/urgent-fix
   ```

---

## 3. Tag Usage

| **Tag Type**         | **Example**      | **Description**                        |
|----------------------|------------------|----------------------------------------|
| Releases             | `v1.0.0`         | The final, stable release              |
| Release Candidates   | `v1.0.0-rc1`     | A test candidate for the release       |
| Hotfixes             | `hotfix-1.0.1`   | An urgent fix for a bug                |

### 3.1. Creating an Annotated Tag
Annotated tags include metadata (author, date, and comment). For example:
```bash
git tag -a v1.0.0 -m "Release 1.0.0 - description of changes"
git push origin v1.0.0
```

### 3.2. Viewing Tags
```bash
git tag
git show v1.0.0
```

### 3.3. Deleting a Tag
```bash
git tag -d v1.0.0
git push origin --delete v1.0.0
```

---

## 4. Useful Commands

### 4.1. Common Preparatory Steps
```bash
git checkout develop
git pull origin develop
```

### 4.2. Checking Repository Status
```bash
git status
git branch
```

### 4.3. A Concise Commit Log
```bash
git log --oneline --graph --all
```

### 4.4. Deleting Local Branches After Merging
```bash
git branch -d feature/some-old-branch
```

---

## 5. Conclusion

This branching and tagging strategy ensures:
- An organized and clear commit history.
- Minimal conflicts during collaborative development.
- Stable code through thorough testing and code reviews conducted in separate branches.
- Safety and prevention of accidental changes in critical branches (`develop`, `main`, `production`), as direct pushes are prohibited.

Should you have any questions, please contact the project leader or consult the additional Git documentation. Adhering to this strategy will help maintain high code quality and accelerate the development process.

---

# <span id="german">**Branching- und Tagging-Strategie in OmniTaskPlanner**</span>

Dieses Dokument beschreibt:
- Die primären Entwicklungszweige und deren jeweilige Aufgaben.
- Den Arbeitsablauf beim Umgang mit Branches (Features, Releases, Hotfixes).
- Die Regeln für die Verwendung von Tags (für Releases, Release-Kandidaten und Hotfixes).
- Das Verbot direkter Pushes in die Branches `main`, `develop` und `production` (alle Änderungen erfolgen ausschließlich über Pull Requests).

---

## 1. Hauptzweige

| **Branch**   | **Aufgabe**                                                                              | **Wohin wird gemerged?** |
|--------------|------------------------------------------------------------------------------------------|--------------------------|
| `develop`    | Der zentrale Branch für die laufende Entwicklung                                         | `main`                   |
| `main`       | Enthält den Code, der für einen Release bereit ist (wird jedoch nicht sofort deployed)   | `production`             |
| `production` | Beinhaltet ausschließlich stabilen Code, der in der Live-Umgebung eingesetzt wird        | –                        |
| `feature/*`  | Branches zur Entwicklung neuer Funktionen (werden vom Branch `develop` erstellt)         | `develop`                |
| `fix/*`      | Branches zur Behebung von Fehlern                                                        | `develop`                |
| `release/*`  | Branches, die zur Vorbereitung von Releases vor der Veröffentlichung genutzt werden      | `main`                   |
| `hotfix/*`   | Branches für dringende Korrekturen im `production`-Branch                                | `main` und `develop`     |
| `docs/*`     | Branches für umfangreiche Aktualisierungen der Dokumentation                             | `develop`                |
| `test/*`     | Branches zur Verbesserung oder Umstrukturierung von Tests                                | `develop`                |
| `ci/*`       | Branches zur Aktualisierung der CI/CD-Konfigurationen (z. B. GitHub Actions, Deployment) | `develop`                |

> **WICHTIG:** Direkte Pushes sind untersagt.  
> Die Branches `main`, `develop` und `production` sind geschützt.  
> **Alle Änderungen an diesen Branches erfolgen ausschließlich über Pull Requests**, nachdem ein Code-Review stattgefunden hat.

---

## 2. Arbeitsablauf mit den Branches

### 2.1. Erstellung einer neuen Funktionalität (Branch `feature/*`)
1. Wechseln Sie zum Branch `develop` und aktualisieren Sie ihn:
   ```bash
   git checkout develop
   git pull origin develop
   ```
2. Erstellen Sie einen neuen Branch für die Funktionalität:
   ```bash
   git checkout -b feature/new-feature
   ```
3. Nehmen Sie Ihre Änderungen vor, committen Sie diese und pushen Sie den Branch in das entfernte Repository:
   ```bash
   git add .
   git commit -m "feat: neue Funktionalität hinzugefügt"
   git push origin feature/new-feature
   ```
4. Eröffnen Sie einen **Pull Request nach `develop`** über GitHub.  
   > *Direkte Pushes nach `develop` sind nicht gestattet.*

### 2.2. Abschluss der Funktionalität (Pull Request nach `develop`)
1. Warten Sie, bis Ihr Pull Request in `develop` genehmigt und gemerged wurde.
2. Nachdem der Merge (über GitHub) erfolgt ist, aktualisieren Sie den lokalen Branch `develop` und löschen Sie den lokalen Feature-Branch:
   ```bash
   git checkout develop
   git pull origin develop
   git branch -d feature/new-feature
   ```
3. Falls es erforderlich ist, die Commit-Historie der Funktionalität als eigenständigen Branch zu erhalten, wählen Sie während des Merges in GitHub die Option „Create a merge commit“ (entspricht `--no-ff`).

---

### 2.3. Vorbereitung eines Releases (Branch `release/*`)
1. Stellen Sie sicher, dass der Branch `develop` stabil ist und für ein Release bereitsteht:
   ```bash
   git checkout develop
   git pull origin develop
   ```
2. Erstellen Sie einen Release-Branch:
   ```bash
   git checkout -b release/1.0.0
   ```
3. Im Branch `release/1.0.0` beheben Sie Fehler, aktualisieren die Dokumentation und fügen abschließende Tests hinzu.
4. Pushen Sie den Branch in das entfernte Repository und eröffnen Sie einen Pull Request nach `main`:
   ```bash
   git push origin release/1.0.0
   ```
5. Nachdem der Pull Request in `main` genehmigt und gemerged wurde, müssen dieselben Änderungen zurück in den `develop`-Branch integriert werden.  
   - Dies geschieht üblicherweise durch einen zusätzlichen Pull Request von `release/1.0.0` nach `develop` oder durch manuelles Mergen von `main` in `develop`, um die Änderungen zu synchronisieren.
6. Nach dem Merge löschen Sie den lokalen Release-Branch:
   ```bash
   git checkout develop
   git pull origin develop
   git branch -d release/1.0.0
   ```

---

### 2.4. Deployment in die Produktionsumgebung (Branch `production`)
1. Nachdem der Release in `main` gemerged und weitere Prüfungen durchgeführt wurden, führen Sie einen Merge der Änderungen in den Branch `production` durch. Da direkte Pushes nicht gestattet sind:
   - Eröffnen Sie einen Pull Request von `main` nach `production`.
   - Warten Sie auf die Genehmigung und den Merge.
2. Falls ein CI/CD-System eingerichtet ist, wird beim Merge in den Branch `production` automatisch der Deployment-Prozess gestartet.

---

### 2.5. Dringender Hotfix (Branch `hotfix/*`)
1. Wird ein kritischer Fehler in der Produktionsumgebung festgestellt, erstellen Sie einen Hotfix-Branch aus `production`:
   ```bash
   git checkout production
   git pull origin production
   git checkout -b hotfix/urgent-fix
   ```
2. Beheben Sie den Fehler, committen Sie die Änderungen und pushen Sie den Branch:
   ```bash
   git add .
   git commit -m "fix: urgent bug fix in production"
   git push origin hotfix/urgent-fix
   ```
3. Eröffnen Sie zwei Pull Requests:
   - Einen von `hotfix/urgent-fix` nach `main` (um den releasebereiten Code zu aktualisieren).
   - Einen weiteren von `hotfix/urgent-fix` nach `develop` (um den Entwicklungs-Branch zu synchronisieren).
4. Nachdem der Hotfix in `main` gemerged wurde, führen Sie auch einen Merge in den Branch `production` durch (Pull Request von `main` nach `production`).
5. Löschen Sie den lokalen Hotfix-Branch:
   ```bash
   git branch -d hotfix/urgent-fix
   ```

---

## 3. Verwendung von Tags

| **Tag-Typ**        | **Beispiel**   | **Beschreibung**                 |
|--------------------|----------------|----------------------------------|
| Releases           | `v1.0.0`       | Der finale, stabile Release      |
| Release-Kandidaten | `v1.0.0-rc1`   | Ein Testkandidat für den Release |
| Hotfixes           | `hotfix-1.0.1` | Eine dringende Fehlerbehebung    |

### 3.1. Erstellen eines annotierten Tags
Annotierte Tags beinhalten Metadaten (Autor, Datum und Kommentar). Zum Beispiel:
```bash
git tag -a v1.0.0 -m "Release 1.0.0 - description of changes"
git push origin v1.0.0
```

### 3.2. Anzeigen von Tags
```bash
git tag
git show v1.0.0
```

### 3.3. Löschen eines Tags
```bash
git tag -d v1.0.0
git push origin --delete v1.0.0
```

---

## 4. Nützliche Befehle

### 4.1. Allgemeine Vorbereitungen
```bash
git checkout develop
git pull origin develop
```

### 4.2. Überprüfung des Repository-Status
```bash
git status
git branch
```

### 4.3. Kurze Commit-Historie
```bash
git log --oneline --graph --all
```

### 4.4. Löschen lokaler Branches nach einem Merge
```bash
git branch -d feature/some-old-branch
```

---

## 5. Fazit

Diese Branching- und Tagging-Strategie gewährleistet:
- Eine übersichtliche und strukturierte Commit-Historie.
- Minimale Konflikte während der teamübergreifenden Entwicklung.
- Stabilen Code dank umfassender Tests und Code-Reviews in separaten Branches.
- Sicherheit und die Vermeidung unbeabsichtigter Änderungen in kritischen Branches (`develop`, `main`, `production`), da direkte Pushes nicht gestattet sind.

Bei Fragen wenden Sie sich bitte an den Projektleiter oder konsultieren Sie weiterführende Git-Dokumentationen. Die Einhaltung dieser Strategie trägt dazu bei, eine hohe Codequalität zu sichern und den Entwicklungsprozess zu beschleunigen.

---

# <span id="russian">**Стратегия ветвления и тегирования в OmniTaskPlanner**</span>

Данный документ описывает:
- Основные ветки разработки и их назначение.
- Порядок работы с ветками (фичи, релизы, хотфиксы).
- Правила использования тегов (релизы, релиз-кандидаты, хотфиксы).
- Запрет прямых пушей в ветки `main`, `develop` и `production` (изменения вносятся только через Pull Request).

---

## 1. Основные ветки

| **Ветка**    | **Назначение**                                              | **Куда мержится?** |
|--------------|-------------------------------------------------------------|--------------------|
| `develop`    | Основная ветка разработки                                   | `main`             |
| `main`       | Код, готовый к релизу (но не деплоится сразу)               | `production`       |
| `production` | Только стабильный код, разворачиваемый в рабочей среде      | –                  |
| `feature/*`  | Ветки для разработки новых функций (создаются из `develop`) | `develop`          |
| `fix/*`      | Ветки для исправления багов                                 | `develop`          |
| `release/*`  | Ветки для подготовки релизов перед выпуском                 | `main`             |
| `hotfix/*`   | Срочные исправления для ветки `production`                  | `main` и `develop` |
| `docs/*`     | Ветки для крупных обновлений документации                   | `develop`          |
| `test/*`     | Ветки для улучшения или рефакторинга тестов                 | `develop`          |
| `ci/*`       | Ветки для обновления CI/CD (GitHub Actions, деплой)         | `develop`          |

> **ВАЖНО:** Запрет прямых пушей
> Ветки `main`, `develop` и `production` защищены. Прямые пуши в них запрещены.  
> **Изменения в эти ветки вносятся только через Pull Request**, после одобрения код-ревью.

---

## 2. Порядок работы с ветками

### 2.1. Создание новой функциональности (ветки `feature/*`)
1. Переключитесь на `develop` и обновите её:
   ```bash
   git checkout develop
   git pull origin develop
   ```
2. Создайте ветку для новой фичи:
   ```bash
   git checkout -b feature/new-feature
   ```
3. Внесите изменения, зафиксируйте их и отправьте в удалённый репозиторий:
   ```bash
   git add .
   git commit -m "feat: добавлена новая функция"
   git push origin feature/new-feature
   ```
4. Создайте **Pull Request в `develop`** через GitHub.  
   >  *Прямой пуш в `develop` невозможен.*  

### 2.2. Завершение фичи (Pull Request в `develop`)
1. Дождитесь, пока ваш Pull Request в `develop` будет одобрен и слит.  
2. После слияния (через GitHub) обновите локальную ветку `develop` и удалите локальную ветку фичи:
   ```bash
   git checkout develop
   git pull origin develop
   git branch -d feature/new-feature
   ```
3. Если необходимо сохранить историю коммитов фичи в виде отдельной ветки, при слиянии в GitHub используйте опцию "Create a merge commit" (аналог `--no-ff`).

---

### 2.3. Подготовка релиза (ветки `release/*`)
1. Убедитесь, что `develop` стабилен и готов к релизу:
   ```bash
   git checkout develop
   git pull origin develop
   ```
2. Создайте ветку релиза:
   ```bash
   git checkout -b release/1.0.0
   ```
3. В ветке `release/1.0.0` исправляйте баги, обновляйте документацию, пишите финальные тесты.  
4. Отправьте ветку в удалённый репозиторий и создайте Pull Request в `main`:
   ```bash
   git push origin release/1.0.0
   ```
5. После одобрения и слияния Pull Request (в `main`) необходимо внести те же изменения обратно в `develop`.  
   - Обычно делают дополнительный Pull Request из `release/1.0.0` в `develop`, либо вручную из `main` в `develop`, чтобы синхронизировать изменения.
6. После слияния освободите локальную ветку:
   ```bash
   git checkout develop
   git pull origin develop
   git branch -d release/1.0.0
   ```

---

### 2.4. Деплой на продакшен (ветка `production`)
1. После слияния релиза в `main` и дополнительных проверок необходимо слить изменения в `production`. Прямой пуш запрещён, поэтому:
   - Создайте Pull Request из `main` в `production`.
   - Дождитесь одобрения и слияния.
2. Если настроен CI/CD, в момент слияния в `production` запускается процесс автоматического деплоя.

---

### 2.5. Срочный хотфикс (ветки `hotfix/*`)
1. Если обнаружена критическая ошибка в продакшене, создайте ветку хотфикса из `production`:
   ```bash
   git checkout production
   git pull origin production
   git checkout -b hotfix/urgent-fix
   ```
2. Исправьте ошибку, зафиксируйте и отправьте изменения:
   ```bash
   git add .
   git commit -m "fix: urgent bug fix in production"
   git push origin hotfix/urgent-fix
   ```
3. Создайте два Pull Request:
   - Из `hotfix/urgent-fix` в `main` (для обновления кода, готового к релизу).
   - Из `hotfix/urgent-fix` в `develop` (чтобы синхронизировать ветку разработки).
4. После слияния хотфикса в `main` нужно также замержить изменения в `production` (Pull Request из `main` в `production`).
5. Удалите локальную ветку:
   ```bash
   git branch -d hotfix/urgent-fix
   ```

---

## 3. Использование тегов

| **Тип тега**    | **Пример**     | **Описание**               |
|-----------------|----------------|----------------------------|
| Релизы          | `v1.0.0`       | Финальный стабильный релиз |
| Релиз-кандидаты | `v1.0.0-rc1`   | Тестовый кандидат на релиз |
| Хотфиксы        | `hotfix-1.0.1` | Срочное исправление ошибки |

### 3.1. Создание аннотированного тега
Аннотированные теги содержат метаданные (автора, дату и комментарий). Пример:
```bash
git tag -a v1.0.0 -m "Release 1.0.0 - description of changes"
git push origin v1.0.0
```

### 3.2. Просмотр тегов
```bash
git tag
git show v1.0.0
```

### 3.3. Удаление тега
```bash
git tag -d v1.0.0
git push origin --delete v1.0.0
```

---

## 4. Полезные команды

### 4.1. Общие действия перед началом работы
```bash
git checkout develop
git pull origin develop
```

### 4.2. Проверка статуса репозитория
```bash
git status
git branch
```

### 4.3. Сокращённый лог коммитов
```bash
git log --oneline --graph --all
```

### 4.4. Удаление локальных веток после мержа
```bash
git branch -d feature/some-old-branch
```

---

## 5. Заключение

Данная стратегия ветвления и тегирования обеспечивает:
- Упорядоченную историю коммитов.
- Минимизацию конфликтов при командной разработке.
- Стабильность кода за счёт тестирования и код-ревью в отдельных ветках.
- Безопасность и предотвращение случайных изменений в критичных ветках (`develop`, `main`, `production`), так как в них запрещён прямой пуш.

При возникновении вопросов обращайтесь к руководителю проекта или к дополнительной документации по Git. Соблюдение данной стратегии позволит поддерживать высокое качество кода и ускорит процесс разработки.
