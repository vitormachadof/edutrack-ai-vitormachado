## Why

Professores precisam lançar notas para alunos em atividades específicas, mas o sistema atual não oferece um mecanismo estruturado para registrar essas avaliações. Essa funcionalidade é necessária para suportar o fluxo de avaliação acadêmica dentro da plataforma e permitir que notas sejam atribuídas de forma confiável e auditável.

## What Changes

- Criar nova tabela `activity_grades` para armazenar notas de atividades associadas a aluno, atividade e professor.
- Criar endpoint `POST /activity_grades` para registrar o lançamento de nota.
- Implementar validação de payload para `student_id`, `activity_id`, `grade` e `max_grade`.
- Adicionar controle de acesso para garantir que apenas professores autenticados possam lançar notas.
- Registrar metadados de auditoria: `teacher_id`, `created_at`, `updated_at`.

## Capabilities

### New Capabilities
- `activity-grades-management`: Suportar o registro de notas de alunos em atividades específicas.

### Modified Capabilities
- Nenhuma capacidade existente será modificada diretamente neste change.

## Impact

- **Database**: nova tabela `activity_grades` com relacionamentos para aluno, atividade e professor.
- **APIs**: novo endpoint `POST /activity_grades` para o lançamento de notas.
- **Segurança**: validação de permissões de professor e verificação de autenticação obrigatória.
- **Futuro**: base para relatórios de desempenho, médias por atividade e integrações com funcionalidades de tarefas e avaliações.
