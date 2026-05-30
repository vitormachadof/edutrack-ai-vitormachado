## Why

Users need a centralized way to register and manage their academic disciplines. Currently, the system lacks a proper subjects database structure, preventing users from organizing and controlling their academic content. This is foundational for building automated workflows and access-controlled features around academic data.

## What Changes

- New subjects database table with structured properties
- User-subject ownership relationships (each subject belongs to one user)
- REST APIs for full subject lifecycle management (Create, Read, Update, Delete)
- Access control layer ensuring users can only access their own subjects
- Database foundation for future automations and integrations

## Capabilities

### New Capabilities
- `subjects-management`: Create, read, update, and delete academic subject records with structured properties (name, description, code, credits, etc.)
- `subject-access-control`: Role-based and user-based access control ensuring users can only manage their own subjects
- `subject-properties`: Define and manage standardized subject attributes including academic identification, descriptive metadata, and organizational data

### Modified Capabilities
<!-- No existing capabilities being modified in this change -->

## Impact

- **Database**: New subjects table with user ownership and structured properties
- **APIs**: New REST endpoints for subjects CRUD operations (GET, POST, PATCH, DELETE)
- **Access Control**: User isolation at the API and data layers
- **Future Systems**: Foundation for automations, integrations, and student enrollment workflows
