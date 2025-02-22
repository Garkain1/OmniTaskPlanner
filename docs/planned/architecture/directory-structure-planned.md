| [**English**](#english) | [**Deutsch**](#german) | [**Русский**](#russian) |
|:-----------------------:|:----------------------:|:-----------------------:|

---

# <span id="english">Planned Directory Structure for OmniTaskPlanner</span>

```plaintext
OmniTaskPlanner/
│
├── backend/                      # Main backend code (Django)
│   ├── apps/                     # Django applications
│   │   ├── tasks/                # Unified application (Tasks + Tags + Categories + Time Blocks)
│   │   │   ├── models/           # Splitting models into separate files
│   │   │   │   ├── __init__.py   # Import all models
│   │   │   │   ├── task.py       # Task model
│   │   │   │   ├── category.py   # Category model
│   │   │   │   ├── tag.py        # Tag model
│   │   │   │   └── timeblock.py  # Time block model
│   │   │   ├── serializers/      # Splitting serializers
│   │   │   │   ├── __init__.py
│   │   │   │   ├── task.py       # Task serializer
│   │   │   │   ├── category.py   # Category serializer
│   │   │   │   ├── tag.py        # Tag serializer
│   │   │   │   └── timeblock.py  # Time block serializer
│   │   │   ├── views/            # Splitting views
│   │   │   │   ├── __init__.py
│   │   │   │   ├── task.py       # Task views
│   │   │   │   ├── category.py   # Category views
│   │   │   │   ├── tag.py        # Tag views
│   │   │   │   └── timeblock.py  # Time block views
│   │   │   ├── services/         # Business logic (to keep views clean)
│   │   │   │   ├── __init__.py
│   │   │   │   ├── task.py       # Task business logic
│   │   │   │   ├── category.py   # Category business logic
│   │   │   │   ├── tag.py        # Tag business logic
│   │   │   │   └── timeblock.py  # Time block business logic
│   │   │   └── tests/            # Tests
│   │   │       ├── unit/         # Unit tests
│   │   │       ├── integration/  # Integration tests
│   │   │       └── e2e/          # End-to-End tests
│   │   ├── users/                # Separate application for users
│   │   │   ├── models.py         # User model
│   │   │   ├── serializers.py    # API serializers
│   │   │   ├── services.py       # User business logic
│   │   │   └── views.py          # API views
│   │   └── admin_panel/
│   │       ├── __init__.py
│   │       ├── actions.py        # Custom admin actions
│   │       ├── filters.py        # Filters for Django Admin
│   │       ├── mixins.py         # Reusable extensions and utilities for admin
│   │       ├── forms.py          # Forms for admin
│   │       ├── task/
│   │       │   ├── __init__.py
│   │       │   └── admin.py      # Admin panel for tasks
│   │       ├── category/
│   │       │   ├── __init__.py
│   │       │   └── admin.py      # Admin panel for categories
│   │       ├── tag/
│   │       │   ├── __init__.py
│   │       │   └── admin.py      # Admin panel for tags
│   │       ├── timeblock/
│   │       │   ├── __init__.py
│   │       │   └── admin.py      # Admin panel for time blocks
│   │       ├── user/
│   │       │   ├── __init__.py
│   │       │   └── admin.py      # Admin panel for users
│   │       └── tests/            # Tests
│   │           ├── test_access.py           # Testing admin access
│   │           ├── test_task_admin.py       # Testing TaskAdmin display and CRUD operations
│   │           ├── test_admin_actions.py    # Testing custom admin actions
│   │           ├── test_category_admin.py   # Testing category admin
│   │           ├── test_tag_admin.py        # Testing tag admin
│   │           └── test_timeblock_admin.py  # Testing time block admin
│   ├── common/                    # Common utilities
│   │   ├── choices/               # Module with choices
│   │   │   ├── __init__.py
│   │   │   ├── task.py            # Choices for Task
│   │   │   ├── category.py        # Choices for Category
│   │   │   ├── tag.py             # Choices for Tag
│   │   │   ├── timeblock.py       # Choices for TimeBlock
│   │   │   └── user.py            # Choices for User
│   │   ├── middlewares/           # Middleware module
│   │   │   ├── __init__.py        # For import as a Python module
│   │   │   ├── request_logger.py  # Request logging
│   │   │   ├── auth_middleware.py # Additional authorization checks
│   │   │   └── security.py        # Additional security measures
│   │   ├── utils.py               # Helper functions
│   │   └── validators.py          # Common validators
│   ├── routers/
│   │   ├── __init__.py 
│   │   ├── tasks.py               # Routers for tasks
│   │   ├── users.py               # Routers for users
│   │   └── admin.py               # Routers for admin panel
│   ├── config/                    # Django configuration
│   └── manage.py                  # Entry point for Django
│
├── frontend/                                 # Frontend (React/Vue)
│   ├── src/                                  # Frontend source code
│   │   ├── components/                       # Components
│   │   │   ├── TaskCard.vue                  # Task component (Vue)
│   │   │   ├── TaskCard.tsx                  # Task component (React)
│   │   │   └── __tests__/                    # Unit tests for components
│   │   │       ├── test_task_card.spec.js    # Test TaskCard.vue (Vue)
│   │   │       └── test_task_card.tsx        # Test TaskCard.tsx (React)
│   │   ├── pages/                            # Pages
│   │   │   ├── TaskList.vue                  # Task list page (Vue)
│   │   │   ├── TaskList.tsx                  # Task list page (React)
│   │   │   └── __tests__/                    # Unit tests for pages
│   │   │       ├── test_task_list.spec.js    # Test TaskList.vue (Vue)
│   │   │       └── test_task_list.tsx        # Test TaskList.tsx (React)
│   │   └── store/                            # State store (Vuex, Pinia, Redux)
│   │       ├── taskStore.js                  # Vuex store for tasks
│   │       ├── taskSlice.ts                  # Redux slice for tasks
│   │       └── __tests__/                    # State tests (Redux, Vuex)
│   │           ├── test_task_store.js        # Test for taskStore.js (Vuex)
│   │           └── test_task_slice.ts        # Test for taskSlice.ts (Redux)
│   ├── public/                               # Static files
│   ├── tests/                                # Global frontend tests
│   │   ├── integration/                      # Integration tests
│   │   │   ├── test_api_integration.spec.js  # API integration test
│   │   │   └── test_task_list_integration.js # Test for task list integration
│   │   ├── e2e/                              # End-to-End tests (Cypress, Playwright)
│   │   │   ├── test_add_task.spec.js         # UI test for adding a task
│   │   │   └── test_task_list.spec.js        # UI test for task list
│   │   └── performance/                      # Load tests (Lighthouse, WebPageTest)
│   │       └── test_performance.spec.js      # Performance check/test
│   ├── package.json                          # Node.js dependencies
│   ├── jest.config.js                        # Jest configuration
│   ├── playwright.config.ts                  # Playwright configuration
│   └── cypress.config.js                     # Cypress configuration
│
├── infra/
│   └── docker/                   # Docker files (without docker-compose.yml)
│       ├── backend/              # Dockerfile for Django
│       │   ├── .dockerignore     # Exclusions for the backend
│       │   ├── Dockerfile        # Dockerfile for the backend
│       │   └── entrypoint.sh     # Server startup script
│       ├── frontend/             # Dockerfile for the frontend
│       │   ├── .dockerignore     # Exclusions for the frontend
│       │   └── Dockerfile        # Dockerfile for the frontend
│       └── nginx.conf            # Nginx configuration
│
├── tests/                        # Global tests (E2E, Performance)
│   ├── load_tests/               # Load testing
│   └── contract_tests/           # API contract tests
│
├── .github/                      # Automation and community files
│   ├── ISSUE_TEMPLATE/
│   │   ├── bug_report.md         # Bug report template
│   │   └── feature_request.md    # Feature request template
│   ├── PULL_REQUEST_TEMPLATE.md  # Pull Request template
│   ├── SECURITY.md               # Security policy
│   └── CODEOWNERS                # Code owners
│
├── docs/                                  # Project documentation
│   ├── OVERVIEW.md                        # Main project overview
│   ├── planned/                           # Planned functionality (not yet implemented)
│   │   ├── features.md                    # Future MVP features (WIP)
│   │   ├── architecture/                  # Planned architecture
│   │   │   ├── er-diagram-planned.svg     # Planned database ER diagram
│   │   │   ├── server-diagram-planned.svg # Proposed deployment concept
│   │   │   └── architecture-planned.md    # Planned architecture description
│   │   └── api-spec.md                    # Planned API changes
│   ├── developers/                        # Developer documentation
│   │   ├── api/                           # API documentation
│   │   │   ├── openapi.yaml               # OpenAPI specification
│   │   │   └── endpoints.md               # Human-readable API description
│   │   ├── db-schema/                     # Database
│   │   │   ├── db-schema.md               # Database structure description (SQL)
│   │   │   ├── db-schema.dbml             # DBML database description
│   │   │   ├── migrations.md              # How to manage migrations
│   │   │   └── er-diagram.svg             # Current ER diagram
│   │   ├── deployment/                    # Deployment instructions
│   │   │   ├── docker.md                  # Deployment via Docker
│   │   │   ├── ci-cd.md                   # CI/CD automation
│   │   │   └── server-diagram.svg         # Actual server deployment
│   │   ├── testing/                       # Testing documentation
│   │   │   ├── strategy.md                # Overall testing strategy
│   │   │   ├── backend.md                 # Backend testing
│   │   │   └── frontend.md                # Frontend testing
│   │   ├── design/                        # UI/UX design
│   │   │   ├── wireframes/                # Interface wireframes
│   │   │   └── figma-link.md              # Link to Figma design
│   │   ├── git-branches.md                # How Git branches work
│   │   ├── best-practices.md              # Code style, versioning, and best practices
│   │   ├── contributors.md                # Information for developers
│   │   └── features.md                    # Completed MVP features (DONE)
│   └── users/                             # User documentation
│       ├── getting-started.md             # How to start using OmniTaskPlanner
│       ├── user-manual.md                 # UI guide
│       ├── shortcuts.md                   # Keyboard shortcuts and convenient features
│       └── troubleshooting.md             # Troubleshooting
│
├── docker-compose.yml            # Container composition
├── .env                          # Environment variables
├── .gitignore                    # Git ignored files
├── README.md                     # Main project documentation
├── LICENSE                       # Project license
├── CODE_OF_CONDUCT.md            # Code of conduct
├── CONTRIBUTING.md               # Developer guide
├── SECURITY.md                   # Security policy
├── CHANGELOG.md                  # Changelog
├── MAINTAINERS.md                # Project maintainers
├── ROADMAP.md                    # Development roadmap
└── FAQ.md                        # Frequently Asked Questions

```

---

# <span id="german">Geplante Verzeichnisstruktur für OmniTaskPlanner</span>

```plaintext
OmniTaskPlanner/
│
├── backend/                      # Haupt-Backend-Code (Django)
│   ├── apps/                     # Django-Anwendungen
│   │   ├── tasks/                # Integrierte Anwendung (Aufgaben + Tags + Kategorien + Zeitblöcke)
│   │   │   ├── models/           # Aufteilen der Modelle in separate Dateien
│   │   │   │   ├── __init__.py   # Alle Modelle importieren
│   │   │   │   ├── task.py       # Aufgabenmodell
│   │   │   │   ├── category.py   # Kategorienmodell
│   │   │   │   ├── tag.py        # Tag-Modell
│   │   │   │   └── timeblock.py  # Zeitblock-Modell
│   │   │   ├── serializers/      # Aufteilen der Serialisierer
│   │   │   │   ├── __init__.py
│   │   │   │   ├── task.py       # Aufgaben-Serialisierer
│   │   │   │   ├── category.py   # Kategorien-Serialisierer
│   │   │   │   ├── tag.py        # Tag-Serialisierer
│   │   │   │   └── timeblock.py  # Zeitblock-Serialisierer
│   │   │   ├── views/            # Aufteilen der Views
│   │   │   │   ├── __init__.py
│   │   │   │   ├── task.py       # Aufgaben-Views
│   │   │   │   ├── category.py   # Kategorien-Views
│   │   │   │   ├── tag.py        # Tag-Views
│   │   │   │   └── timeblock.py  # Zeitblock-Views
│   │   │   ├── services/         # Geschäftslogik (um die Views übersichtlich zu halten)
│   │   │   │   ├── __init__.py
│   │   │   │   ├── task.py       # Geschäftslogik für Aufgaben
│   │   │   │   ├── category.py   # Geschäftslogik für Kategorien
│   │   │   │   ├── tag.py        # Geschäftslogik für Tags
│   │   │   │   └── timeblock.py  # Geschäftslogik für Zeitblöcke
│   │   │   └── tests/            # Tests
│   │   │       ├── unit/         # Unit-Tests
│   │   │       ├── integration/  # Integrationstests
│   │   │       └── e2e/          # End-to-End-Tests
│   │   ├── users/                # Separates Anwendung für Benutzer
│   │   │   ├── models.py         # Benutzermodell
│   │   │   ├── serializers.py    # API-Serialisierer
│   │   │   ├── services.py       # Geschäftslogik für Benutzer
│   │   │   └── views.py          # API-Views
│   │   └── admin_panel/
│   │       ├── __init__.py
│   │       ├── actions.py        # Benutzerdefinierte Aktionen im Admin-Bereich
│   │       ├── filters.py        # Filter für Django Admin
│   │       ├── mixins.py         # Erweiterungen und Hilfsprogramme für die Wiederverwendung im Admin
│   │       ├── forms.py          # Formulare für den Admin-Bereich
│   │       ├── task/
│   │       │   ├── __init__.py
│   │       │   └── admin.py      # Admin-Bereich für Aufgaben
│   │       ├── category/
│   │       │   ├── __init__.py
│   │       │   └── admin.py      # Admin-Bereich für Kategorien
│   │       ├── tag/
│   │       │   ├── __init__.py
│   │       │   └── admin.py      # Admin-Bereich für Tags
│   │       ├── timeblock/
│   │       │   ├── __init__.py
│   │       │   └── admin.py      # Admin-Bereich für Zeitblöcke
│   │       ├── user/
│   │       │   ├── __init__.py
│   │       │   └── admin.py      # Admin-Bereich für Benutzer
│   │       └── tests/            # Tests
│   │           ├── test_access.py           # Testen des Admin-Zugriffs
│   │           ├── test_task_admin.py       # Testen der Darstellung und CRUD-Operationen in TaskAdmin
│   │           ├── test_admin_actions.py    # Testen der benutzerdefinierten Aktionen
│   │           ├── test_category_admin.py   # Testen der Kategorie-Admin
│   │           ├── test_tag_admin.py        # Testen der Tag-Admin
│   │           └── test_timeblock_admin.py  # Testen der Zeitblock-Admin
│   ├── common/                    # Allgemeine Hilfsprogramme
│   │   ├── choices/               # Modul mit Choices
│   │   │   ├── __init__.py
│   │   │   ├── task.py            # Auswahloptionen für Aufgaben
│   │   │   ├── category.py        # Auswahloptionen für Kategorien
│   │   │   ├── tag.py             # Auswahloptionen für Tags
│   │   │   ├── timeblock.py       # Auswahloptionen für Zeitblöcke
│   │   │   └── user.py            # Auswahloptionen für Benutzer
│   │   ├── middlewares/           # Middleware-Modul
│   │   │   ├── __init__.py        # Zum Importieren als Python-Modul
│   │   │   ├── request_logger.py  # Anfragen-Logging
│   │   │   ├── auth_middleware.py # Zusätzliche Autorisierungsprüfungen
│   │   │   └── security.py        # Zusätzliche Sicherheitsmaßnahmen
│   │   ├── utils.py               # Hilfsfunktionen
│   │   └── validators.py          # Gemeinsame Validatoren
│   ├── routers/
│   │   ├── __init__.py
│   │   ├── tasks.py               # Router für Aufgaben
│   │   ├── users.py               # Router für Benutzer
│   │   └── admin.py               # Router für den Admin-Bereich
│   ├── config/                    # Django-Konfiguration
│   └── manage.py                  # Einstiegsdatei für Django
│
├── frontend/                                 # Frontend (React/Vue)
│   ├── src/                                  # Quellcode des Frontends
│   │   ├── components/                       # Komponenten
│   │   │   ├── TaskCard.vue                  # Aufgabenkomponente (Vue)
│   │   │   ├── TaskCard.tsx                  # Aufgabenkomponente (React)
│   │   │   └── __tests__/                    # Unit-Tests der Komponenten
│   │   │       ├── test_task_card.spec.js    # Test für TaskCard.vue (Vue)
│   │   │       └── test_task_card.tsx        # Test für TaskCard.tsx (React)
│   │   ├── pages/                            # Seiten
│   │   │   ├── TaskList.vue                  # Aufgabenlisten-Seite (Vue)
│   │   │   ├── TaskList.tsx                  # Aufgabenlisten-Seite (React)
│   │   │   └── __tests__/                    # Unit-Tests der Seiten
│   │   │       ├── test_task_list.spec.js    # Test für TaskList.vue (Vue)
│   │   │       └── test_task_list.tsx        # Test für TaskList.tsx (React)
│   │   └── store/                            # State-Store (Vuex, Pinia, Redux)
│   │       ├── taskStore.js                  # Vuex Store für Aufgaben
│   │       ├── taskSlice.ts                  # Redux-Slice für Aufgaben
│   │       └── __tests__/                    # State-Tests (Redux, Vuex)
│   │           ├── test_task_store.js        # Test für taskStore.js (Vuex)
│   │           └── test_task_slice.ts        # Test für taskSlice.ts (Redux)
│   ├── public/                               # Statische Dateien
│   ├── tests/                                # Globale Frontend-Tests
│   │   ├── integration/                      # Integrationstests
│   │   │   ├── test_api_integration.spec.js  # API-Integrationstest
│   │   │   └── test_task_list_integration.js # Test für die Aufgabenlisten-Integration
│   │   ├── e2e/                              # End-to-End-Tests (Cypress, Playwright)
│   │   │   ├── test_add_task.spec.js         # UI-Test zum Hinzufügen einer Aufgabe
│   │   │   └── test_task_list.spec.js        # UI-Test für Aufgabenliste
│   │   └── performance/                      # Lasttests (Lighthouse, WebPageTest)
│   │       └── test_performance.spec.js      # Test der Performance
│   ├── package.json                          # Node.js-Abhängigkeiten
│   ├── jest.config.js                        # Jest-Konfiguration
│   ├── playwright.config.ts                  # Playwright-Konfiguration
│   └── cypress.config.js                     # Cypress-Konfiguration
│
├── infra/
│   └── docker/                   # Docker-Dateien (ohne docker-compose.yml)
│       ├── backend/              # Dockerfile für Django
│       │   ├── .dockerignore     # Ausschlüsse für das Backend
│       │   ├── Dockerfile        # Dockerfile für das Backend
│       │   └── entrypoint.sh     # Server-Startskript
│       ├── frontend/             # Dockerfile für das Frontend
│       │   ├── .dockerignore     # Ausschlüsse für das Frontend
│       │   └── Dockerfile        # Dockerfile für das Frontend
│       └── nginx.conf            # Nginx-Konfiguration
│
├── tests/                        # Globale Tests (E2E, Performance)
│   ├── load_tests/               # Lasttests
│   └── contract_tests/           # API-Vertragstests
│
├── .github/                      # Automatisierungs- und Community-Dateien
│   ├── ISSUE_TEMPLATE/
│   │   ├── bug_report.md         # Bug-Report-Vorlage
│   │   └── feature_request.md    # Feature-Request-Vorlage
│   ├── PULL_REQUEST_TEMPLATE.md  # Pull-Request-Vorlage
│   ├── SECURITY.md               # Sicherheitsrichtlinie
│   └── CODEOWNERS                # Codeverantwortliche
│
├── docs/                                  # Projektdokumentation
│   ├── OVERVIEW.md                        # Hauptüberblick über das Projekt
│   ├── planned/                           # Geplante Funktionalität (noch nicht implementiert)
│   │   ├── features.md                    # Zukünftige MVP-Features (WIP)
│   │   ├── architecture/                  # Geplante Architektur
│   │   │   ├── er-diagram-planned.svg     # Geplantes ER-Diagramm der Datenbank
│   │   │   ├── server-diagram-planned.svg # Vorgeschlagenes Deployment-Konzept
│   │   │   └── architecture-planned.md    # Beschreibung der geplanten Architektur
│   │   └── api-spec.md                    # Geplante API-Änderungen
│   ├── developers/                        # Dokumentation für Entwickler
│   │   ├── api/                           # API-Dokumentation
│   │   │   ├── openapi.yaml               # OpenAPI-Spezifikation
│   │   │   └── endpoints.md               # Benutzerfreundliche API-Beschreibung
│   │   ├── db-schema/                     # Datenbank
│   │   │   ├── db-schema.md               # Beschreibung der Datenbankstruktur (SQL)
│   │   │   ├── db-schema.dbml             # DBML-Beschreibung der Datenbank
│   │   │   ├── migrations.md              # Verwaltung von Migrationen
│   │   │   └── er-diagram.svg             # Aktuelles ER-Diagramm
│   │   ├── deployment/                    # Anleitungen zum Deployment
│   │   │   ├── docker.md                  # Deployment via Docker
│   │   │   ├── ci-cd.md                   # CI/CD-Automatisierung
│   │   │   └── server-diagram.svg         # Tatsächliches Server-Deployment
│   │   ├── testing/                       # Testdokumentation
│   │   │   ├── strategy.md                # Allgemeine Teststrategie
│   │   │   ├── backend.md                 # Backend-Tests
│   │   │   └── frontend.md                # Frontend-Tests
│   │   ├── design/                        # UI/UX-Design
│   │   │   ├── wireframes/                # Visuelle Schemata des Interfaces
│   │   │   └── figma-link.md              # Link zum Figma-Design
│   │   ├── git-branches.md                # Wie Git-Branches funktionieren
│   │   ├── best-practices.md              # Code-Stil, Versionierung und Best Practices
│   │   ├── contributors.md                # Informationen für Entwickler
│   │   └── features.md                    # Fertige MVP-Features (DONE)
│   └── users/                             # Dokumentation für Benutzer
│       ├── getting-started.md             # Wie man OmniTaskPlanner benutzt
│       ├── user-manual.md                 # UI-Anleitung
│       ├── shortcuts.md                   # Tastenkürzel und nützliche Funktionen
│       └── troubleshooting.md             # Fehlerbehebung
│
├── docker-compose.yml            # Container-Zusammenstellung
├── .env                          # Umgebungsvariablen
├── .gitignore                    # Git-ignored Dateien
├── README.md                     # Hauptdokumentation des Projekts
├── LICENSE                       # Projektlizenz
├── CODE_OF_CONDUCT.md            # Verhaltenskodex
├── CONTRIBUTING.md               # Leitfaden für Entwickler
├── SECURITY.md                   # Sicherheitsrichtlinie
├── CHANGELOG.md                  # Änderungshistorie
├── MAINTAINERS.md                # Projektverantwortliche
├── ROADMAP.md                    # Entwicklungsplan
└── FAQ.md                        # Häufig gestellte Fragen

```

---

# <span id="russian">Планируемая структура директорий проекта OmniTaskPlanner</span>

```plaintext
OmniTaskPlanner/
│
├── backend/                      # Основной код бэкенда (Django)
│   ├── apps/                     # Django-приложения
│   │   ├── tasks/                # Объединённое приложение (Tasks + Tags + Categories + Time Blocks)
│   │   │   ├── models/           # Разбиваем модели по файлам
│   │   │   │   ├── __init__.py   # Импортируем все модели
│   │   │   │   ├── task.py       # Модель задач
│   │   │   │   ├── category.py   # Модель категорий
│   │   │   │   ├── tag.py        # Модель тегов
│   │   │   │   └── timeblock.py  # Модель тайм-блоков
│   │   │   ├── serializers/      # Разбиваем сериализаторы
│   │   │   │   ├── __init__.py
│   │   │   │   ├── task.py       # Сериализатор задач
│   │   │   │   ├── category.py   # Сериализатор категорий
│   │   │   │   ├── tag.py        # Сериализатор тегов
│   │   │   │   └── timeblock.py  # Сериализатор тайм-блоков
│   │   │   ├── views/            # **Разбиваем вьюшки**
│   │   │   │   ├── __init__.py
│   │   │   │   ├── task.py       # Вьюшки задач
│   │   │   │   ├── category.py   # Вьюшки категорий
│   │   │   │   ├── tag.py        # Вьюшки тегов
│   │   │   │   └── timeblock.py  # Вьюшки тайм-блоков
│   │   │   ├── services/         # Бизнес-логика (чтобы не загромождать вью)
│   │   │   │   ├── __init__.py
│   │   │   │   ├── task.py       # Бизнес-логика задач
│   │   │   │   ├── category.py   # Бизнес-логика категорий
│   │   │   │   ├── tag.py        # Бизнес-логика тегов
│   │   │   │   └── timeblock.py  # Бизнес-логика тайм-блоков
│   │   │   └── tests/            # Тесты
│   │   │       ├── unit/         # Юнит-тесты
│   │   │       ├── integration/  # Интеграционные тесты
│   │   │       └── e2e/          # End-to-End тесты
│   │   ├── users/                # Отдельное приложение для пользователей
│   │   │   ├── models.py         # Модель пользователя
│   │   │   ├── serializers.py    # API-сериализаторы
│   │   │   ├── services.py       # Бизнес-логика пользователей
│   │   │   └── views.py          # API-вьюшки
│   │   └── admin_panel/
│   │       ├── __init__.py
│   │       ├── actions.py        # Кастомные действия в админке
│   │       ├── filters.py        # Фильтры для Django Admin
│   │       ├── mixins.py         # Расширения и утилиты для повторного использования в админке
│   │       ├── forms.py          # Формы для админки
│   │       ├── task/
│   │       │   ├── __init__.py
│   │       │   └── admin.py      # Админка для задач
│   │       ├── category/
│   │       │   ├── __init__.py
│   │       │   └── admin.py      # Админка для категорий
│   │       ├── tag/
│   │       │   ├── __init__.py
│   │       │   └── admin.py      # Админка для тегов
│   │       ├── timeblock/
│   │       │   ├── __init__.py
│   │       │   └── admin.py      # Админка для тайм-блоков
│   │       ├── user/             
│   │       │   ├── __init__.py
│   │       │   └── admin.py      # Админка для пользователей
│   │       └── tests/            # Тесты
│   │           ├── test_access.py           # Тестируем доступ в админку
│   │           ├── test_task_admin.py       # Тестируем отображение и CRUD операций в TaskAdmin
│   │           ├── test_admin_actions.py    # Тестируем кастомные экшены
│   │           ├── test_category_admin.py   # Тестируем админку категорий
│   │           ├── test_tag_admin.py        # Тестируем админку тегов
│   │           └── test_timeblock_admin.py  # Тестируем админку тайм-блоков
│   ├── common/                    # Общие утилиты
│   │   ├── choices/               # Модуль с choices
│   │   │   ├── __init__.py
│   │   │   ├── task.py            # Выборы для Task
│   │   │   ├── category.py        # Выборы для Category
│   │   │   ├── tag.py             # Выборы для Tag
│   │   │   ├── timeblock.py       # Выборы для TimeBlock
│   │   │   └── user.py            # Выборы для User
│   │   ├── middlewares/           # Модуль middleware
│   │   │   ├── __init__.py        # Для импорта как Python-модуля
│   │   │   ├── request_logger.py  # Логирование запросов
│   │   │   ├── auth_middleware.py # Дополнительные проверки авторизации
│   │   │   └── security.py        # Дополнительные меры безопасности
│   │   ├── utils.py               # Вспомогательные функции
│   │   └── validators.py          # Общие валидаторы
│   ├── routers/
│   │   ├── __init__.py 
│   │   ├── tasks.py               # Роутеры для задач
│   │   ├── users.py               # Роутеры для пользователей
│   │   └── admin.py               # Роутеры для админки
│   ├── config/                    # Конфигурация Django
│   └── manage.py                  # Точка входа Django
│
├── frontend/                                 # Фронтенд (React/Vue)
│   ├── src/                                  # Исходный код фронта
│   │   ├── components/                       # Компоненты
│   │   │   ├── TaskCard.vue                  # Компонент задачи (Vue)
│   │   │   ├── TaskCard.tsx                  # Компонент задачи (React)
│   │   │   └── __tests__/                    # Unit-тесты компонентов
│   │   │       ├── test_task_card.spec.js    # Тест TaskCard.vue (Vue)
│   │   │       └── test_task_card.tsx        # Тест TaskCard.tsx (React)
│   │   ├── pages/                            # Страницы
│   │   │   ├── TaskList.vue                  # Страница списка задач (Vue)
│   │   │   ├── TaskList.tsx                  # Страница списка задач (React)
│   │   │   └── __tests__/                    # Unit-тесты страниц
│   │   │       ├── test_task_list.spec.js    # Тест TaskList.vue (Vue)
│   │   │       └── test_task_list.tsx        # Тест TaskList.tsx (React)
│   │   └── store/                            # Хранилище состояния (Vuex, Pinia, Redux)
│   │       ├── taskStore.js                  # Vuex store для задач
│   │       ├── taskSlice.ts                  # Redux slice для задач
│   │       └── __tests__/                    # Тесты состояния (Redux, Vuex)
│   │           ├── test_task_store.js        # Тест taskStore.js (Vuex)
│   │           └── test_task_slice.ts        # Тест taskSlice.ts (Redux)
│   ├── public/                               # Папка со статическими файлами
│   ├── tests/                                # Глобальные тесты фронта
│   │   ├── integration/                      # Интеграционные тесты
│   │   │   ├── test_api_integration.spec.js  # Проверка API-интеграции
│   │   │   └── test_task_list_integration.js # Тесты списка задач
│   │   ├── e2e/                              # End-to-End тесты (Cypress, Playwright)
│   │   │   ├── test_add_task.spec.js         # Проверка UI добавления задачи
│   │   │   └── test_task_list.spec.js        # Проверка UI списка задач
│   │   └── performance/                      # Нагрузочные тесты (Lighthouse, WebPageTest)
│   │       └── test_performance.spec.js      # Проверка производительности
│   ├── package.json                          # Зависимости Node.js
│   ├── jest.config.js                        # Конфигурация Jest
│   ├── playwright.config.ts                  # Конфигурация Playwright
│   └── cypress.config.js                     # Конфигурация Cypress
│
├── infra/
│   └── docker/                  # Docker-файлы (без `docker-compose.yml`)
│       ├── backend/             # Dockerfile для Django
│       │   ├── .dockerignore    # Исключения для бэкенда
│       │   ├── Dockerfile       # Dockerfile для бэкенда
│       │   └── entrypoint.sh    # Скрипт запуска сервера
│       ├── frontend/            # Dockerfile для фронтенда
│       │   ├── .dockerignore    # Исключения для фронтенда
│       │   └── Dockerfile       # Dockerfile для фронтенда
│       └── nginx.conf           # Конфигурация Nginx
│
├── tests/                # Глобальные тесты (E2E, Performance)
│   ├── load_tests/       # Нагрузочное тестирование
│   └── contract_tests/   # Контрактные тесты API
│
├── .github/                      # Автоматизация и community-файлы
│   ├── ISSUE_TEMPLATE/           # Шаблоны для issue
│   │   ├── bug_report.md         # Шаблон баг-репорта
│   │   └── feature_request.md    # Шаблон предложения фичи
│   ├── PULL_REQUEST_TEMPLATE.md  # Шаблон Pull Request'ов
│   ├── SECURITY.md               # Политика безопасности
│   └── CODEOWNERS                # Кто отвечает за код
│
│── docs/                                  # Документация проекта
│   ├── OVERVIEW.md                        # Основной обзор проекта
│   ├── planned/                           # Планируемый функционал (ещё не реализовано)
│   │   ├── features.md                    # Будущие фичи MVP (WIP)
│   │   ├── architecture/                  # Ожидаемая архитектура
│   │   │   ├── er-diagram-planned.svg     # Планируемая ER-диаграмма базы
│   │   │   ├── server-diagram-planned.svg # Концепция деплоя (предполагаемая)
│   │   │   └── architecture-planned.md    # Описание архитектуры (ожидаемая)
│   │   └── api-spec.md                    # Запланированные изменения API
│   ├── developers/                        # Документация для разработчиков
│   │   ├── api/                           # API-документация
│   │   │   ├── openapi.yaml               # OpenAPI спецификация API
│   │   │   └── endpoints.md               # Человеческое описание API
│   │   ├── db-schema/                     # База данных
│   │   │   ├── db-schema.md               # Описание структуры БД (SQL)
│   │   │   ├── db-schema.dbml             # DBML-описание БД
│   │   │   ├── migrations.md              # Как управлять миграциями
│   │   │   └── er-diagram.svg             # Актуальная ER-диаграмма
│   │   ├── deployment/                    # Инструкции по деплою
│   │   │   ├── docker.md                  # Разворачивание через Docker
│   │   │   ├── ci-cd.md                   # Автоматизация CI/CD
│   │   │   └── server-diagram.svg         # Реальный серверный деплой
│   │   ├── testing/                       # Документация по тестированию
│   │   │   ├── strategy.md                # Общая стратегия тестирования
│   │   │   ├── backend.md                 # Тестирование бэкенда
│   │   │   └── frontend.md                # Тестирование фронтенда
│   │   ├── design/                        # UI/UX-дизайн
│   │   │   ├── wireframes/                # Визуальные схемы интерфейса
│   │   │   └── figma-link.md              # Ссылка на макет в Figma
│   │   ├── git-branches.md                # Как работают ветки в Git
│   │   ├── best-practices.md              # Кодстайл, версионирование и лучшие практики
│   │   ├── contributors.md                # Информация для разработчиков
│   │   └── features.md                    # Готовые фичи MVP (DONE)
│   └── users/                             # Документация для пользователей
│       ├── getting-started.md             # Как начать пользоваться OmniTaskPlanner
│       ├── user-manual.md                 # Гайд по UI
│       ├── shortcuts.md                   # Горячие клавиши и удобные функции
│       └── troubleshooting.md             # Как решать проблемы
│
├── docker-compose.yml     # Компоновка контейнеров
├── .env                   # Переменные окружения
├── .gitignore             # Игнорируемые файлы Git
├── README.md              # Основная документация проекта
├── LICENSE                # Лицензия проекта
├── CODE_OF_CONDUCT.md     # Кодекс поведения
├── CONTRIBUTING.md        # Гайд для разработчиков
├── SECURITY.md            # Политика безопасности
├── CHANGELOG.md           # История изменений
├── MAINTAINERS.md         # Ответственные за проект
├── ROADMAP.md             # План разработки
└── FAQ.md                 # Часто задаваемые вопросы

```
