## ADDED Requirements

### Requirement: Create a new subject
The system SHALL allow authenticated users to create a new academic subject with required properties.

#### Scenario: User creates a subject with valid data
- **WHEN** an authenticated user submits a POST request to `/api/subjects` with required fields (name, code)
- **THEN** the system creates the subject and returns HTTP 201 with the created subject data including its ID

#### Scenario: User creates a subject with optional fields
- **WHEN** an authenticated user submits a POST request to `/api/subjects` with name, code, description, credits, and semester
- **THEN** the system stores all provided fields and returns the complete subject object

#### Scenario: User attempts to create subject without required fields
- **WHEN** an authenticated user submits a POST request to `/api/subjects` without required fields
- **THEN** the system returns HTTP 400 with validation error details

### Requirement: Retrieve user's subjects
The system SHALL allow authenticated users to retrieve a list of their own subjects with filtering and pagination support.

#### Scenario: User retrieves all their subjects
- **WHEN** an authenticated user makes a GET request to `/api/subjects`
- **THEN** the system returns HTTP 200 with an array of all subjects owned by that user

#### Scenario: User retrieves subjects with filtering
- **WHEN** an authenticated user makes a GET request to `/api/subjects?status=active`
- **THEN** the system returns HTTP 200 with only subjects matching the filter criteria

#### Scenario: User retrieves a specific subject by ID
- **WHEN** an authenticated user makes a GET request to `/api/subjects/{id}` where they own the subject
- **THEN** the system returns HTTP 200 with the subject details

#### Scenario: User attempts to access another user's subject
- **WHEN** an authenticated user makes a GET request to `/api/subjects/{id}` where they do NOT own the subject
- **THEN** the system returns HTTP 403 Forbidden

### Requirement: Update an existing subject
The system SHALL allow authenticated users to update the properties of their own subjects.

#### Scenario: User updates subject properties
- **WHEN** an authenticated user submits a PATCH request to `/api/subjects/{id}` with updated fields
- **THEN** the system updates the subject and returns HTTP 200 with the updated subject data

#### Scenario: User attempts to update another user's subject
- **WHEN** an authenticated user submits a PATCH request to `/api/subjects/{id}` where they do NOT own the subject
- **THEN** the system returns HTTP 403 Forbidden

#### Scenario: User updates subject with invalid data
- **WHEN** an authenticated user submits a PATCH request to `/api/subjects/{id}` with invalid field values
- **THEN** the system returns HTTP 400 with validation error details

### Requirement: Delete a subject
The system SHALL allow authenticated users to permanently delete their own subjects.

#### Scenario: User deletes their subject
- **WHEN** an authenticated user submits a DELETE request to `/api/subjects/{id}` where they own the subject
- **THEN** the system deletes the subject and returns HTTP 204 No Content

#### Scenario: User attempts to delete another user's subject
- **WHEN** an authenticated user submits a DELETE request to `/api/subjects/{id}` where they do NOT own the subject
- **THEN** the system returns HTTP 403 Forbidden

#### Scenario: User deletes a non-existent subject
- **WHEN** an authenticated user submits a DELETE request to `/api/subjects/{id}` where the subject does not exist
- **THEN** the system returns HTTP 404 Not Found
