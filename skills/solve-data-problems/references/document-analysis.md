# Análise e classificação de documentos

## Estabelecer o contexto do projeto

Localize requisitos, inventário de fontes, código de extração, taxonomia e resultados existentes. Diferencie dados medidos, relatos preliminares, hipóteses e decisões aprovadas. Não transfira permissões, categorias ou metas entre clientes ou domínios.

## Preparar um piloto verificável

1. Defina a unidade de análise: página, documento, anexo ou conjunto relacionado.
2. Inventarie formatos, texto nativo versus digitalização, duplicatas, versões, períodos e origens em uma amostra autorizada.
3. Separe classificação de tipo, assunto e extração de campos. Use categorias versionadas e responsáveis pelo domínio.
4. Preserve hash, origem, página e cobertura da extração; mantenha os originais.
5. Monte uma referência revisada por pessoas. Separe documentos relacionados e versões em grupos antes de dividir treino e teste.
6. Compare regras e modelos com a mesma amostra, entradas e critérios. Meça erros, cobertura, recusas e esforço de revisão.
7. Meça extração, OCR quando necessário, consumo, latência e memória em amostra antes de extrapolar capacidade.

## Interpretar os resultados

Dados sintéticos verificam comportamento de implementação, sem comprovar qualidade no domínio real. Ruído artificial não comprova que OCR foi executado. Concordância entre modelos não substitui uma referência independente.

Falhas e documentos não processados devem permanecer no denominador de cobertura. Informe limitações em documentos longos, formatos mistos e classes desconhecidas. Configure revisão humana para casos ambíguos.

A política de acesso deve abranger texto extraído, índices, buscas e logs. Serviços externos precisam ser compatíveis com a autorização de uso dos dados. Classificar documentos não autoriza eliminá-los nem decidir sua destinação.
