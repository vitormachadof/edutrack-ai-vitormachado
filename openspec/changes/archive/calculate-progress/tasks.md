## 1. Criação do Script

- [ ] 1.1 Criar o arquivo `scripts/calculate_progress.py`.
- [ ] 1.2 Implementar a função principal para calcular porcentagem de progresso como `completed / total`.
- [ ] 1.3 Garantir retorno de JSON com os campos: `completed`, `total`, `progress_percentage`.
- [ ] 1.4 Tratar `total = 0` de forma segura, definindo `progress_percentage` como `0.0` ou comportamento equivalente.

## 2. Interface e Uso

- [ ] 2.1 Permitir uso como módulo importado em outros scripts Python.
- [ ] 2.2 Opcional: expor interface CLI simples para calcular progresso a partir de argumentos.
- [ ] 2.3 Documentar o uso básico do script no `README.md` ou no próprio arquivo de script.

## 3. Testes e Validação

- [ ] 3.1 Adicionar testes unitários para casos típicos e borda: `completed < total`, `completed == total`, `completed == 0`, `total == 0`.
- [ ] 3.2 Verificar que o JSON retornado possui os campos esperados e valores numéricos corretos.
- [ ] 3.3 Validar que o script não lança erro em entradas inválidas ou `total = 0`.
