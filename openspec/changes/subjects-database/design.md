## Context

The edutrack-ai system is built on Xano with native user authentication. Currently, there is no subjects database table or associated APIs. Users need to be able to manage their academic disciplines with structured properties and controlled access. The system uses XanoScript for automation and Xano's REST API builder for API endpoints.

## Goals / Non-Goals

**Goals:**
- Create a normalized subjects database table with user ownership
- Implement user-based access control at API and data layers
- Provide REST APIs for complete subject lifecycle management (CRUD)
- Define standardized subject properties (name, description, code, credits, etc.)
- Support future automations and integrations based on subject data

**Non-Goals:**
- Authentication mechanism (using existing Xano native auth)
- Student enrollment workflows (future feature)
- Subject scheduling or timetable management
- Grade or evaluation tracking

## Decisions

**Decision 1: Single Subjects Table with User Foreign Key**
- **Choice**: Create one `subjects` table with a `user_id` foreign key relationship
- **Rationale**: Simplifies access control (filter by user_id), ensures clear ownership, avoids data duplication
- **Alternative Considered**: Separate per-user tables (rejected: high complexity, poor scalability)

**Decision 2: Structured Subject Properties**
- **Choice**: Include fields: `id`, `user_id`, `name`, `description`, `code`, `credits`, `semester`, `status`, `created_at`, `updated_at`
- **Rationale**: Provides sufficient structure for academic management while remaining flexible for future extensions
- **Alternative Considered**: Minimal fields only (name + id) - rejected: insufficient for real-world academic tracking

**Decision 3: User-Based API Access Control**
- **Choice**: Enforce access control at the API level using Xano request scope variables and conditional filters
- **Rationale**: Leverages Xano's built-in auth system, prevents unauthorized data access early in the request pipeline
- **Alternative Considered**: Application-level checks only (rejected: defense in depth principle)

**Decision 4: Individual CRUD Endpoints per Operation**
- **Choice**: Create separate endpoints for GET (list/retrieve), POST (create), PATCH (update), DELETE
- **Rationale**: RESTful design, clear separation of concerns, easier to audit and document
- **Alternative Considered**: Single endpoint with method overloading (rejected: less clear intent, harder to apply specific validation)

**Decision 5: Soft Delete Not Required Initially**
- **Choice**: Use hard delete for subjects
- **Rationale**: Academic data is typically not sensitive to compliance requirements; simplifies queries and data management
- **Alternative Considered**: Soft delete with status flag (can be added later if retention requirements emerge)

## Risks / Trade-offs

**[Risk] User Isolation at Scale** → Mitigation: Implement database-level indexes on user_id for query performance; monitor API response times

**[Risk] Cascading Deletes** → Mitigation: Document that deleting a subject will cascade to any related records (future); consider soft-delete if integrations depend on audit trails

**[Risk] Property Extensibility** → Mitigation: Plan for a `metadata` JSON field for custom properties without schema migration, added in later iterations

**[Trade-off] Structured vs. Flexible Schema** → By using fixed fields, we gain query efficiency but sacrifice flexibility; can be mitigated by planning a metadata extension point

## Migration Plan

1. Create `subjects` database table in Xano with defined schema
2. Build CRUD API endpoints with access control filters
3. Test with sample data and user isolation scenarios
4. Deploy and monitor for access control violations
5. Document API contracts for client implementation

## Open Questions

- Should subjects support tags/categories for better organization?
- Do we need subject templates or preset structures for common academic scenarios?
- Should there be a soft delete requirement for audit purposes?
