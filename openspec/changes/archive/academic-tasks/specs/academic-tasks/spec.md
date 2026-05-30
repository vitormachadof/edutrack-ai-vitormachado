## ADDED Requirements

### Requirement: Create academic tasks table
The system SHALL create the `academic_tasks` table to store student academic obligations with title, description, due date, status, and subject reference.

#### Scenario: Student registers an academic task
- **WHEN** a student creates a new academic task with title, description, due date, status, and subject_id
- **THEN** the system stores the task in `academic_tasks` with all required fields and returns the created record

### Requirement: Associate tasks with subjects
The system SHALL link each academic task to an existing subject using `subject_id`.

#### Scenario: Task linked to a valid subject
- **WHEN** a student registers a task with a valid `subject_id`
- **THEN** the system saves the task and maintains the reference to the `subjects` table

### Requirement: Support task ownership and status
The system SHALL support ownership by student and record task status for workflow management.

#### Scenario: Task status is tracked correctly
- **WHEN** a task is created with a given `status`
- **THEN** the system stores the status value and allows later filtering by task state
