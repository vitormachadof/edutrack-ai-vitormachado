## 1. Search endpoint

- [x] 1.1 Create `GET /subjects/search` in the `edutrack-ai` API group.
- [x] 1.2 Add optional query parameter `q` for case-insensitive partial matching on subject name.
- [x] 1.3 Add optional query parameter `overdue` to include subjects with overdue academic tasks.
- [x] 1.4 Implement OR semantics so results match name search OR overdue-task subjects.

## 2. Python overdue logic

- [x] 2.1 Create a Python helper that computes overdue `subject_id` values for the authenticated user.
- [x] 2.2 Define overdue tasks as `due_date < today` and `status != "completed"`.
- [x] 2.3 Ensure the Python helper is reusable and can be called from the search endpoint.

## 3. Auth and access control

- [x] 3.1 Require authentication for the new search endpoint.
- [x] 3.2 Restrict all returned subjects to the authenticated user.
- [x] 3.3 Restrict overdue-task calculation to the authenticated user's academic tasks.

## 4. Validation and response

- [x] 4.1 Return HTTP 200 with the filtered list of subjects.
- [x] 4.2 Return an empty list when no subjects match.
- [x] 4.3 Document the endpoint semantics so future clients understand the OR filter behavior.
