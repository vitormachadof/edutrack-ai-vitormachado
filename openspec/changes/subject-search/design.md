# subject-search Design

## Context

The system already stores `subject` and `academic_tasks` records with a `user_id` relationship. Subjects belong to authenticated users, and academic tasks reference subjects by `subject_id`. Overdue tasks are identified by `due_date` in the past and a non-completed status.

## Goal

Provide a dedicated search endpoint that returns the authenticated user’s subjects when either:
- the subject name matches the search query, or
- the subject has one or more overdue tasks.

This endpoint should be user-friendly and performant, using Python logic to compute overdue-task ownership and returning only subjects owned by the current user.

## Decisions

- Endpoint path: `GET /subjects/search`
- Query parameters:
  - `q?` — partial, case-insensitive search on `subject.name`
  - `overdue?=false` — boolean flag to include overdue subjects
- Search semantics:
  - When only `q` is present, return subjects whose name matches the query.
  - When only `overdue=true` is present, return subjects with overdue tasks.
  - When both are present, return subjects that match either condition (OR semantics).
  - When no filters are present, return all subjects for the authenticated user.

## Python Integration

- Create a reusable Python helper that calculates which `subject_id` values are overdue for the authenticated user.
- Overdue tasks are defined as `academic_tasks` records where `due_date < today` and `status != "completed"`.
- The API endpoint will call this helper to resolve overdue subject IDs and use that list when applying the OR filter.

## Access Control

- Require authentication on the search endpoint.
- All results must be scoped to `$auth.id`.
- The overdue-task calculation should also be scoped to the authenticated user’s `academic_tasks`.

## Response

- Return HTTP 200 with a list of matching subject records.
- The payload should include the standard subject fields and only subjects visible to the authenticated user.
- If no subjects match, return an empty list.
