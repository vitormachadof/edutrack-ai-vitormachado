# academic-tasks Design

## Visão Geral

A tabela `academic_tasks` permitirá que alunos registrem e acompanhem seus compromissos acadêmicos, como lições, provas e trabalhos, associados a disciplinas específicas.

## Modelo de Dados

A tabela terá os seguintes campos principais:

- `title` (text): título da tarefa acadêmica.
- `description` (text): detalhes ou instruções da tarefa.
- `due_date` (date): data de entrega ou conclusão esperada.
- `status` (text): estado da tarefa, como `pending`, `completed` ou `overdue`.
- `subject_id` (int): referência para a disciplina na tabela `subjects`.
- `user_id` (int): vínculo ao aluno proprietário da tarefa.
- `created_at` / `updated_at`: timestamps de auditoria.

## Relacionamentos

- `subject_id` deve referenciar a tabela `subjects` para garantir que cada tarefa esteja vinculada a uma disciplina existente.
- `user_id` deve garantir que cada tarefa pertença a um aluno autenticado e possa ser filtrada por proprietário.

## Observações

O esquema foca nos campos solicitados, adicionando apenas metadados de propriedade e auditoria necessários para gestão segura e contextualizada das obrigações acadêmicas.
