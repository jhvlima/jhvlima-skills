# jhvlima-skills

Minha coleção pessoal de skills reutilizáveis para agentes de IA, com foco em dados, machine learning, automação e desenvolvimento.

As skills descrevem como conduzir um trabalho: decisões, verificações e referências que ajudam o agente a executar a tarefa. Cada pasta tem um `SKILL.md` e os recursos necessários ao seu uso.

## Skills disponíveis

| Skill | Quando usar |
|---|---|
| [solve-data-problems](skills/solve-data-problems/SKILL.md) | Definir a pergunta, explorar dados, escolher um baseline e avaliar a solução. |
| [run-ml-experiments](skills/run-ml-experiments/SKILL.md) | Conduzir experimentos reproduzíveis de ML, com avaliação e controle de vazamento de dados. |
| [maintain-n8n-workflows](skills/maintain-n8n-workflows/SKILL.md) | Manter templates n8n portáveis, sanitizados e compatíveis com o ambiente de destino. |
| [maintain-project-documentation](skills/maintain-project-documentation/SKILL.md) | Atualizar documentação conforme o código e preservar conteúdo escrito manualmente. |
| [safe-git-integration](skills/safe-git-integration/SKILL.md) | Auditar e integrar branches preservando alterações locais. Inclui um script de auditoria. |
| [repo-grounded-study](skills/repo-grounded-study/SKILL.md) | Estudar e explicar um repositório em português a partir do código e dos artefatos reais. |
| [evidence-first-research](skills/evidence-first-research/SKILL.md) | Pesquisar decisões com fontes rastreáveis e separar fatos, inferências e dúvidas. |

`solve-data-problems` orienta o problema completo; `run-ml-experiments` aprofunda treinamento e avaliação. Podem ser usadas juntas.

## Usar em outra máquina

```bash
git clone https://github.com/jhvlima/jhvlima-skills.git
cd jhvlima-skills
```

Em um agente com acesso a arquivos, peça para ler e seguir a skill desejada, por exemplo:

> Leia `skills/solve-data-problems/SKILL.md` e use suas orientações para analisar este projeto.

Se o seu agente possui descoberta automática de skills, copie ou vincule as pastas selecionadas para o diretório de skills reconhecido por ele. Preserve `references/`, `scripts/` e `agents/` quando existirem. Consulte a documentação da ferramenta para configurar a descoberta; o clone sozinho não registra a coleção em todos os agentes.

As instruções principais usam caminhos relativos. `agents/openai.yaml` é metadado específico para ferramentas que reconhecem esse formato; as orientações ficam no `SKILL.md`. A skill de dados referencia a de experimentos como irmã; mantenha ambas nessa organização ou ajuste o vínculo.

## Requisitos

- Leitura de Markdown e acesso ao repositório da tarefa.
- Git e Bash para executar `skills/safe-git-integration/scripts/branch_audit.sh`.
- Python, bibliotecas de dados, n8n e outras ferramentas somente quando a tarefa exigir. Use o ambiente do projeto em que estiver trabalhando.
- Navegação/pesquisa para tarefas que dependam de fontes externas atuais.

Esta coleção não inclui credenciais, ambientes virtuais, dados de clientes nem instalações de ferramentas. Disponibilizar uma skill não concede autorização para publicar, ativar workflows ou modificar produção.

## Verificação local

```bash
python3 scripts/validate_collection.py
bash -n skills/safe-git-integration/scripts/branch_audit.sh
```

A validação da coleção confere nomes, recursos Markdown locais e padrões de caminhos privados. Ela não executa experimentos, integra branches nem valida uma instância n8n.

## Origem e licença

As sete skills foram selecionadas da minha biblioteca pessoal e preparadas com assistência de IA. A versão pública generaliza o contexto de análise documental e exclui referências específicas a clientes e à máquina de desenvolvimento. Não inclui os plugins e bibliotecas de terceiros presentes na biblioteca local.

Licença [MIT](LICENSE). Detalhes de origem e adaptações em [PROVENANCE.md](PROVENANCE.md).
