# calculate-progress Specification

## Purpose

Definir a implementação de um script Python que calcule a porcentagem de progresso e retorne o resultado em formato JSON.

## ADDED Requirements

### Requirement: Calcular porcentagem de progresso
The system SHALL calculate progress percentage as completed divided by total and return the result.

#### Scenario: Progresso normal
- **WHEN** the script receives `completed` e `total` com valores válidos
- **THEN** it returns JSON with `completed`, `total`, and `progress_percentage`

### Requirement: Tratar divisão por zero
The system SHALL handle the case when `total` is zero without raising an error.

#### Scenario: Total zero
- **WHEN** the script receives `completed` and `total = 0`
- **THEN** it returns JSON with `progress_percentage` set to `0.0`

### Requirement: Retornar JSON
The system SHALL return the progress result in valid JSON format.

#### Scenario: JSON output
- **WHEN** the script computes progress
- **THEN** the output is valid JSON containing `completed`, `total`, and `progress_percentage`
