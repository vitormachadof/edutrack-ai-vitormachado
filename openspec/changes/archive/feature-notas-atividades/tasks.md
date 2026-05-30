## 1. Modelagem de Dados

- [ ] 1.1 Criar tabela `activity_grades` com colunas: `id`, `student_id`, `activity_id`, `teacher_id`, `grade`, `max_grade`, `comments`, `created_at`, `updated_at`.
- [ ] 1.2 Definir relacionamento `student_id` com a entidade de aluno existente e `activity_id` com a entidade de atividade.
- [ ] 1.3 Garantir `teacher_id` como referência ao professor que lançou a nota.
- [ ] 1.4 Adicionar índices em `student_id`, `activity_id` e `teacher_id` para desempenho de consultas.

## 2. Endpoint para Lançar Nota

- [ ] 2.1 Criar endpoint `POST /activity_grades` no Xano REST API.
- [ ] 2.2 Autenticar o usuário e verificar que ele possui permissão de professor.
- [ ] 2.3 Validar campos obrigatórios: `student_id`, `activity_id`, `grade` e `max_grade`.
- [ ] 2.4 Validar que `grade` está no intervalo válido entre `0` e `max_grade`.
- [ ] 2.5 Verificar existência do aluno e da atividade referenciados.
- [ ] 2.6 Registrar a nota com `teacher_id` extraído do contexto autenticado.
- [ ] 2.7 Retornar HTTP 201 com o registro de nota criado.

## 3. Segurança e Auditoria

- [ ] 3.1 Garantir que apenas professores autenticados possam usar o endpoint.
- [ ] 3.2 Proteger contra lançamento de notas por usuários não autorizados.
- [ ] 3.3 Registrar timestamps de criação e atualização.
- [ ] 3.4 Prevenir lançamentos duplicados para o mesmo aluno/atividade se a regra de negócio exigir ou documentar o comportamento esperado.
