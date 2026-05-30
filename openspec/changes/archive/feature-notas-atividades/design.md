# feature-notas-atividades Design

## Visão Geral

Esta funcionalidade adiciona o suporte para professores lançarem notas de alunos em atividades específicas. O objetivo é criar um fluxo simples e seguro de registro de avaliações, preservando quem lançou a nota, para qual aluno e em qual atividade.

## Componentes Principais

- **Tabela `activity_grades`**: armazenará as notas de atividades, com campos de auditoria e relacionamento para aluno, atividade e professor.
- **API `POST /activity_grades`**: endpoint responsável por receber e persistir o lançamento de nota.
- **Controle de acesso**: validação de autenticação e perfil de professor antes de permitir o registro.

## Proposta de Modelo de Dados

- `activity_grades`
  - `id` (PK)
  - `student_id` (FK para aluno)
  - `activity_id` (FK para atividade)
  - `teacher_id` (FK para professor)
  - `grade` (valor da nota)
  - `max_grade` (nota máxima da atividade)
  - `comments` (opcional)
  - `created_at`
  - `updated_at`

## API Endpoint

- `POST /activity_grades`
  - Requer autenticação de professor
  - Body esperado:
    - `student_id`
    - `activity_id`
    - `grade`
    - `max_grade`
    - `comments?`
  - Resposta esperada: HTTP 201 com o registro criado

## Requisitos de Segurança

- O endpoint deve validar o contexto autenticado do usuário.
- Deve garantir que apenas perfis de professor possam lançar notas.
- Timestamps e `teacher_id` devem ser gravados para auditoria.

## Observações

Se não existir ainda uma entidade formal de atividades no banco, essa feature poderá depender de um ajuste adicional para modelar `activities` ou mapear a atividade a uma entidade existente. No entanto, o escopo atual foca no lançamento de notas, não na gestão completa de atividades.
