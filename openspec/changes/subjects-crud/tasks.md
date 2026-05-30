## 1. Endpoints CRUD para subjects

- [x] 1.1 Criar endpoint `POST /subjects` para criar um novo subject.
- [x] 1.2 Criar endpoint `GET /subjects` para listar somente os subjects do usuário autenticado.
- [x] 1.3 Criar endpoint `GET /subjects/{id}` para recuperar um subject específico do usuário autenticado.
- [x] 1.4 Criar endpoint `PATCH /subjects/{id}` para atualizar um subject do usuário autenticado.
- [x] 1.5 Criar endpoint `DELETE /subjects/{id}` para excluir um subject do usuário autenticado.

## 2. Controle de acesso

- [x] 2.1 Adicionar autenticação obrigatória em todos os endpoints de subjects.
- [x] 2.2 Filtrar listagens por `user_id` do usuário autenticado.
- [x] 2.3 Validar que o subject pertence ao usuário antes de permitir `GET /subjects/{id}`, `PATCH` ou `DELETE`.
- [x] 2.4 Retornar HTTP 403 para tentativas de acesso a subjects de outros usuários.
- [x] 2.5 Proteger o campo `user_id` contra modificação em `PATCH`.

## 3. Validação e respostas

- [x] 3.1 Validar campos obrigatórios e tipos na criação e atualização de subjects.
- [x] 3.2 Retornar HTTP 201 no `POST /subjects` com o objeto criado.
- [x] 3.3 Retornar HTTP 200 nos `GET` e `PATCH` com o objeto do subject.
- [x] 3.4 Retornar HTTP 204 no `DELETE` em caso de exclusão bem-sucedida.
