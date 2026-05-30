## Why

Os usuários precisam gerenciar suas disciplinas por meio de APIs REST seguras, garantindo que apenas o proprietário de cada disciplina possa ler, atualizar ou excluir os seus dados. Sem esse controle, há risco de exposição e alteração indevida de `subjects` pertencentes a outros usuários.

## What Changes

- Criar endpoints CRUD para a entidade `subjects`:
  - `POST /subjects`
  - `GET /subjects`
  - `GET /subjects/{id}`
  - `PATCH /subjects/{id}`
  - `DELETE /subjects/{id}`
- Adicionar autenticação obrigatória em todos os endpoints.
- Filtrar resultados por `user_id` para que cada usuário veja apenas os seus próprios subjects.
- Implementar validação de posse para operações de leitura, atualização e exclusão.
- Proteger o campo `user_id` contra alteração indevida via PATCH.

## Capabilities

### New Capabilities
- `subjects-crud-api`: API REST de subjects com suporte a criação, leitura, atualização e remoção.

### Modified Capabilities
- `subjects-management`: reforçar controle de acesso para garantir que cada usuário gerencie apenas seus próprios subjects.

## Impact

- **APIs**: novos endpoints CRUD para `subjects`.
- **Segurança**: ownership enforcement em todas as operações de subjects.
- **Data**: listagens e consultas comportam-se com filtro por `user_id`.
- **UX**: usuário não pode acessar ou modificar disciplinas de terceiros.
