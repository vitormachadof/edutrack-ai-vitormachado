# subjects-crud Specification

## Purpose

Definir os endpoints de CRUD para a tabela `subjects`, garantindo que cada usuário só possa acessar e manipular os seus próprios registros.

## ADDED Requirements

### Requirement: Create subject endpoints
The system SHALL provide a REST API for creating subjects via `POST /subjects`.

#### Scenario: User creates a subject
- **WHEN** an authenticated user submits valid subject data to `POST /subjects`
- **THEN** the system creates the subject with `user_id` set to the authenticated user
- **THEN** the system returns HTTP 201 with the created subject

### Requirement: List only user subjects
The system SHALL return only the subjects owned by the authenticated user in `GET /subjects`.

#### Scenario: User lists subjects
- **WHEN** an authenticated user requests `GET /subjects`
- **THEN** the system returns only subjects where `user_id` matches the authenticated user

### Requirement: Retrieve subject with ownership validation
The system SHALL only allow `GET /subjects/{id}` for subjects owned by the authenticated user.

#### Scenario: User retrieves own subject
- **WHEN** an authenticated user requests `GET /subjects/{id}` for a subject they own
- **THEN** the system returns HTTP 200 with the subject data

#### Scenario: User retrieves another user's subject
- **WHEN** an authenticated user requests `GET /subjects/{id}` for a subject they do not own
- **THEN** the system returns HTTP 403 Forbidden

### Requirement: Update subject with ownership validation
The system SHALL only allow updates with `PATCH /subjects/{id}` for subjects owned by the authenticated user.

#### Scenario: User updates own subject
- **WHEN** an authenticated user submits valid updates to `PATCH /subjects/{id}` for a subject they own
- **THEN** the system updates the subject and returns HTTP 200

#### Scenario: User updates another user's subject
- **WHEN** an authenticated user submits `PATCH /subjects/{id}` for a subject they do not own
- **THEN** the system returns HTTP 403 Forbidden

### Requirement: Delete subject with ownership validation
The system SHALL only allow deletion with `DELETE /subjects/{id}` for subjects owned by the authenticated user.

#### Scenario: User deletes own subject
- **WHEN** an authenticated user requests `DELETE /subjects/{id}` for a subject they own
- **THEN** the system deletes the subject and returns HTTP 204

#### Scenario: User deletes another user's subject
- **WHEN** an authenticated user requests `DELETE /subjects/{id}` for a subject they do not own
- **THEN** the system returns HTTP 403 Forbidden
