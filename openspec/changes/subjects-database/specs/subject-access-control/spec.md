## ADDED Requirements

### Requirement: User isolation for subject data
The system SHALL ensure that each user can only access and modify their own subjects, not other users' subjects.

#### Scenario: User can retrieve only their own subjects
- **WHEN** an authenticated user makes a GET request to `/api/subjects`
- **THEN** the system returns only subjects where the authenticated user is the owner (user_id matches)

#### Scenario: User cannot retrieve another user's subject
- **WHEN** an authenticated user attempts to GET `/api/subjects/{id}` where the subject belongs to another user
- **THEN** the system returns HTTP 403 Forbidden and does not expose that the subject exists

#### Scenario: User cannot modify another user's subject
- **WHEN** an authenticated user attempts to PATCH or DELETE a subject that belongs to another user
- **THEN** the system returns HTTP 403 Forbidden and prevents any modifications

### Requirement: Authentication requirement for all subject endpoints
The system SHALL require valid authentication for all subject management endpoints.

#### Scenario: Unauthenticated request to list subjects
- **WHEN** an unauthenticated request is made to GET `/api/subjects`
- **THEN** the system returns HTTP 401 Unauthorized

#### Scenario: Unauthenticated request to create subject
- **WHEN** an unauthenticated request is made to POST `/api/subjects`
- **THEN** the system returns HTTP 401 Unauthorized

#### Scenario: Unauthenticated request to retrieve specific subject
- **WHEN** an unauthenticated request is made to GET `/api/subjects/{id}`
- **THEN** the system returns HTTP 401 Unauthorized

### Requirement: Subject ownership validation
The system SHALL validate that the authenticated user owns the subject before allowing any modifications or detailed access.

#### Scenario: System validates ownership on update
- **WHEN** an authenticated user submits a PATCH request to `/api/subjects/{id}`
- **THEN** the system verifies that user_id in the request scope matches the subject's user_id before allowing the update

#### Scenario: System validates ownership on delete
- **WHEN** an authenticated user submits a DELETE request to `/api/subjects/{id}`
- **THEN** the system verifies that user_id in the request scope matches the subject's user_id before allowing the deletion

#### Scenario: System prevents privilege escalation
- **WHEN** an authenticated user attempts to update a subject's user_id field to assign it to another user
- **THEN** the system either ignores the user_id field or returns an error, maintaining original ownership
