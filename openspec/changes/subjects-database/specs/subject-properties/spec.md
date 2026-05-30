## ADDED Requirements

### Requirement: Subject has standardized properties
The system SHALL maintain a standardized set of properties for each subject to enable consistent academic data management.

#### Scenario: Subject stores core identification properties
- **WHEN** a subject is created or retrieved
- **THEN** the system includes id, name, and code properties identifying the subject

#### Scenario: Subject stores academic metadata
- **WHEN** a subject is created or retrieved
- **THEN** the system includes description, credits, and semester properties describing the subject's academic context

#### Scenario: Subject tracks ownership and timestamps
- **WHEN** a subject is created or retrieved
- **THEN** the system includes user_id (owner), created_at, and updated_at properties for audit and relationship tracking

### Requirement: Subject name is required and validated
The system SHALL require that each subject has a non-empty name and validate name format on creation and updates.

#### Scenario: Subject is created with valid name
- **WHEN** a user submits a POST request to `/api/subjects` with a name containing 1-255 characters
- **THEN** the system accepts the name and creates the subject

#### Scenario: Subject creation fails with empty name
- **WHEN** a user attempts to create a subject with an empty or missing name
- **THEN** the system returns HTTP 400 with validation error

#### Scenario: Subject creation fails with excessively long name
- **WHEN** a user attempts to create a subject with a name exceeding 255 characters
- **THEN** the system returns HTTP 400 with validation error

### Requirement: Subject code is required and unique per user
The system SHALL require a subject code and ensure no two subjects with the same code belong to the same user.

#### Scenario: Subject is created with valid code
- **WHEN** a user submits a POST request to `/api/subjects` with a code (e.g., "CS101")
- **THEN** the system accepts the code if no other subject owned by this user has the same code

#### Scenario: Subject creation fails with duplicate code
- **WHEN** a user attempts to create a subject with a code that matches another subject owned by the same user
- **THEN** the system returns HTTP 409 Conflict

#### Scenario: Different users can use the same code
- **WHEN** two different users create subjects with the same code
- **THEN** the system accepts both, as unique constraint is per-user

### Requirement: Subject supports optional academic properties
The system SHALL support optional fields for enriched subject metadata including description, credits, and semester.

#### Scenario: Subject is created with optional properties
- **WHEN** a user submits a POST request with description, credits (0-10 scale), and semester fields
- **THEN** the system stores all provided optional properties

#### Scenario: Subject without optional properties
- **WHEN** a user creates a subject with only required fields (name, code)
- **THEN** the system creates the subject and sets optional fields to null or default values

#### Scenario: Subject properties are updatable
- **WHEN** a user submits a PATCH request to update description or credits of an existing subject
- **THEN** the system updates only the specified properties and preserves unchanged properties

### Requirement: Subject status indicates availability
The system SHALL track subject status (active, inactive, archived) for lifecycle management.

#### Scenario: Subject defaults to active status
- **WHEN** a subject is created without explicitly specifying a status
- **THEN** the system sets status to "active"

#### Scenario: Subject status can be updated
- **WHEN** a user submits a PATCH request to update a subject's status
- **THEN** the system accepts valid status values (active, inactive, archived) and updates the subject

#### Scenario: Inactive subjects still appear in user's subject list
- **WHEN** an authenticated user retrieves their subjects
- **THEN** the system includes all subjects regardless of status, but supports filtering by status
