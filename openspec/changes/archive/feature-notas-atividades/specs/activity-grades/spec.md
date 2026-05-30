# activity-grades Specification

## Purpose

Define a capacidade de registrar notas de alunos para atividades específicas, preservando informação de aluno, atividade, professor e auditoria.

## ADDED Requirements

### Requirement: Registrar nota de atividade
The system SHALL allow a teacher to submit a grade for a student for a specific activity using POST /activity_grades.

#### Scenario: Professor lança nota de atividade
- **WHEN** a teacher submits a grade for a student and activity
- **THEN** the system stores the grade with `student_id`, `activity_id`, `teacher_id`, `grade`, `max_grade`, `comments`, `created_at` and `updated_at`
- **THEN** the system returns HTTP 201 with the created grade record

### Requirement: Validar entrada de nota
The system SHALL validate required fields and grade range before storing the activity grade.

#### Scenario: nota fora do intervalo
- **WHEN** the teacher submits a grade below 0 or above `max_grade`
- **THEN** the system returns HTTP 400 with a validation error

### Requirement: Proteger lançamento de notas
The system SHALL allow only authenticated teachers to submit activity grades.

#### Scenario: usuário não autorizado tenta lançar nota
- **WHEN** a non-teacher user submits a grade
- **THEN** the system returns HTTP 403 Forbidden
