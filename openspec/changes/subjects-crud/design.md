# subjects-crud Design

## Visão Geral

O objetivo é implementar um conjunto de endpoints REST para a entidade `subjects`, onde cada usuário só pode acessar e manipular seus próprios dados. O design reforça ownership em todas as operações e evita que um usuário veja ou altere subjects pertencentes a outra conta.

## Endpoints

- `POST /subjects`
  - Cria um novo subject para o usuário autenticado.
  - Extrai `user_id` do contexto de autenticação.
- `GET /subjects`
  - Lista todos os subjects do usuário autenticado.
  - Aplica filtro por `user_id`.
- `GET /subjects/{id}`
  - Retorna o subject somente se ele pertencer ao usuário autenticado.
- `PATCH /subjects/{id}`
  - Atualiza campos permitidos do subject do usuário autenticado.
  - Não permite alteração de `user_id`.
- `DELETE /subjects/{id}`
  - Exclui o subject somente se for do usuário autenticado.

## Autenticação e Ownership

- Todos os endpoints exigem autenticação.
- O `user_id` do token autenticado deve ser usado como referência para o escopo de dados.
- As consultas `GET`, `PATCH` e `DELETE` devem buscar o subject com `id = {id} AND user_id = current_user_id`.
- O `POST /subjects` deve atribuir `user_id` automaticamente ao novo subject.
- Em `PATCH`, evitar que o payload contenha `user_id` ou ignorar esse campo se presente.

## Modelagem de Dados

A tabela `subjects` já deve possuir um campo `user_id` associando cada subject ao seu dono. Essa associação é a base para o filtro de acesso.

## Respostas e Status

- `POST /subjects`: HTTP 201 com o subject criado.
- `GET /subjects`: HTTP 200 com a lista de subjects do usuário.
- `GET /subjects/{id}`: HTTP 200 com o subject ou HTTP 403/404 se não autorizado ou não existir.
- `PATCH /subjects/{id}`: HTTP 200 com o subject atualizado ou HTTP 403 se não autorizado.
- `DELETE /subjects/{id}`: HTTP 204 ou HTTP 403 se o subject não pertencer ao usuário.
