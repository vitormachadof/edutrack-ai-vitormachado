# subject-search Specification

## Purpose

Define a search endpoint that filters subjects by name or by overdue academic tasks, while enforcing user ownership and authentication.

## ADDED Requirements

### Requirement: Search subjects by name or overdue tasks
The system SHALL provide a search endpoint that returns subjects for the authenticated user when the subject name matches the query or the subject has overdue tasks.

#### Scenario: Search by subject name
- **WHEN** an authenticated user requests `GET /subjects/search?q=matemática`
- **THEN** the system returns subjects owned by the user whose name matches the query
- **THEN** the system returns HTTP 200

#### Scenario: Search by overdue tasks
- **WHEN** an authenticated user requests `GET /subjects/search?overdue=true`
- **THEN** the system returns subjects owned by the user that have overdue academic tasks
- **THEN** the system returns HTTP 200

#### Scenario: Search by name OR overdue tasks
- **WHEN** an authenticated user requests `GET /subjects/search?q=história&overdue=true`
- **THEN** the system returns subjects owned by the user that match the name query OR have overdue tasks
- **THEN** the system returns HTTP 200

### Requirement: Enforce authentication and ownership
The system SHALL only return subjects owned by the authenticated user.

#### Scenario: Prevent other-user subject access
- **WHEN** an authenticated user calls `GET /subjects/search` with any valid filter
- **THEN** the system does not return subjects belonging to another user
- **THEN** the system returns HTTP 200 with only authorized subjects

### Requirement: Handle no matching subjects
The system SHALL return an empty list when no subjects match the search criteria.

#### Scenario: No matches
- **WHEN** no subject names match and no overdue subjects exist for the user
- **THEN** the system returns an empty list
- **THEN** the system returns HTTP 200
