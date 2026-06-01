## Why

Users need a fast way to find academic subjects either by subject name or by whether they have overdue tasks. Today, the system only supports generic subject listing and no combined search across subjects and academic task status, which makes it harder for students to identify at-risk courses.

## What Changes

- Add a new search endpoint `GET /subjects/search` under the existing `edutrack-ai` API group.
- Support query parameter `q` for case-insensitive partial matching on subject name.
- Support query parameter `overdue=true` to return subjects that have overdue academic tasks for the authenticated user.
- Integrate Python-based overdue-task logic to compute subject IDs with overdue tasks and combine that with subject name filtering.
- Enforce authentication and user ownership so users only search within their own subjects.

## Impact

- API: new search endpoint for subjects
- Functions: new Python helper to compute overdue subject IDs from `academic_tasks`
- Data model: reuse existing `subject` and `academic_tasks` tables
- User experience: faster discovery of subjects by name and immediate visibility into overdue academic work
