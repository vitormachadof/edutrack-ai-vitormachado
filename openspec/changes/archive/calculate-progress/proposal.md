## Why

É necessário implementar um utilitário Python capaz de calcular a porcentagem de progresso de uma atividade acadêmica ou fluxo de trabalho, usando a razão entre itens concluídos e total de itens. Esse script facilita a geração de métricas de progresso em formato JSON para consumo por outras partes do sistema.

## What Changes

- Criar um script Python em `scripts/calculate_progress.py`.
- O script SHALL calcular a porcentagem de progresso como `concluídas / total` e formatar o resultado como JSON.
- O script SHALL retornar um JSON com pelo menos os campos `completed`, `total` e `progress_percentage`.
- O script SHALL tratar o caso `total = 0` de forma segura, evitando divisão por zero.

## Capabilities

### New Capabilities
- `progress-calculation-script`: Calcular e expor porcentagens de progresso em formato JSON para uso em integrações e relatórios.

### Modified Capabilities
- Nenhuma capacidade existente será modificada diretamente.

## Impact

- **Scripts**: novo arquivo Python em `scripts/calculate_progress.py`.
- **Integração**: base para chamadas de progresso via CLI, importação de módulo ou execução em pipelines.
- **Qualidade**: tratamento seguro de divisão por zero e retorno padronizado de JSON.
