## 1. Database Setup

- [x] 1.1 Create subjects table in Xano with columns: id, user_id, name, code, description, credits, semester, status, created_at, updated_at
- [x] 1.2 Set up user_id foreign key relationship to users table
- [x] 1.3 Create unique constraint on (user_id, code) to ensure code uniqueness per user
- [x] 1.4 Create indexes on user_id for query performance
- [x] 1.5 Set up default values: status='active', created_at and updated_at to current timestamp

## 2. Create Subject Endpoint

- [x] 2.1 Create POST /api/subjects endpoint in Xano REST API builder
- [x] 2.2 Add authentication check to POST endpoint (verify user_id from request scope)
- [x] 2.3 Implement required field validation (name, code) in POST endpoint
- [x] 2.4 Implement optional field handling (description, credits, semester) in POST endpoint
- [x] 2.5 Add user_id assignment from authenticated user context
- [x] 2.6 Return HTTP 201 with created subject data
- [x] 2.7 Test endpoint with valid and invalid data

## 3. Read Subject Endpoints

- [x] 3.1 Create GET /api/subjects endpoint to list all user's subjects
- [x] 3.2 Add authentication check to GET /api/subjects endpoint
- [x] 3.3 Implement filter by user_id (user can only see their own subjects)
- [x] 3.4 Add support for status filtering query parameter
- [x] 3.5 Implement pagination support (limit, offset parameters)
- [x] 3.6 Create GET /api/subjects/{id} endpoint to retrieve single subject
- [x] 3.7 Add authentication and ownership validation to GET /api/subjects/{id}
- [x] 3.8 Return HTTP 403 if user doesn't own the subject
- [x] 3.9 Test endpoints with owned and non-owned subjects

## 4. Update Subject Endpoint

- [x] 4.1 Create PATCH /api/subjects/{id} endpoint in Xano
- [x] 4.2 Add authentication and ownership validation checks
- [x] 4.3 Implement field-level update logic (allow updating name, description, credits, semester, status)
- [x] 4.4 Protect user_id field from modification (prevent privilege escalation)
- [x] 4.5 Add validation for updated fields
- [x] 4.6 Update updated_at timestamp on successful modification
- [x] 4.7 Return HTTP 200 with updated subject data
- [x] 4.8 Return HTTP 400 for validation errors
- [x] 4.9 Test endpoint with valid updates and invalid data

## 5. Delete Subject Endpoint

- [x] 5.1 Create DELETE /api/subjects/{id} endpoint in Xano
- [x] 5.2 Add authentication and ownership validation checks
- [x] 5.3 Implement hard delete logic from database
- [x] 5.4 Return HTTP 204 No Content on successful deletion
- [x] 5.5 Return HTTP 404 if subject not found
- [x] 5.6 Test endpoint with owned and non-owned subjects

## 6. Access Control & Security

- [x] 6.1 Verify all endpoints validate user_id from request scope matches subject owner
- [x] 6.2 Verify all endpoints return 401 Unauthorized for unauthenticated requests
- [x] 6.3 Verify all endpoints return 403 Forbidden for unauthorized access (non-owner)
- [x] 6.4 Test that listing endpoints only show user's own subjects
- [x] 6.5 Create automated security test cases for access control

## 7. Testing & Validation

- [x] 7.1 Test all CRUD operations with valid data
- [x] 7.2 Test validation for required fields (name, code)
- [x] 7.3 Test code uniqueness constraint per user
- [x] 7.4 Test that duplicate code from different users is allowed
- [x] 7.5 Test optional fields handling (null, default values)
- [x] 7.6 Test status field values and filtering
- [x] 7.7 Run access control test suite (ownership, authentication)
- [x] 7.8 Test edge cases (empty subjects list, special characters, very long strings)
- [x] 7.9 Verify all HTTP status codes match spec requirements

## 8. Documentation & Deployment

- [x] 8.1 Document API endpoint URLs and methods in README or wiki
- [x] 8.2 Document request/response schemas for each endpoint
- [x] 8.3 Document access control requirements and authentication
- [x] 8.4 Document common error codes and troubleshooting
- [x] 8.5 Deploy endpoints to staging environment
- [x] 8.6 Run smoke tests in staging
- [x] 8.7 Deploy to production
- [x] 8.8 Monitor for errors and access control violations
