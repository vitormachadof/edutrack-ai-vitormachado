# calculate-progress Design

## Visão Geral

O script `scripts/calculate_progress.py` fornecerá uma função reutilizável para calcular a porcentagem de progresso com base em itens concluídos e total de itens. O resultado será retornado como JSON para facilitar a integração com outros componentes Python ou pipelines automatizados.

## Comportamento Esperado

- Entrada mínima:
  - `completed` (int ou float)
  - `total` (int ou float)
- Saída esperada:
  - `completed` (valor recebido)
  - `total` (valor recebido)
  - `progress_percentage` (valor calculado)

## Regras de Negócio

- `progress_percentage = (completed / total) * 100` quando `total > 0`.
- Se `total == 0`, `progress_percentage` será `0.0` para evitar divisão por zero.
- O resultado poderá ser arredondado para um número apropriado de casas decimais, por exemplo `2` casas.

## Estrutura do Script

- `calculate_progress(completed, total)`: função principal que calcula e retorna um dicionário Python.
- `to_json(result)`: função auxiliar opcional para converter o resultado em JSON.
- `main()`: função CLI opcional que lê `completed` e `total` de argumentos ou stdin e imprime JSON.

## Localização

- Arquivo: `scripts/calculate_progress.py`

## Observações

- O foco é na implementação de cálculo e retorno JSON; não é necessário criar uma API HTTP neste momento.
- Deve ser possível usar o script tanto em linha de comando quanto como biblioteca Python importável.
