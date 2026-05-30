## Why

Os alunos precisam registrar e gerenciar suas obrigações acadêmicas (lições, provas, trabalhos) vinculadas a cada disciplina. Sem uma tabela dedicada, a plataforma não consegue armazenar essas tarefas de forma estruturada e relacioná-las corretamente com a disciplina e o aluno.

## What Changes

- Criar nova tabela `academic_tasks` para armazenar obrigações acadêmicas dos alunos.
- Definir os campos principais: `title`, `description`, `due_date`, `status`, `subject_id`.
- Estabelecer relacionamento `subject_id` com a tabela `subjects` existente.
- Incluir metadados de auditoria e propriedade do aluno para suportar gestão pessoal de tarefas.

## Capabilities

### New Capabilities
- `academic-tasks-management`: Permitir que estudantes registrem e gerenciem atividades acadêmicas por disciplina.

### Modified Capabilities
- Nenhuma capacidade existente será alterada diretamente neste change.

## Impact

- **Database**: nova tabela `academic_tasks` com vínculo a `subjects` e atributos de gerenciamento de tarefas.
- **Modelagem**: suporte a título, descrição, prazo, status e disciplina para cada tarefa.
- **Futuro**: base para APIs de criação/atualização de tarefas e relatórios de pendências acadêmicas.
