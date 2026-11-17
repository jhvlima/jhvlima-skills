# Registro proporcional da análise e dos experimentos

Use o formato que o projeto já mantém. Para uma exploração pequena, bastam notebook ou relatório com fontes e decisões. Para treinos/comparações persistentes, registre um manifesto por execução e vincule os artefatos. Esta é uma lista adaptável, não uma exigência de criar arquivos vazios.

## Contrato do problema

- Pergunta/decisão, usuário do resultado e benefício esperado.
- Tarefa e unidade observada; população, origem e período pretendidos.
- Fatos e suas fontes; hipóteses e decisões pendentes com responsável quando conhecido.
- Critério de sucesso e baseline; registrar “a definir” quando não houver acordo.
- Entradas disponíveis no momento de uso, saída e tratamento de erro/revisão.
- Restrições de acesso, processamento, recursos e fase autorizada.

## Dados e preparação

- Fonte e versão/hash ou assinatura determinística; condição real, sintética ou mista explicitada.
- Quantidades antes/depois dos filtros e motivos, unidades e qualidade dos rótulos.
- Identificadores e grupos; origem das anotações; duplicatas, versões e junções.
- Amostragem e seed quando aplicáveis; ausências e recortes sem representação.
- Transformações e parâmetros, com indicação de onde foram ajustados.

## Execução e avaliação

- Identificador da execução, data, ambiente/dependências e revisão do código ou registro de alterações locais.
- Baseline/modelo, configuração e, quando relevante, versões de extrator, OCR, prompt, taxonomia e pesos.
- Papéis das partições e grupos, datas de corte e verificações de sobreposição; “não aplicável” para exploração sem teste preditivo.
- Métricas e fórmulas, denominadores, recortes, incerteza, limiar e fonte de seleção.
- Erros, recusas, cobertura e entradas não processadas; duração, consumo e revisão quando medidos. Marcar estimativas como tal.
- Identificação de dados já vistos pelo modelo ou usados na escolha; resultado exploratório, validação, teste reservado ou diagnóstico de refit.

## Artefatos e decisão

Relacione entradas, código/notebook, resultados, predições, gráficos e modelo pelo mesmo identificador. Evite dados pessoais desnecessários nos logs; use IDs e referências de acesso controlado quando bastarem.

Registre: o que a execução demonstrou, o que não foi testado e por que a próxima etapa é necessária. Entregue o modelo salvo com transformação e contrato de entrada quando o pedido incluir esse artefato; confira carga e predição. Para refit, vincule o modelo operacional à avaliação anterior sem reutilizar o score em dados vistos como evidência independente.
